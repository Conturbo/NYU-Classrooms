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
    
    // Look up button (We can delete this potentially)
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
    
    func showAddress(buildingCode: String) {
        if let address: String = BuildingCodes.buildingCodes[buildingCode.uppercased().trimmingCharacters(in: .whitespaces)] {
            addressLabel.text = address
            detailedToSend = BuildingCodes.detailedAddresses[address]!
        } else {
            addressLabel.text = "Building Code Not Found"
        }
    }
  
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

