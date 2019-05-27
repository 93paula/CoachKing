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
    func readList() {
        
        //empty both arrays
        habits.removeAll()
        habitsID.removeAll()
        
        //userID = (Auth.auth().currentUser?.uid)!
        
        //Create reference to database for specified user
        let ref = Database.database().reference()
        print(ref)
        print(userID)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(userID){
                
                print("true rooms exist")
                
            }else{
                
                print("false room doesn't exist")
            }
        })
        ref.child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
            //if habit is registered in database for signed in user
            if snapshot.childrenCount > 0 {
                //itereate through users habits and add to habits array as strings
                for item in snapshot.children.allObjects as! [DataSnapshot] {
                    let userItemObject = item.value as! [String: AnyObject]
                    habits.append(userItemObject["habitText"] as! String)
                    print(habits)
                    habitsID.append(item.key as String)
                    print(habitsID)
                }
            }
            //error handler
        }) { (error) in
            print(error.localizedDescription)
        }
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
        //}
    }
    
    func removeHabit(habitID : String) { //Remove habit from database
        let ref = Database.database().reference().child(userID).child(habitID)
        
        ref.removeValue { error, _ in
            print(error)
        }
    }
    
    func editHabit(habitID : String, newHabitText : String) {
        //Update value for edited habit with habit ID
        Database.database().reference().child(userID).updateChildValues([habitID:newHabitText])
    }
    
}
