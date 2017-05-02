//
//  AddClassroomViewController.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 5/1/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import UIKit

class AddClassroomViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buildingCodeNotFoundLabel: UILabel!
    @IBOutlet weak var buildingCodeTextField: UITextField!
    @IBOutlet weak var classNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add a Classroom"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveClassroom(_ sender: Any) {
        if BuildingCodes.buildingCodes[buildingCodeTextField.text!.uppercased()] != nil {
            if UserDefaults.standard.object(forKey: "classrooms") == nil {
                let initClassrooms = [Dictionary<String, String>]()
                UserDefaults.standard.set(initClassrooms, forKey: "classrooms")
            }
            var classrooms = UserDefaults.standard.object(forKey: "classrooms") as! [Dictionary<String, String>]
            let classroom = [
                "class" : classNameTextField.text!,
                "buildingCode" : buildingCodeTextField.text!.uppercased()
            ]
            classrooms.append(classroom)
            UserDefaults.standard.set(classrooms, forKey: "classrooms")
            print(classNameTextField.text!)
            print(buildingCodeTextField.text!)
            self.navigationController?.popViewController(animated: true)
        } else {
            buildingCodeNotFoundLabel.text = "Building Code Not Found"
        }
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
