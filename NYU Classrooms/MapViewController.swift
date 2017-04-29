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
    
    
    var sentAddress:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // NYC is currently displayed.
    // The marker will be at that location, and the address will be displayed in the title and snippet.
    override func loadView() {
        sentAddress = addressToSend // holds value of address sent
        
        /* convert address to lat/long using NSURLSession and Google geocoding API */
        var urlBuild = "https://maps.googleapis.com/maps/api/geocode/json?address="
        
        // build the address section here, take the simple address, get the detailed address
        // put +'s in for spaces, add to the urlBuild in place of this line
        for i in detailedToSend.characters {
            if i == " " {
                urlBuild += "+"
            }
            else {
                urlBuild += String(i)
            }
        }
        
        
        //urlBuild += "238+Thompson+Street,+NY,+NY"
        urlBuild += "&key=" + gcAPIKey
        
        print(urlBuild)
        
        var inLat:Double = 0.0
        var inLng:Double = 0.0
        
        
        let url = URL(string: urlBuild)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("error")
            }
            else {
                if let content = data {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
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
                                        inLat = Lat
                                        inLng = Lng
                                        
                                    
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
        
        let camera = GMSCameraPosition.camera(withLatitude:40.7308228 , longitude:-73.997332, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: inLat, longitude: inLng)
        marker.title = self.sentAddress
        marker.snippet = detailedToSend
        marker.map = mapView
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: inLat, longitude: inLng))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
