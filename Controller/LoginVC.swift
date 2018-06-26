//
//  LoginVC.swift
//  Inna
//
//  Created by MOSHIOUR on 4/2/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    var messagesController: ContactsViewController?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   /*
    func handleNavigation(){
    let newMessageController = ContactsVC()
    let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)}
   */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            let email = self.emailTextField.text
            let password = self.passwordTextField.text
            
            Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
                
                if error == nil {
                    
                    //Print into console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go HomeViewController if the login is sucessful
                    //let nextView = self.storyboard?.instantiateViewController(withIdentifier: "Nav")
                    //self.present(nextView!, animated: true, completion: nil)
                    self.messagesController?.fetchUserAndSetupNavBarTitle()
                    
                    self.dismiss(animated: true, completion: nil)

                    
                    //self.handleNavigation()
                } else {
                    
                    //If error occurred
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAlert)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
}

