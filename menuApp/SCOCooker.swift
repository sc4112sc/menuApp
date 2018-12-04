//
//  SCOCooker.swift
//  menuApp
//
//  Created by ios on 2018/1/31.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

protocol ExCellDelegate: class {
    func didTap(cell: SCOCustomCell)
}

class SCOCustomCell: UITableViewCell{
    
    @IBAction func calD(_ sender: Any) {
        
      cellDelegate?.didTap(cell: self)
    }
    
    weak var cellDelegate: ExCellDelegate?
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var phone1: UILabel!
}




class SCOCooker: UIViewController,UITableViewDataSource,UITableViewDelegate,ExCellDelegate {
    
    
   
    

    var titals=""
    
    var yearB=[String]()
    var yearG=[String]()
    
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
        
        cell.cellDelegate = self

        
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
    
    func didTap(cell: SCOCustomCell){
        if let indexPath = myTV.indexPath(for: cell){
            
                    let secVC=storyboard?.instantiateViewController(withIdentifier: "Call") as! CallViewController
                    secVC.localC = titals
            
                    if indexPath.section==0{
            
                        secVC.nameC = arysB[indexPath.row]
                        secVC.phoneC = phoneB[indexPath.row]
                        secVC.imgC = imgsB[indexPath.row]
                        secVC.yearC = yearB[indexPath.row]
            
                    }else{
            
                        secVC.nameC = arysG[indexPath.row]
                        secVC.phoneC = phoneG[indexPath.row]
                        secVC.imgC = imgsG[indexPath.row]
                        secVC.yearC = yearG[indexPath.row]
            
                    }
            
            
            
                    show(secVC, sender: self)
            
            
            
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

    

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
    
        headerText.backgroundColor=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headerText.textAlignment = .center
        headerText.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        if section==0{
            headerText.text = "男生"
        }else {
            headerText.text = "女生"
        }
        
        return headerText
    }
    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        let secVC=storyboard?.instantiateViewController(withIdentifier: "Call") as! CallViewController
//        secVC.localC = titals
//
//        if indexPath.section==0{
//
//            secVC.nameC = arysB[indexPath.row]
//            secVC.phoneC = phoneB[indexPath.row]
//            secVC.imgC = imgsB[indexPath.row]
//
//        }else{
//
//            secVC.nameC = arysG[indexPath.row]
//            secVC.phoneC = phoneG[indexPath.row]
//            secVC.imgC = imgsG[indexPath.row]
//
//        }
//
//
//
//        show(secVC, sender: self)
//    }
    

    
    
    @IBAction func Home(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! ViewController
        
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBOutlet weak var myTV: UITableView!
    
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
