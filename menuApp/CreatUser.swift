//
//  CreatUser.swift
//  menuApp
//
//  Created by ios on 2018/2/21.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit


class CreatUser: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate {
//    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
//        guard images.count > 0 else {
//            imagePicker.galleryView.collectionView.allowsMultipleSelection = false
//            return
//        }
//
//
//
//
//
//    }
//
//    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
//        self.myHead.image = images[0]
//        CreatUser.myImage = images[0]
//        imagePicker.dismiss(animated: true, completion: nil)
//
//    }
//
//    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
//        imagePicker.dismiss(animated: true, completion: nil)
//    }
    
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var hBtn1: UIButton!
    @IBOutlet weak var hBtn2: UIButton!
    @IBOutlet weak var myHead: UIImageView!
    
    @IBOutlet weak var pBtn1: UIButton!
    @IBOutlet weak var pBtn2: UIButton!
    @IBOutlet weak var myView: UIView!
    
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
            
//            let imagePicker = ImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.galleryView.collectionView.allowsMultipleSelection = false
//
//            self.present(imagePicker, animated: true, completion: nil)
            
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
                    UIView.animate(withDuration: 1) {
                        self.myView.frame.origin.x = 0
                        
                    }
                    
                    
                    CreatUser.loginId = user.user.uid
                    
                    let uid = user.user.uid
                    let email = user.user.email
                    print("uid=\(uid),email=\(String(describing: email))")
                    
                    
                    
                    self.ref.child("users/\(uid)/count").setValue(text1)
                    self.ref.child("users/\(uid)/username").setValue(text3)
                    
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
            
            do {
                try Auth.auth().signOut()
            } catch {
                print("error")
            }
            
            fbBtn.isHidden = false
            
            CreatUser.isLogin = false
            CreatUser.loginName = ""
            hBtn1.isEnabled = true
            
            hBtn1.alpha = 1.0
            
            input1.text = ""
            input2.text = ""
            message(myTitle: "已成功登出", myMessage: "")
            
            sender.setTitle("登入", for: .normal)
            myHead.image = UIImage(named: "bhead")
            name1.text = ""
            pBtn1.isHidden = true
            pBtn2.isHidden = true
            myView.frame.origin.x = 380
        }
        

        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        if CreatUser.isLogin == true{
            
            hBtn2.titleLabel?.text = "登出"
            myHead.image = CreatUser.myImage
            name1.text = CreatUser.loginName
            pBtn1.isHidden = false
            pBtn2.isHidden = false
            
            hBtn1.isEnabled = false
            
            hBtn1.alpha = 0.4
            
            self.fbBtn.isHidden = true
        }else{
            hBtn2.titleLabel?.text = "登入"
            myHead.image = UIImage(named: "bhead")
            
            pBtn1.isHidden = true
            pBtn2.isHidden = true
            
            self.fbBtn.isHidden = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        myHead.layer.cornerRadius = 85
        myHead.layer.borderColor = #colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
        myHead.layer.borderWidth = 8
        
        input1.borderStyle = .line
        input2.borderStyle = .line
        name1.borderStyle = .line
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == name1{
            input1.becomeFirstResponder()
        }else if textField == input1{
            input2.becomeFirstResponder()
        }else if textField == input2{
            input2.resignFirstResponder()
        }
        return true
    }
    
    
    //facebook
    @IBOutlet weak var fbBtn: UIButton!
    
    @IBAction func facebookLogin(sender: UIButton) {
        
    
        
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                
                
                // do something
                if let user = user {
                    print("成功登入")
                    CreatUser.isLogin = true
                    //抓照片
                    self.fetchUserData()
                    self.name1.text = user.displayName
                    CreatUser.loginName = user.displayName!
                    CreatUser.loginId = user.uid
                    
                    
                    
                    self.hBtn1.isEnabled = false
                    self.hBtn1.alpha = 0.4
                    self.hBtn2.setTitle("登出", for: .normal)
                    self.fbBtn.isHidden = true
                    
                    
                    let uid = user.uid
                    let email = user.email
                    print("uid=\(uid),email=\(String(describing: email))")
                    
                    self.ref.child("users/\(uid)/count").setValue(email)
                    self.ref.child("users/\(uid)/username").setValue(user.displayName)
                    
                    
                    
                    
                } else {
                    print("登入失敗")
                    
                }
                
            })
            
        }
        
        
 
        
  }
    
    
    //facebook get image
    private func fetchUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        graphRequest?.start(completionHandler: { (connection, result, error) in
            if error != nil {
                print("Error",error!.localizedDescription)
            }
            else{
                print(result!)
                let field = result! as? [String:Any]
                
                if let imageURL = ((field!["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                    print(imageURL)
                    let url = URL(string: imageURL)
//                    let data = NSData(contentsOf: url!)
//                    let image = UIImage(data: data! as Data)
//                    self.myHead.image = image
//                    CreatUser.myImage = image!
                    
                    let config = URLSessionConfiguration.default
                    let session = URLSession(configuration: config)
                    let dataTask = session.dataTask(with: url!, completionHandler: { (data, response, error) in
                        if error == nil {
                            var image:UIImage? = nil
                            if let data = data {
                                image = UIImage(data: data)
                                DispatchQueue.main.async(execute: {
                                    self.myHead.image = image
                                })
                                CreatUser.myImage = image!
                            }
                            print("讀取成功")
                        } else {
                            print("讀取失敗")
                        }
                        
                    })
                    
                    dataTask.resume()
                    
                }
            }
        })
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
