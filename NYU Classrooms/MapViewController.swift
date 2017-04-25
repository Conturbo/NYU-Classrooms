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
        print(sentAddress);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // NYC is currently displayed. Eventually this will be sent the address.
    // The marker will be at that location, and the address will be displayed in the title and snippet.
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude:40.7128 , longitude:-74.0059, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
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
