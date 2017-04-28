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
        print(sentAddress)
        var urlBuild = "https://maps.googleapis.com/maps/api/geocode/json?address="
        urlBuild += "238+Thompson+Street,+NY,+NY"
        urlBuild += "&key=" + gcAPIKey
        
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
                                        print(location)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
