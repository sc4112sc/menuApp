//
//  SCOFinal.swift
//  menuApp
//
//  Created by ios on 2018/2/12.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOFinal: UIViewController,UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var titleA=["姓名","電話","地區","桌數"]
        var detailA=[name2,phone2,local2,table2]
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        
        cell.textLabel?.text=titleA[indexPath.row]
    
        cell.detailTextLabel?.text=detailA[indexPath.row]
        if indexPath.row==1{
            cell.detailTextLabel?.textColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }else{
            cell.detailTextLabel?.textColor=#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.text="訂單受理成功"
        headerText.backgroundColor=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headerText.textAlignment = .center
        return headerText
    }
    
    var phone2=""
    var name2=""
    var local2=""
    var table2=""

    @IBAction func menuDetail(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "finalMenu")as! FinalMenu
        
        show(vc, sender: self)
    }
    
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBAction func calCancell(_ sender: Any) {
        
        var alertController = UIAlertController(title: "訂單取消", message:"已經幫您取消訂單",preferredStyle: UIAlertControllerStyle.alert)
        
        var callAction = UIAlertAction(title: "確認 ", style: UIAlertActionStyle.default,handler: { action in  let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")as! ViewController
            
            self.show(vc, sender: self) })
        
        alertController.addAction(callAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    @IBOutlet weak var menuImg: UIImageView!
    
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBAction func calHome(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")as! ViewController
        
        show(vc, sender: self)
    }
    
    
    var imgs=["mu1.jpg","mu2.jpg","mu3.jpg","mu4.jpg"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeBtn.layer.cornerRadius=15
        cancelBtn.layer.cornerRadius=15
        
        menuImg.image=UIImage(named: imgs[SCOAllMenu.chooseCount-1])
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
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
