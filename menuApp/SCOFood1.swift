//
//  SCOFood1.swift
//  menuApp
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit


class SCOFood1: UIViewController,UITableViewDataSource, UITableViewDelegate {

   
    @IBOutlet weak var table: UITableView!
    
    static var food1A = [String]()
    
    static var count1=0
    //sss
    var arys=["五福臨門大拼盤","烏魚子拼盤","生菜蝦鬆","花生炸湯圓","龍蝦沙拉"]
    
    var money=["預估價值為800","預估價值為1000","預估價值為500","預估價值為300","預估價值為600"]
    
    var foodImg:[UIImage]=[UIImage(named:"bb1.jpg")!,
                           UIImage(named:"bb2.jpg")!,
                           UIImage(named:"bb3.jpg")!,
                           UIImage(named:"bb4.jpg")!,
                           UIImage(named:"bb5.jpg")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell1")!
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
            SCOFood1.count1 = SCOFood1.count1 + 1
            SCOFood1.food1A.append((oneCell.textLabel?.text)!)
            
            
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            SCOFood1.count1=SCOFood1.count1-1
            
            if let index = SCOFood1.food1A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood1.food1A.remove(at: index)
            }
            
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        

        if SCOAllMenu.chooseCount==1{
            
            if SCOFood1.count1>1{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為一道")
                
            }
            
            if SCOFood1.count1==1{
                
                message2(myTitle: "菜色剛好", myMessage: "請到下一頁")
                
            }
            
        }
        
        
        if SCOAllMenu.chooseCount==2{
            
            if SCOFood1.count1>2{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為兩道")
                
            }
            
            if SCOFood1.count1==2{
                
                message2(myTitle: "菜色剛好", myMessage: "請到下一頁")
                
            }
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            
            if SCOFood1.count1>1{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為一道")
                
            }
            
            if SCOFood1.count1==1{
                
                
                message2(myTitle: "菜色剛好", myMessage: "請到下一頁")

                
            }
            
        }
        
        
       
        
        
      
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
    
    
    
    

    @IBAction func calGo(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food2") as! SCOFood2
        
        show(vc, sender: self)
        
    }
    
    
    
 
    
 
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SCOFood1.count1=0
        SCOFood1.food1A=[]
        
        //table.contentInset = UIEdgeInsetsMake(-50, 0, 0, 0)
        
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
