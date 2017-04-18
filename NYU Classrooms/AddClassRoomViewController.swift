//
//  AddClassRoomViewController.swift
//  
//
//  Created by Jonathan Philippou on 4/18/17.
//
//

import UIKit

class AddClassRoomViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var buildingCodeTextField: UITextField!
    
    @IBAction func addClassRoomButton(_ sender: Any) {
        if let address: String = BuildingCodes.buildingCodes[(buildingCodeTextField.text?.uppercased().trimmingCharacters(in: .whitespaces))!] {
            print("Class: "+classNameTextField.text!)
            print("Address: "+address)
            print("Building Code: "+buildingCodeTextField.text!)
            performSegue(withIdentifier: "Back to Main View", sender: sender)
        } else {
            print("ERROR: Buidling Code Not Found")
        }
        // if building code is good:
            // create new classroom
            // segue to main view controller
        // else:

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

}
