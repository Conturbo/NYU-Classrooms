//
//  ViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 3/27/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var usersClasses = ["iOS Programming", "Applied Internet Technology", "Operating Systems", "Intermediate Greek Language 2"]
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var classRoomTableView: UITableView!
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersClasses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = usersClasses[indexPath.row]
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.buildingCodeTextField.delegate = self  // This is needed to make the keyboard's 'return' button work
        classRoomTableView.dataSource = self

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
        } else {
            addressLabel.text = "Building Code Not Found"
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

