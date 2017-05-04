//
//  MapViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 4/24/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    // This variable will be populated with the address associated with a building code
    var sentAddress:String = ""
    // This variable will hold the address parameter, used for the geocoding api call as
    // well as the "Launch with Google Maps" button links
    var tempUrlBuild = ""
    
    // Button will launch Google Maps app if it is on phone, or website if it is not
    @IBAction func launchGoogleMapsButton(_ sender: UIBarButtonItem) {
        print("button pressed") // testing
        // if the phone has Google Maps downloaded, launch it with the destination 
        // address as the address associated with the building code
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            UIApplication.shared.openURL(URL(string:
                "comgooglemaps://?daddr="+tempUrlBuild)!)
        }
        // if the app does not exist then open the web app with the address loaded
        else {
            UIApplication.shared.openURL(URL(string:"https://www.google.com/maps/place/"+tempUrlBuild)!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.sentAddress // set the navigation title as the simple address
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This is needed to refresh the table's contents after adding a new classroom
    override func viewWillAppear(_ animated: Bool) {
        // tells nav controller to make toolbar appear on the bottom of the screen
        self.navigationController?.isToolbarHidden = false;
        
    }
    
    // Displays Google Map
    override func loadView() {
        
        // map is initially loaded centered on NYC, marker is initialized
        // will be moved when address coordinates are found with geocoding api
        let camera = GMSCameraPosition.camera(withLatitude:40.7308228 , longitude:-73.997332, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        
        
        sentAddress = addressToSend // holds value of address sent
        
        // Base of url that will be sent with URLSession and receive info from geocoding api
        var urlBuild = "https://maps.googleapis.com/maps/api/geocode/json?address="
        
        // build the address section here, take the simple address, get the detailed address
        // put +'s in for spaces, add to the urlBuild in place of this line
        // Ex: "108 Broadway, NY, NY" --> "108+Broadway,+NY,+NY"
        for i in detailedToSend.characters {
            if i == " " {
                tempUrlBuild += "+"
            }
            else {
                tempUrlBuild += String(i)
            }
        }
        
        // adds the api key to the end of the url for request
        urlBuild += tempUrlBuild
        urlBuild += "&key=" + gcAPIKey 
        
        print(urlBuild) // prints to console for testing
        
        // these variables will eventually be populated with the true coordinates of the building code
        // then the map will be moved to these coordinates and the marker will be placed there
        var inLat:Double = 0.0
        var inLng:Double = 0.0
        
        
        let url = URL(string: urlBuild) // url object holds the original urlBuild string

        // HTTP request is created for the geocoding api (address --> coordinates)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            // if something goes wrong report it
            if error != nil {
                print("error")
            }
            else {
                if let content = data {
                    do {
                        // takes data and attemps to turn it into a JSON object stored locally
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        // peels through JSON layers to get to coordinates
                        if let results = JSON["results"] as? NSArray {
                            if let address_components = results[0] as? NSDictionary {
                                if let geometry = address_components["geometry"] as? NSDictionary {
                                    if let location = geometry["location"] as? NSDictionary {
                                        // parse the lat and lng values here, convert them to doubles
                                        // use them to center the map and put down the marker
                                        let strLat:NSNumber = (location["lat"] as? NSNumber)!
                                        let strLng:NSNumber = (location["lng"] as? NSNumber)!
                                        let Lat:Double = strLat as! Double
                                        let Lng:Double = strLng as! Double
                                        inLat = Lat // sets the previously initialized variables to true coords
                                        inLng = Lng // Lat and Long now saved as doubles
                                        print(self.sentAddress + " got its coordinates.") // testing prints to console
                                        
                                        // Solves async issues with setting marker on map and changing position of map "camera"
                                        DispatchQueue.main.async{
                                            // sets the camera to new position
                                            mapView.camera = GMSCameraPosition.camera(withLatitude: inLat, longitude: inLng, zoom: 15.0)
                                            // sets the markers position, and displays simple and detailed addresses in info window
                                            marker.position = CLLocationCoordinate2D(latitude: inLat, longitude: inLng)
                                            marker.title = self.sentAddress
                                            marker.snippet = detailedToSend
                                            // sets marker to map
                                            marker.map = mapView
                                        }

                                    
                                    }
                                }
                            }
                        }
                    }
                    catch {
                        print("JSON error")
                    }
                }
                
            }
        }
        task.resume()
        
    }

}
