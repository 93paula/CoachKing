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

class ViewController: UIViewController {

    //MARK : Properties
    @IBOutlet weak var dailyHabitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Read habits list for signed in user from firebase
        let initHabitList = HabitList()
        initHabitList.readList()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK : Actions
    @IBAction func newDailyHabit(_ sender: UIButton) {
        //Find number of habits in users list
        let noOfHabits = habits.count
        //Generate random number between 0 and noOfHabits
        let randomNo = Int(arc4random_uniform(UInt32(noOfHabits)))
        let dailyHabit = habits[randomNo]
        dailyHabitLabel?.text = dailyHabit
    }
    
    @IBAction func logOut_Click(_ sender: UIBarButtonItem) {
        let initUser = User(emailText: "",passwordText: "")
        initUser.LogOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
