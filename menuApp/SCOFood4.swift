//
//  SCOFood4.swift
//  menuApp
//
//  Created by ios on 2018/2/7.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit


class SCOFood4: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {


    
    static var count4=0
        
   
    static var food4A = [String]()
    static var food4Img = [UIImage]()
    static var money4A = [String]()

    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var titleC: UILabel!
    
    
   
    
    var money=["預估價為$800","預估價為$1000","預估價為$500","預估價為$300","預估價為$600"]
   
    
    var arys=["伊雷特布丁","哈根達斯","時鮮水果盤","漢堡冰","鴛鴦紅豆糕"]
    
    var foodImg:[UIImage]=[UIImage(named:"t1.jpg")!,
                           UIImage(named:"t2.jpg")!,
                           UIImage(named:"t3.jpg")!,
                           UIImage(named:"t4.jpg")!,
                           UIImage(named:"t5.jpg")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell4")!
        cell.textLabel?.text=arys[indexPath.row]
        
        
        cell.imageView?.image = foodImg[indexPath.row]
        
        cell.detailTextLabel?.text = money[indexPath.row]
        
        cell.tintColor = UIColor.red
        
        
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       var oneCell : UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if oneCell.accessoryType == UITableViewCellAccessoryType.none {
            oneCell.accessoryType = UITableViewCellAccessoryType.checkmark
            
            SCOFood4.count4=SCOFood4.count4+1
            
            SCOFood4.food4A.append((oneCell.textLabel?.text)!)
            
            SCOFood4.food4Img.append((oneCell.imageView?.image)!)
            
            SCOFood4.money4A.append((oneCell.detailTextLabel?.text)!)
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            
            SCOFood4.count4=SCOFood4.count4-1
            
            if let index = SCOFood4.food4A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood4.food4A.remove(at: index)
            }
            
            if let index = SCOFood4.food4Img.index(of: (oneCell.imageView?.image)!) {
                SCOFood4.food4Img.remove(at: index)
            }
            
            if let index = SCOFood4.money4A.index(of: (oneCell.detailTextLabel?.text)!) {
                SCOFood4.money4A.remove(at: index)
            }
            
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        if SCOAllMenu.chooseCount==1{
            
      
            
            if SCOFood4.count4==1{
                
                message2(myTitle: "菜色剛好", myMessage: "可前往送出菜單")
            }
            
            
        }
        
        if SCOAllMenu.chooseCount==2{
            
 
            
            if SCOFood4.count4==2{
                
                message2(myTitle: "菜色剛好", myMessage: "可前往送出菜單")
            }
            
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            

            
            if SCOFood4.count4==1{
                
                message2(myTitle: "菜色剛好", myMessage: "可前往送出菜單")
            }
            
            
        }
        
        
   
    }
    
    
    @IBAction func calDone(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Tables") as! SCOTables
        
        if SCOAllMenu.chooseCount==1{
            
            if SCOFood1.count1==1 && SCOFood2.count2==6 && SCOFood3.count3==2 && SCOFood4.count4==1{
                
                
                show(vc, sender: self)
                
            }else{
                message(myTitle: "菜色數量錯誤", myMessage: "")
            }
            
            
        }
        
        if SCOAllMenu.chooseCount==2{
            
            if SCOFood1.count1==2 && SCOFood2.count2==7 && SCOFood3.count3==2 && SCOFood4.count4==2{
                
                show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤", myMessage: "")
            }
            
            
        }
        
        if SCOAllMenu.chooseCount==3{
            
            if SCOFood1.count1==1 && SCOFood2.count2==5 && SCOFood3.count3==1 && SCOFood4.count4==1{
                
                show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤", myMessage: "")
            }
            
            
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1) {
            self.titleC.frame.origin.x = 0
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SCOFood4.count4 = 0
        SCOFood4.food4A = []
        SCOFood4.food4Img = []
        SCOFood4.money4A = []
        
        switch SCOAllMenu.chooseCount {
        case 1:
            titleC.text = "可選一項"
        case 2:
            titleC.text = "可選二項"
        default:
            titleC.text = "可選一項"
        }
        //table.contentInset = UIEdgeInsetsMake(-50, 0, 0, 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    func message(myTitle:String,myMessage:String) {
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "繼續選擇", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    func message2(myTitle:String,myMessage:String) {
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .actionSheet)
        let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
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
