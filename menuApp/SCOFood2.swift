//
//  SCOFood2.swift
//  menuApp
//
//  Created by ios on 2018/2/7.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOFood2: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var titleC: UILabel!
    
    static var food2A = [String]()
    static var food2Img = [UIImage]()
    static var money2A = [String]()
    
    static var count2=0
    
    var arys=["八寶丸","櫻花蝦米糕","法式焗烤蝦","清蒸海上鮮","綜合生魚片","將絲炒大腸","金沙豆腐","香酥鮮蝦捲","鮑魚燴花菇","鳳梨蝦球","龍江脆皮雞","龍蝦三明治"]
    
    var money=["預估價為$800","預估價為$1000","預估價為$500","預估價為$300","預估價為$600","預估價為$800","預估價為$1000","預估價為$500","預估價為$300","預估價為$600","預估價為$800","預估價為$1000"]
    
    var foodImg:[UIImage]=[UIImage(named:"w1.jpg")!,
                           UIImage(named:"w2.jpg")!,
                           UIImage(named:"w3.JPG")!,
                           UIImage(named:"w4.jpg")!,
                           UIImage(named:"w5.jpg")!,
                           UIImage(named:"w6.jpg")!,
                           UIImage(named:"w7.jpg")!,
                           UIImage(named:"w8.jpg")!,
                           UIImage(named:"w9.Jpeg")!,
                           UIImage(named:"w10.jpg")!,
                           UIImage(named:"w11.jpg")!,
                           UIImage(named:"w12.jpg")!]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "Cell2")!
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
            
            SCOFood2.count2 = SCOFood2.count2 + 1
            
            SCOFood2.food2A.append((oneCell.textLabel?.text)!)
            
            SCOFood2.food2Img.append((oneCell.imageView?.image)!)
            
            SCOFood2.money2A.append((oneCell.detailTextLabel?.text)!)
            
        } else {
            oneCell.accessoryType = UITableViewCellAccessoryType.none
            
            SCOFood2.count2 = SCOFood2.count2 - 1
            
            if let index = SCOFood2.food2A.index(of: (oneCell.textLabel?.text)!) {
                SCOFood2.food2A.remove(at: index)
            }
            
            if let index = SCOFood2.food2Img.index(of: (oneCell.imageView?.image)!) {
                SCOFood2.food2Img.remove(at: index)
            }
            
            if let index = SCOFood2.money2A.index(of: (oneCell.detailTextLabel?.text)!) {
                SCOFood2.money2A.remove(at: index)
            }
            
        }
        //取消選取
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
        
    }
    
    
    
    @IBAction func calGo(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food3") as! SCOFood3
        
        
        
        
        
        if SCOAllMenu.chooseCount==1{
            
            if SCOFood2.count2==6{
                show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
            
            
        }
        
        if SCOAllMenu.chooseCount==2{
            
            if SCOFood2.count2==7{
               show(vc, sender: self)
            }else{
                message(myTitle: "菜色數量錯誤" , myMessage: "")
            }
            
            
            
        }
        
        
        if SCOAllMenu.chooseCount==3{
            
            if SCOFood2.count2==5{
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
        
        SCOFood2.count2=0
        SCOFood2.food2A=[]
        SCOFood2.food2Img=[]
        SCOFood2.money2A=[]
        
        switch SCOAllMenu.chooseCount {
        case 1:
            titleC.text = "可選六項"
        case 2:
            titleC.text = "可選七項"
        default:
            titleC.text = "可選五項"
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
