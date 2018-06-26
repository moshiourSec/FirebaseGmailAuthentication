//
//  HandlerLogin.swift
//  Inna
//
//  Created by MOSHIOUR on 4/6/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit
import Firebase

extension SignupVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @objc func handleUserImageView(){
        
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            userImageView.image = selectedImage
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancel")
        dismiss(animated: true, completion: nil)
    }
    
    func createAccount() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = userNameTextField.text else {
            print("Form is not valid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user , error) in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            //successfully authenticated user
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).jpg")
            if let profileImage = self.userImageView.image, let uploadData = UIImageJPEGRepresentation(profileImage, 0.1){
                
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                        
                        let values = ["name": name, "email": email, "profileImageUrl": profileImageUrl]
                        
                        self.registerUserIntoDatabaseWithUID(uid, values: values as [String : AnyObject])
                    }
                })
            }
        })
    }
    
    func registerUserIntoDatabaseWithUID(_ uid: String, values: [String: AnyObject]){
        
        
        let ref = Database.database().reference(fromURL: "https://inna-28b0b.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if let err = err {
                print(err)
                return
            }
           // self.contactsVC?.fetchUserAndSetTitle()
            
            let nextView = self.storyboard?.instantiateViewController(withIdentifier: "Nav")
            self.present(nextView!, animated: true, completion: nil)
            
        })
        
    }

}
