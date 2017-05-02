 //
//  ViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 3/27/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // This initializes the usersClasses
    // It's needed for the app's first-launch edge case
    var usersClasses = [] as! [Dictionary<String, String>]
    
    // Address Label
    @IBOutlet weak var addressLabel: UILabel!
    
    // Building Code Text Field
    @IBOutlet weak var buildingCodeTextField: UITextField!
    
    // Table for classrooms
    @IBOutlet weak var classRoomTableView: UITableView!
    
    // Return button
    @IBAction func returnButtonPressed(_ sender: Any) {
        showAddress(buildingCode: buildingCodeTextField.text!)
        BuildingCodes.lookUpBuildingCode(buildingCode: buildingCodeTextField.text)
        if BuildingCodes.buildingCodes[(buildingCodeTextField.text?.uppercased().trimmingCharacters(in: .whitespaces))!] != nil {
            performSegue(withIdentifier: "mapSegue", sender: nil)
        }
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
        classRoomTableView.delegate = self
        classRoomTableView.dataSource = self
        
        // This handles the first-launch edge case for the classrooms mapping to nil
        if UserDefaults.standard.object(forKey: "classrooms") == nil {
            let initClassrooms = [Dictionary<String, String>]()
            UserDefaults.standard.set(initClassrooms, forKey: "classrooms")
        }
        
        // Gets user's saved classrooms
        self.usersClasses = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
        
        // Nav title
        self.navigationItem.title = "NYU Classooms";

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
    
    // Shows the address for a given building code in self.addressLabel
    func showAddress(buildingCode: String) {
        // If the building code exists, show it
        // Else, say it doesn't exist
        if let address: String = BuildingCodes.buildingCodes[buildingCode.uppercased().trimmingCharacters(in: .whitespaces)] {
            addressLabel.text = address
            detailedToSend = BuildingCodes.detailedAddresses[address]!
        } else {
            addressLabel.text = "Building Code Not Found"
        }
    }
  
    // This segues into the Google Map ViewController
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "mapSegue" {
                if addressLabel.text == "Building Code Not Found" {
                    return false
                }
                else {
                    addressToSend = addressLabel.text!
                    return true
                }
                
            }
            else {
                return true
            }
    }
    
    // Determines how many rows are in the table
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersClasses.count
    }
    
    // Determines the content of each cell of the table
    // Each cell is one of the user's saved classrooms
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.usersClasses[indexPath.row]["class"]! // + ": "+self.usersClasses[indexPath.row]["buildingCode"]!
        return cell
    }
    
    // This gives the user the ability to delete a classroom
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // The user can swipe a classroom to see the delete button
    // The user can press the delete button to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            var classrooms = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
            classrooms.remove(at: indexPath.row)
            UserDefaults.standard.set(classrooms, forKey: "classrooms")
            self.viewWillAppear(true)
            print("DELETE BUTTON PRESSED")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("PRESSED")
        let buildingCode = usersClasses[indexPath.row]["buildingCode"]!
        self.buildingCodeTextField.text = buildingCode
        showAddress(buildingCode: buildingCode)
        addressToSend = BuildingCodes.buildingCodes[buildingCode]!
        performSegue(withIdentifier: "mapSegue", sender: nil)
    }
    
    
    // This is needed to refresh the table's contents after adding a new classroom
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.usersClasses = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
        self.classRoomTableView.reloadData()
        
    }
    
}

