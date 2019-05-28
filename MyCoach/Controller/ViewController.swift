//
//  ViewController.swift
//  Paula-Bella
//
//  Created by Paula Leitisstein Olsen on 19/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

//Global variables
var habits = [String]()
var habitsID = [String]()
var userID : String = ""
var editHabit = [String]()

class ViewController: UIViewController {

    //MARK : Properties
    @IBOutlet weak var dailyHabitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Read habits list for signed in user from firebase
        let initHabitList = HabitList()
        initHabitList.readList { (error) in
            DispatchQueue.main.async {
                if error == nil {
                
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK : Actions
    @IBAction func newDailyHabit(_ sender: UIButton) {
        //Find number of habits in users list
        let noOfHabits : Int = habits.count
        if noOfHabits > 0 {
            //Generate random number between 0 and noOfHabits
            let randomNo : Int = Int(arc4random_uniform(UInt32(noOfHabits)))
            let dailyHabit : String = habits[randomNo]
            dailyHabitLabel?.text = dailyHabit
        }
        else {
            dailyHabitLabel?.text = "No habits are saved"
        }
    }
    
    @IBAction func logOut_Click(_ sender: UIBarButtonItem) {
        let initUser = User(emailText: "",passwordText: "")
        initUser.LogOut { (error) in
            DispatchQueue.main.async {
                if error == nil {
                    userID = ""
                    self.dismiss(animated: true, completion: nil)
                }
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
