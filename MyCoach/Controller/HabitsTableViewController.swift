//
//  HabitsTableViewController.swift
//  Paula-Bella
//
//  Created by Paula Leitisstein Olsen on 19/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {

    var newHabit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func backButton_Click(_ sender: Any) {
        //Close Habits Table View Controller
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
    }
 

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1    //Number of sections in the table view
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count //Number of rows in table view
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitsCell", for: indexPath)

        //Populate table view with elements of habits array
        cell.textLabel?.text = habits[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print(habits)
            
            //Remove deleted habit from firebase
            let initHabitList = HabitList()
            initHabitList.removeHabit(habitID: habitsID[indexPath.row])
        }
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            //empty array
            editHabit.removeAll()
            //Save habit ID and habit text in array
            editHabit.append(habitsID[indexPath.row])
            editHabit.append(habits[indexPath.row])
            //Perform Segue
            self.performSegue(withIdentifier: "editHabitSegue", sender: nil)
        }
        
        edit.backgroundColor = UIColor.orange
        
        return [delete, edit]
        
    }

}
