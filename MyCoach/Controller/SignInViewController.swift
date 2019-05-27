//
//  SignInViewController.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 22/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func signInButton_Click(_ sender: UIButton) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            //Warn user
            let alertController = UIAlertController(title: "Error", message: "Please enter all your information", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        else {
            let initUser = User(emailText: emailTextField.text!, passwordText: passwordTextField.text!)
            initUser.SignIn()
            self.performSegue(withIdentifier: "SignInSegue", sender: nil)
        }
    }
    
    
}
