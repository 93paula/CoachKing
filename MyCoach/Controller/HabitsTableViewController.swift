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
    
    //Segues
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    @IBAction func saveEdit(segue:UIStoryboardSegue) {
        
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            habits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }*/
    
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
            //Create instance
            let vc = EditHabitViewController(nibName: "EditHabitViewController", bundle: nil)
            //Write chosen habit text to text field in next view controller
            vc.habitTextField.text = habits[indexPath.row]
            //Set habit ID of habit which is edited
            vc.habitID = habitsID[indexPath.row]
            //Perform segue
            self.performSegue(withIdentifier: "editHabitSegue", sender: nil)
        }
        
        edit.backgroundColor = UIColor.orange
        
        return [delete, edit]
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
