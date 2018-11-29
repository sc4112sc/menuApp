//
//  CreatUser.swift
//  menuApp
//
//  Created by ios on 2018/2/21.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import Firebase


class CreatUser: UIViewController {
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var hBtn1: UIButton!
    @IBOutlet weak var hBtn2: UIButton!
    
    var ref: DatabaseReference!
  
    
    @IBAction func calCreat(_ sender: Any) {
        
        var text1: String =  input1.text!
        var text2: String =  input2.text!
      

        
        Auth.auth().createUser(withEmail: text1, password: text2) { (user, error) in
            // ...
            print("creat")
        }
        
        
        hBtn1.isHidden=true
        
        
    }
    
    @IBAction func goLogin(_ sender: Any) {
        


        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "logingo") as! UserLogin

        
        
        self.present(vc, animated: true) {}
        

    }
    
    
    @IBAction func calLogin(_ sender: Any) {
        
        var text1: String =  input1.text!
        var text2: String =  input2.text!
        var text3: String =  name1.text!
        
        Auth.auth().signIn(withEmail: text1, password: text2) { (user, error) in
            // ...
            
            print("login")
            if let user = user {
                
                print("setup")
                
                let uid = user.uid
                let email = user.email
                print("uid=\(uid),email=\(String(describing: email))")
                
                
                
                self.ref.child("users/\(user.uid)/count").setValue(text1)
                self.ref.child("users/\(user.uid)/username").setValue(text3)
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
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
