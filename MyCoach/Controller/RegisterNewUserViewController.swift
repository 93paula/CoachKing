//
//  RegisterNewUserViewController.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 22/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterNewUserViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: Actions
    @IBAction func registerButton_Click(_ sender: Any) {
        //Create users in firebase with authentication
        //Check if fields are empty
        if emailTextField.text == "" || passwordTextField.text == "" {
            //Warn user
            let alertController = UIAlertController(title: "Error", message: "Please enter all your information", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        //If all fields are filled in
        else {
            //Create new user object
            let initUser = User(emailText: emailTextField.text!, passwordText: passwordTextField.text!)
            initUser.Register { (error) in
                DispatchQueue.main.async {
                    if error == nil {
                        print("You have successfully signed up")
                        //Go back to login page
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                        //If there is an error with register
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
    
    @IBAction func cancelButton_Click(_ sender: Any) {
        //Cancel registration --> Go back to login page
        dismiss(animated: true, completion: nil)
    }
}
