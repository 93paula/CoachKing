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
    
    func SignIn(completionHandler: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil {
                completionHandler(nil)
                userID = (Auth.auth().currentUser?.uid)!
            }
            else {
                completionHandler(error)
            }
 
        }
        
    }
    
    func Register(completionHandler: @escaping (Error?) -> Void) {
        //Create users in firebase
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                completionHandler(nil)
            }
            else {
                completionHandler(error)
            }
        }
    }
    
    func ForgotPassword(completionHandler: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if error == nil {
                completionHandler(nil)
            }
            else {
                completionHandler(error)
            }
        }
    }
    
    func LogOut(completionHandler: @escaping (Error?) -> Void) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                completionHandler(nil)
            } catch let error as NSError {
                completionHandler(error)
            }
        }
    }
    
}
