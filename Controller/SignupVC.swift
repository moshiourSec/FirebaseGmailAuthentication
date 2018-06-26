//
//  SignupVC.swift
//  Inna
//
//  Created by MOSHIOUR on 4/2/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupVC: UIViewController {
    
    //let contactsVC : ContactsViewController? = nil
    
    //Outlets
    
    @IBOutlet weak var retypePassword: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPassword: UILabel!
    //@IBoutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userImageView: UIImageView!
    let database = "https://inna-28b0b.firebaseio.com/"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (handleUserImageView)))
        userImageView.isUserInteractionEnabled = true
        
        
    }
    
    
    
    //Sign Up with email

    @IBAction func createAccountAction(_ sender: AnyObject) {
        
        if userNameTextField.text == ""{
                let alertController = UIAlertController(title: "Error", message: "Please enter your username", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
        }
        
        else if self.passwordTextField.text != self.retypePassword.text
        {
            checkPassword.text = "Password doesn't match"
        }
        
        else if emailTextField.text != ""
        {
            createAccount()
        }
    
    }
    
  
}



















