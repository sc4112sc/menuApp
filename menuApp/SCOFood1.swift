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
    @IBOutlet weak var titleC: UILabel!
    
    
    static var food1A = [String]()
    static var food1Img = [UIImage]()
    static var money1A = [String]()
    
    
    static var count1=0
    //sss
    var arys=["五福臨門大拼盤","烏魚子拼盤","生菜蝦鬆","花生炸湯圓","龍蝦沙拉"]
    
    var money=["預估價為$800","預估價為$1000","預估價為$500","預估價為$300","預估價為$600"]
    
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
            
        SCOFood1.food1Img.append((oneCell.imageView?.image)!)
            
            SCOFood1.money1A.append((oneCell.detailTextLabel?.text)!)
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            SCOFood1.count1=SCOFood1.count1-1
            
            if let index = SCOFood1.food1A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood1.food1A.remove(at: index)
            }
            
            if let index = SCOFood1.food1Img.index(of: (oneCell.imageView?.image)!) {
                SCOFood1.food1Img.remove(at: index)
            }
            
            if let index = SCOFood1.money1A.index(of: (oneCell.detailTextLabel?.text)!) {
                SCOFood1.money1A.remove(at: index)
            }
            
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
      
    }
    

    func message(myTitle:String,myMessage:String) {
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "繼續選擇", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    

    
    
    
    

    @IBAction func calGo(_ sender: Any) {
        

         let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food2") as! SCOFood2
        
        
        if SCOAllMenu.chooseCount==1{
            
            if SCOFood1.count1==1{
                
               
                
                show(vc, sender: self)
                
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
            
        }
        
        
        if SCOAllMenu.chooseCount==2{
            
            if SCOFood1.count1==2{
                
                
                show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            
            if SCOFood1.count1==1{
                
                
                show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
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
        self.navigationItem.rightBarButtonItem?.image = UIImage(named: "forward")
        
        SCOFood1.count1=0
        SCOFood1.food1A=[]
        SCOFood1.food1Img=[]
        SCOFood1.money1A=[]
        
        
        switch SCOAllMenu.chooseCount {
        case 1:
            titleC.text = "可選一項"
        case 2:
            titleC.text = "可選兩項"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
