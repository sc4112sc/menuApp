//
//  SCOFood3.swift
//  menuApp
//
//  Created by ios on 2018/2/7.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOFood3: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var titleC: UILabel!
    @IBOutlet weak var table: UITableView!
    static var count3=0
    static var food3A = [String]()
    static var food3Img = [UIImage]()
    static var money3A = [String]()
    
    
    
    var arys=["佛跳牆","烏骨雞湯","翡翠羹","魚翅羹"]
    
    var foodImg:[UIImage]=[UIImage(named:"r1.jpg")!,
                           UIImage(named:"r2.jpg")!,
                           UIImage(named:"r3.jpg")!,
                           UIImage(named:"r4.jpg")!]
    
    var money=["預估價為$800","預估價為$1000","預估價為$500","預估價為$300"]
    
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
            
            SCOFood3.food3Img.append((oneCell.imageView?.image)!)
            
            SCOFood3.money3A.append((oneCell.detailTextLabel?.text)!)
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            
            SCOFood3.count3=SCOFood3.count3-1
            
            if let index = SCOFood3.food3A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood3.food3A.remove(at: index)
            }
            
            if let index = SCOFood3.food3Img.index(of: (oneCell.imageView?.image)!) {
                SCOFood3.food3Img.remove(at: index)
            }
            
            if let index = SCOFood3.money3A.index(of: (oneCell.detailTextLabel?.text)!) {
                SCOFood3.money3A.remove(at: index)
            }
            
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }
    
    
    
    @IBAction func calGo(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food4") as! SCOFood4
        
        
        
        
        
        if SCOAllMenu.chooseCount==1{
            
            
            if SCOFood3.count3==2{
               show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
        }
        
        if SCOAllMenu.chooseCount==2{
            
            
            
            if SCOFood3.count3==2{
               show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            
            
            
            if SCOFood3.count3==1{
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
        
        SCOFood3.count3 = 0
        SCOFood3.food3A = []
        SCOFood3.food3Img = []
        SCOFood3.money3A = []
        
        switch SCOAllMenu.chooseCount {
        case 1:
            titleC.text = "可選二項"
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
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
