//
//  CallViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/3.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class CallViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        
        var titleA=["姓名","電話","地區","年資"]
        var detailA=[nameC,phoneC,localC,yearC]
        
        cell.textLabel?.text=titleA[indexPath.row]
        
        cell.detailTextLabel?.text=detailA[indexPath.row]
        
        if indexPath.row == 1{
            cell.detailTextLabel?.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    

    @IBAction func calMessage(_ sender: Any) {
        if CreatUser.isLogin == true{
            
             let vc = self.storyboard?.instantiateViewController(withIdentifier: "myChat") as! MyChat
            vc.masterName = nameC
            vc.phoneId = phoneC
            show(vc, sender: self)
            
        }else{
            
            let alertController = UIAlertController(title: "請先登入", message: "前往登入頁面", preferredStyle: .alert)
            let ok = UIAlertAction(title: "確定", style: .cancel) { (UIAlertAction) in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "creatUser") as! CreatUser
                self.present(vc, animated: true, completion: nil)
            }
            alertController.addAction(ok)
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func calCall(_ sender: Any) {
   
        if let url = NSURL(string: "tel://\(phoneC)"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    

    var phoneC = ""
    var nameC = ""
    var imgC = UIImage(named:"g1.jpg")
    var localC = ""
    var yearC = ""
    
    @IBOutlet weak var myImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImg.image = imgC
        
       
        // Do any additional setup after loading the view.
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
