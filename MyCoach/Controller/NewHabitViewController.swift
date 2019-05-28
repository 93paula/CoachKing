//
//  NewHabitViewController.swift
//  Paula-Bella
//
//  Created by Paula Leitisstein Olsen on 19/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var habitText: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var habit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            habit = habitText.text!
        }
    } */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func addButton_Click(_ sender: Any) {
        
        //Check if habit textfield is empty
        if habitText.text == "" {
            //Warn user about empty field
            let alertController = UIAlertController(title: "Error", message: "Please write you habit in the text field", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
        //If all fields are filled in
        else {
            //Update array containing habits
            habits.append(habitText.text!)
            
            //Update database
            let initHabitList = HabitList()
            initHabitList.writeItem(habitText: habitText.text!)
            initHabitList.readList { (error) in
                DispatchQueue.main.async {
                    if error == nil {
                        //Go back to habit table view controller
                        self.dismiss(animated: true, completion: nil)
                    }
                        //If there is an error with reading of habits
                    else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    

}
