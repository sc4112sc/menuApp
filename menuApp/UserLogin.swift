//
//  UserLogin.swift
//  menuApp
//
//  Created by ios on 2018/2/21.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import Firebase


class UserLogin: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    var ref: DatabaseReference!
    
    
    
    @IBAction func calCreat(_ sender: Any) {
        
        var text1: String =  input1.text!
        var text2: String =  input2.text!
        
        Auth.auth().createUser(withEmail: text1, password: text2) { (user, error) in
            // ...
            print("creat")
        }
        
        
    }
    @IBAction func calLogin(_ sender: Any) {
        
        var text1: String =  input1.text!
        var text2: String =  input2.text!
        
        Auth.auth().signIn(withEmail: text1, password: text2) { (user, error) in
            // ...
            
            print("login")
            if let user = user {
   
                print("setup")
                
                let uid = user.user.displayName
                let email = user.user.email
                
                print("uid=\(uid),email=\(String(describing: email))")
                
                self.ref.child("users/\(user.user.displayName)/count").setValue(text1)
   
            }else{
                print("nonononono")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        input1.delegate = self
        input2.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
