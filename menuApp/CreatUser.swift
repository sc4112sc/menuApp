//
//  CreatUser.swift
//  menuApp
//
//  Created by ios on 2018/2/21.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import Firebase


class CreatUser: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var hBtn1: UIButton!
    @IBOutlet weak var hBtn2: UIButton!
    @IBOutlet weak var myHead: UIImageView!
    
    @IBOutlet weak var pBtn1: UIButton!
    @IBOutlet weak var pBtn2: UIButton!
    
    var ref: DatabaseReference!
    static var isLogin = false
    static var loginName = ""
    static var loginId = ""
    static var myImage:UIImage = UIImage(named: "bhead")!
    
    @IBAction func calDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func calPicture(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
        
            let  imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            show(imagePicker, sender: self)
            
        }
        
        
        
    }
    
    @IBAction func calSelect(_ sender: UIButton) {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        
        imagePickerVC.modalPresentationStyle = .popover
        let popover = imagePickerVC.popoverPresentationController
        popover?.sourceView = sender
        
        popover?.sourceRect = sender.bounds
        popover?.permittedArrowDirections = .any
        
        show(imagePickerVC, sender: self)
        
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true) {
                
            
            self.myHead.image = image
            CreatUser.myImage = image
            
        }
    }
    
    
    
    @IBAction func calCreat(_ sender: Any) {
        
        var text1: String =  input1.text!
        var text2: String =  input2.text!
      

        
        Auth.auth().createUser(withEmail: text1, password: text2) { (user, error) in
            // ...
            
            
             if let user = user {
                
                print("創建成功")
                self.message(myTitle: "創建成功", myMessage: "方可繼續登入")
             }else{
                
                print("創建失敗")
                self.message(myTitle: "創建失敗", myMessage: "帳號密碼格式錯誤,或此帳號已註冊")
                self.input1.text = ""
                self.input2.text = ""
            }
        }
        
        
        
        
        
    }
    
  

    
    
    @IBAction func calLogin(_ sender: UIButton) {
        
        if CreatUser.isLogin == false{
            
            
            
            var text1: String =  input1.text!
            var text2: String =  input2.text!
            var text3: String =  name1.text!
            
            Auth.auth().signIn(withEmail: text1, password: text2) { (user, error) in
                // ...
                
                
                if let user = user {
                    
                    print("成功登入")
                    CreatUser.isLogin = true
                    CreatUser.loginName = text3
                    self.hBtn1.isEnabled = false
                    
                    self.hBtn1.alpha = 0.4
                   
                    self.pBtn1.isHidden = false
                    self.pBtn2.isHidden = false
                   
                    
                    CreatUser.loginId = user.uid
                    
                    let uid = user.uid
                    let email = user.email
                    print("uid=\(uid),email=\(String(describing: email))")
                    
                    
                    
                    self.ref.child("users/\(user.uid)/count").setValue(text1)
                    self.ref.child("users/\(user.uid)/username").setValue(text3)
                    
                    self.message(myTitle: "登入成功", myMessage: "方可進行其他操作")
                    
                    sender.setTitle("登出", for: .normal)
                }else{
                    print("登入失敗")
                    
                    self.message(myTitle: "登入失敗", myMessage: "帳號或密碼格式錯誤")
                    self.input1.text = ""
                    self.input2.text = ""
                    sender.setTitle("登入", for: .normal)
                }
                
                
            }
            
        }else{
            
            
            
            CreatUser.isLogin = false
            CreatUser.loginName = ""
            self.hBtn1.isEnabled = true
            
            self.hBtn1.alpha = 1.0
            
            self.input1.text = ""
            self.input2.text = ""
            message(myTitle: "已成功登出", myMessage: "")
            
            sender.setTitle("登入", for: .normal)
            myHead.image = UIImage(named: "bhead")
            
            pBtn1.isHidden = true
            pBtn2.isHidden = true
        }
        

        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        if CreatUser.isLogin == true{
            
            hBtn2.titleLabel?.text = "登出"
            myHead.image = CreatUser.myImage
            
            pBtn1.isHidden = false
            pBtn2.isHidden = false
        }else{
            hBtn2.titleLabel?.text = "登入"
            myHead.image = UIImage(named: "bhead")
            
            pBtn1.isHidden = true
            pBtn2.isHidden = true
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
    

    func message(myTitle:String,myMessage:String) {
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
