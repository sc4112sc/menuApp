//
//  Little04ViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/12.
//  Copyright © 2018 ios. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class Little04ViewController: UIViewController,MFMailComposeViewControllerDelegate {

    var to = ""
    var cc = ""
    var bcc = ""
    var subject = ""
    
    @IBAction func calDo(_ sender: UIButton) {
        
         to = "sc4112sc@gmail.com"
         cc = "sc4112sc1016@gmail.com"
         bcc = "sc4112sc4112sc@gmail.com"
         subject = "MenuApp客戶"
        
        let mail = "mailto:\(to)?subject=\(subject)&cc=\(cc)&bcc=\(bcc)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: mail!)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
    }

    @IBAction func calDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
