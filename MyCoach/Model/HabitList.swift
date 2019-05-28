//
//  HabitList.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 25/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class HabitList {
    
    init(){
        
    }
    
    //Method for reading
    func readList(completionHandler: @escaping (Error?) -> Void) {
        
        //empty both arrays
        habits.removeAll()
        habitsID.removeAll()
        
        
        //Create reference to database for specified user
        let ref = Database.database().reference()
        //Check if user has a registered list in database
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(userID){
                ref.child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                    //itereate through users habits and add to habits array as strings
                    for item in snapshot.children.allObjects as! [DataSnapshot] {
                        let userItemObject = item.value as! [String: AnyObject]
                        habits.append(userItemObject["habitText"] as! String)
                        print(habits)
                        habitsID.append(item.key as String)
                        print(habitsID)
                        completionHandler(nil)
                    }
                //error handler
                }) { (error) in
                    completionHandler(error)
                }
            }
            else{   //No existing list in database
                completionHandler(nil)
            }
        })
    }

    
    func writeItem(habitText : String) {    //Save habit in database
        //Set refernece in database
        let ref = Database.database().reference().child(userID)
        //Create dictionary
        let habitDictionary : NSDictionary = ["habitText" : habitText]
        ref.childByAutoId().setValue(habitDictionary) {
            (error, ref) in
            //error handler
            if error != nil {
                print(error!)
            }
            else {
                print("Habit saved successfully!")
            }
        }
        
    }
    
    func removeHabit(habitID : String) { //Remove habit from database
        let ref = Database.database().reference().child(userID).child(habitID)
        
        ref.removeValue { error, _ in
        }
    }
    
    func editHabit(habitID : String, newHabitText : String, completionHandler: @escaping (Error?) -> Void) {
        //Update value for edited habit with habit ID
        let ref = Database.database().reference().child(userID).child(habitID)
        ref.updateChildValues(["habitText":newHabitText]) { (error, ref) in
            //error handler
            if error == nil {
                completionHandler(nil)
            }
            else {
                completionHandler(error)
            }
        }
    }
    
}
