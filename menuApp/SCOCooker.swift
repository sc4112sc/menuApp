//
//  SCOCooker.swift
//  menuApp
//
//  Created by ios on 2018/1/31.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOCustomCell: UITableViewCell{
    
    

    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var phone1: UILabel!
}




class SCOCooker: UIViewController,UITableViewDataSource,UIPickerViewDelegate {
    
    
   
    

    var titals=""
    
    var phoneB=[String]()
    var phoneG=[String]()
    
    var arysB=[String]()
    var arysG=[String]()
    
    var imgsB=[UIImage]()
    var imgsG=[UIImage]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        if section==0{
            return arysB.count
        }else {
            return arysG.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                 let cell=tableView.dequeueReusableCell(withIdentifier: "Cell") as! SCOCustomCell
        
     

        
        if indexPath.section==0{
            
            cell.img1.image=imgsB[indexPath.row]
            cell.name1.text=arysB[indexPath.row]
            cell.phone1.text="聯絡電話 : "+phoneB[indexPath.row]
           
            
        }else {
            
            cell.img1.image=imgsG[indexPath.row]
            cell.name1.text=arysG[indexPath.row]
            cell.phone1.text="聯絡電話 : "+phoneG[indexPath.row]
            
         
            
        }
        return cell
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0{
            return "Boy"
        }else {
            return "Girl"
        }
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section==0{
            return "Boy"
        }else {
            return "Girl"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    @IBAction func Home(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! ViewController
        
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title=titals
        
        
//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "scouser") as! SCOUser
//
//        print(vc2.boyName)
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
