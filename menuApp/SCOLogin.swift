//
//  SCOLogin.swift
//  menuApp
//
//  Created by ios on 2018/1/31.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation


class SCOLogin: UIViewController {
    
    var player: AVAudioPlayer?
    @IBAction func calMusic(_ sender: Any) {
        
         guard let url = Bundle.main.url(forResource: "aaa", withExtension:"mp3") else { return }
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint:
                AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
            
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    

    
    
    
    
    var ref: DatabaseReference!
    
    @IBAction func calCreat(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: "sc4112sc@gmail.com", password: "666666") { (user, error) in
            // ...
            print("creat")
        }
    }
    
    @IBAction func calLogin(_ sender: Any) {
        

        
        Auth.auth().signIn(withEmail: "sc4112sc@gmail.com", password: "666666") { (user, error) in
            // ...
            
            print("login")
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                print("setup")
                
                let uid = user.uid
                let email = user.email
                print("uid=\(uid),email=\(String(describing: email))")
                
                
                //self.ref.child("users").child(user.uid).setValue(["username2": "hello"])
                
                self.ref.child("users/\(user.uid)/username").setValue("888scott")
               // self.ref.child("users/\(user.uid)/username1").setValue("peter")
                // ...
            }
        }
    }
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
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
