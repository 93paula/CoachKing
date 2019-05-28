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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        habitTextField.text = editHabit[1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: Actions
    @IBAction func cancelButton_Click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton_Click(_ sender: UIButton) {
        let initHabitList = HabitList()
        initHabitList.editHabit(habitID: editHabit[0], newHabitText: habitTextField.text!) { (error) in
            DispatchQueue.main.async {
                if error == nil {
                    let indexNo : Int = habitsID.index(of: editHabit[0])!
                    habits[indexNo] = self.habitTextField.text!
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
