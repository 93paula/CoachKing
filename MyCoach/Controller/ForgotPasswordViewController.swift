//
//  ForgotPasswordViewController.swift
//  MyCoach
//
//  Created by Paula Leitisstein Olsen on 27/05/2019.
//  Copyright © 2019 Paula Leitisstein Olsen. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    //MARK : Properties
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func SendButton_Click(_ sender: UIButton) {
        if self.emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            let initUser = User(emailText: emailTextField.text!, passwordText: "")
            initUser.ForgotPassword()
            self.dismiss(animated: true, completion: nil)
            
            /*
            var title = ""
            var message = ""
            
            if error != nil {
                title = "Error!"
                message = (error?.localizedDescription)!
            } else {
                title = "Success!"
                message = "Password reset email sent."
                self.emailTextField.text = ""
            }
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil) */
 
        }
    }
    @IBAction func cancelButton_Click(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
