//
//  EditHabitViewController.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 22/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit

class EditHabitViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var habitTextField: UITextField!
    var habitID : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    @IBAction func cancelButton_Click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton_Click(_ sender: UIButton) {
        let initHabitList = HabitList()
        initHabitList.editHabit(habitID: habitID, newHabitText: habitTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
}
