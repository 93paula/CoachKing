//
//  User.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 22/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class User {
    let email : String
    let password : String
    
    init(emailText : String, passwordText : String){
        email = emailText
        password = passwordText
    }
    
    func SignIn() {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                
                //Print into the console if successfully logged in
                print("You have successfully logged in")
                
            }
            else {
                
                print("error in sing in")
                //Tells the user that there is an error and then gets firebase to tell them the error
                /*let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)*/
            }
 
        }
        
        print(Auth.auth().currentUser?.uid)
        
    }
    
    func Register(){
        //Create users in firebase
        //var returnValue : Bool = false
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                print("You have successfully signed up")
                //returnValue = true
            }
            else {
                print(error)
                //returnValue = false
            }
            
        }
        
        //print (returnValue)
        
        //return returnValue
    }
    
    func ForgotPassword() {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            
            if error == nil {
                print("Password reset")
            }
        })
    }
    
    func LogOut() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                userID = ""
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
}
