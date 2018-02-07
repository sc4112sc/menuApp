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
    
}




class SCOCooker: UIViewController,UITableViewDataSource,UIPickerViewDelegate {
    
 

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "scouser") as! SCOUser

        if section==0{
            return vc2.boyName.count
        }else {
            return vc2.girlName.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                 let cell=tableView.dequeueReusableCell(withIdentifier: "Cell") as! SCOCustomCell
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "scouser") as! SCOUser

        
        if indexPath.section==0{
            
            cell.img1.image=vc2.boyImg[indexPath.row]
            cell.name1.text=vc2.boyName[indexPath.row]
            
           
            
        }else {
            
            cell.img1.image=vc2.girlImg[indexPath.row]
            cell.name1.text=vc2.girlName[indexPath.row]
            
         
            
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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "scouser") as! SCOUser

        print(vc2.boyName)
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
