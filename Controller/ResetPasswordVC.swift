//
//  ResetPasswordVC.swift
//  Inna
//
//  Created by MOSHIOUR on 4/2/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ResetPasswordVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passwordResetButtonPressed(_ sender: Any) {
        
        if self.emailTextField.text == ""{
            let alertController = UIAlertController(title: "Wrong!", message: "Please enter a valid email address", preferredStyle: .alert)
            
            let defaultAlert = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAlert)
            present(alertController ,animated: true , completion: nil)
            
        }
        else{
            var email = self.emailTextField.text
            Auth.auth().sendPasswordReset(withEmail: email!, completion: {(error) in
                
                var alert = ""
                var msg = ""
                
                if error != nil{
                    alert = "Error!"
                    msg = (error?.localizedDescription)!
                }
                else{
                    alert = "Success!"
                    msg = "A password reset mail is sent to \(self.emailTextField.text!). Please reset your password and continue... "
                    email! = ""
                }
                let alertController = UIAlertController(title: alert, message: msg, preferredStyle: .alert)
                let defaultAlert = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAlert)
                self.present(alertController , animated: true ,completion: nil)
                
            })
            
        }
    }
    
}

