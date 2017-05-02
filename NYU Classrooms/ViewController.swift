 //
//  ViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 3/27/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
     var usersClasses = [] as! [Dictionary<String, String>]
    
    @IBOutlet weak var addressLabel: UILabel!
    
    // Building Code Text Field
    @IBOutlet weak var buildingCodeTextField: UITextField!

    @IBOutlet weak var classRoomTableView: UITableView!
    // Return button
    @IBAction func returnButtonPressed(_ sender: Any) {
        showAddress(buildingCode: buildingCodeTextField.text!)
        BuildingCodes.lookUpBuildingCode(buildingCode: buildingCodeTextField.text)
    }
    
    // Look up button
    @IBAction func lookUpBuildingCodeButton(_ sender: Any) {
        showAddress(buildingCode: buildingCodeTextField.text!)
        BuildingCodes.lookUpBuildingCode(buildingCode: buildingCodeTextField.text)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.buildingCodeTextField.delegate = self  // This is needed to make the keyboard's 'return' button work
        classRoomTableView.dataSource = self
        
        if UserDefaults.standard.object(forKey: "classrooms") == nil {
            let initClassrooms = [Dictionary<String, String>]()
            UserDefaults.standard.set(initClassrooms, forKey: "classrooms")
        }
        
        self.usersClasses = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]


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
    

    // Show address function is an essential part of finding the building code
    func showAddress(buildingCode: String) {
        // if that building code has a corresponding address, it exists!
        if let address: String = BuildingCodes.buildingCodes[buildingCode.uppercased().trimmingCharacters(in: .whitespaces)] {
            // set the address label to that address information, display to user
            addressLabel.text = address
            detailedToSend = BuildingCodes.detailedAddresses[address]!
        } else {
            // if there is no associated address display that the building code was not found
            addressLabel.text = "Building Code Not Found"
        }
    }
  

    // function ensures that building code did have a corresponding address before allowing segue to map to occur  
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // checks that the mapSegue is the one attempting to be performed
        if identifier == "mapSegue" {
            // if the address was not found in the first place, don't let the segue be performed
            if addressLabel.text == "Building Code Not Found" {
                // return false to signal no go for segue
                return false
            }
            // otherwise address has been found!
            else {
                // set the address to send variable to what the address label in the first view controller says
                // this global var will then be accessed by the map view controller
                addressToSend = addressLabel.text!
                // return true for an approved segue
                return true
            }      
        }
        // if it's not the mapSegue return true, let the segue happen
        else {
            return true
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersClasses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.usersClasses[indexPath.row]["class"]! + ": "+self.usersClasses[indexPath.row]["buildingCode"]!
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            var classrooms = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
            classrooms.remove(at: indexPath.row)
            UserDefaults.standard.set(classrooms, forKey: "classrooms")
            self.viewWillAppear(true)
            print("DELETE BUTTON PRESSED")
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.usersClasses = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
        self.classRoomTableView.reloadData()
        
    }
    
}

