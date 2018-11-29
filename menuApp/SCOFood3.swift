//
//  SCOFood3.swift
//  menuApp
//
//  Created by ios on 2018/2/7.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOFood3: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    static var count3=0
    static var food3A = [String]()
    var arys=["佛跳牆","烏骨雞湯","翡翠羹","魚翅羹"]
    
    var foodImg:[UIImage]=[UIImage(named:"r1.jpg")!,
                           UIImage(named:"r2.jpg")!,
                           UIImage(named:"r3.jpg")!,
                           UIImage(named:"r4.jpg")!]
    
    var money=["預估價值為800","預估價值為1000","預估價值為500","預估價值為300"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell3")!
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
            
            SCOFood3.count3=SCOFood3.count3+1
           
            SCOFood3.food3A.append((oneCell.textLabel?.text)!)
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            
            SCOFood3.count3=SCOFood3.count3-1
            
            if let index = SCOFood3.food3A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood3.food3A.remove(at: index)
            }
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        if SCOAllMenu.chooseCount==1{
            
            if SCOFood3.count3>2{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為兩道")
            }
            
            if SCOFood3.count3==2{
                
                message2(myTitle: "菜色剛好", myMessage: "前菜剛好為兩道")
            }
            
            
        }
        
        if SCOAllMenu.chooseCount==2{
            
            if SCOFood3.count3>2{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為兩道")
            }
            
            if SCOFood3.count3==2{
                
                message2(myTitle: "菜色剛好", myMessage: "前菜剛好為兩道")
            }
            
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            
            if SCOFood3.count3>1{
                
                message(myTitle: "菜色超過", myMessage: "前菜必須為一道")
            }
            
            if SCOFood3.count3==1{
                
                message2(myTitle: "菜色剛好", myMessage: "前菜剛好為一道")
            }
            
            
        }
        

        
        
        
        
    }
    
    
    
    @IBAction func calGo(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food4") as! SCOFood4
        
        show(vc, sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SCOFood3.count3 = 0
        SCOFood3.food3A = []
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
