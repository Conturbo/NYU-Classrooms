//
//  ViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 3/27/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addressLabel: UILabel!
    
    // Building Code Text Field
    @IBOutlet weak var buildingCodeTextField: UITextField!
    
    // Return button
    @IBAction func returnButtonPressed(_ sender: Any) {
        showAddress(buildingCode: buildingCodeTextField.text!)
        BuildingCodes.lookUpBuildingCode(buildingCode: buildingCodeTextField.text)
    }
    
    // Look up button (We can delete this potentially)
    @IBAction func lookUpBuildingCodeButton(_ sender: Any) {
        showAddress(buildingCode: buildingCodeTextField.text!)
        BuildingCodes.lookUpBuildingCode(buildingCode: buildingCodeTextField.text)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.buildingCodeTextField.delegate = self  // This is needed to make the keyboard's 'return' button work

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This makes the 'return' button work on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func showAddress(buildingCode: String) {
        if let address: String = BuildingCodes.buildingCodes[buildingCode.uppercased().trimmingCharacters(in: .whitespaces)] {
            addressLabel.text = address
            // performSegue goes here, maybe?
        } else {
            addressLabel.text = "Building Code Not Found"
        }
    }
    
    // prepare function sends address text over to new view, the map view
    func prepare(segue:UIStoryboardSegue, sender:AnyObject?) {
        var DestViewController: MapViewController = segue.destination as! MapViewController
        
        DestViewController.sentAddress = addressLabel.text!
        
        
        
    }
    
    
    
}

