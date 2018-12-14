//
//  SCOTables.swift
//  menuApp
//
//  Created by 李書賢 on 2018/11/22.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
import CoreData

class SCOTables: UIViewController,UITextFieldDelegate {
//
    @IBOutlet weak var nameT: UITextField!
    @IBOutlet weak var phoneT: UITextField!
    @IBOutlet weak var tableLine: UISlider!
    @IBOutlet weak var tableT: UILabel!
   
    //CoreData
    var context:NSManagedObjectContext!
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    var many1:Int16=0
    var phone1=""
    var name1=""
    var local1="北部"
    var table1="1"
    var menu1=""
    
    
    var allFood1=""
    var allFood2=""
    var allFood3=""
    var allFood4=""
    

 
    @IBAction func seg1(_ sender: UISegmentedControl) {
        local1=sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
    }
    
    @IBAction func slide1(_ sender: UISlider) {
        tableT.text=String(Int(sender.value))
        table1=tableT.text!
        
        UIView.animate(withDuration: 1) {
            self.tableT.frame.origin.y=460
            
        }
        
        if Int(sender.value)>=1{
            self.tableT.textColor=#colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
        }
        
        if Int(sender.value)>=500{
            self.tableT.textColor=#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
        
        if Int(sender.value)>=1000{
            self.tableT.textColor=UIColor.red
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameT.delegate = self
        phoneT.delegate = self
        
       
        //CoreData
        
        context = appDel.persistentContainer.viewContext
        
        if SCOAllMenu.chooseCount == 4{
    
            allFood1 = "五福臨門大拼盤 烏魚子拼盤"
            allFood2 = "八寶丸 櫻花蝦米糕 法式焗烤蝦 清蒸海上鮮 綜合生魚片"
            allFood3 = "翡翠羹 魚翅羹"
            allFood4 = "時鮮水果盤"
            
        
        }else{
            
            for i in SCOFood1.food1A{
                allFood1 = allFood1 + i + " "
            }
            for i in SCOFood2.food2A{
                allFood2 = allFood2 + i + " "
            }
            for i in SCOFood3.food3A{
                allFood3 = allFood3 + i + " "
            }
            for i in SCOFood4.food4A{
                allFood4 = allFood4 + i + " "
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //var nameIsValid=false
    var phoneIsValid=false
    
    
    
    @IBAction func calGo(_ sender: Any) {
        
    //nameIsValid=isPasswordValid(nameT.text!)
    phoneIsValid=isPasswordValid2(phoneT.text!)
        
//        if nameIsValid==false{
//            message(myTitle: "姓名格式錯誤", myMessage: "姓名不能含有特別符號")
//            nameT.text=""
//        }
        
        if nameT.text==""{
            message(myTitle: "填寫錯誤", myMessage: "姓名不可為空")
        }
        
        if phoneIsValid==false{
            message(myTitle: "電話格式錯誤", myMessage: "號碼必須為十位")
            phoneT.text=""
        }
        
        name1=nameT.text!
        phone1=phoneT.text!
        
        switch SCOAllMenu.chooseCount {
        case 1:
            menu1 = "一般方案"
        case 2:
            menu1 = "尊貴方案"
        case 3:
            menu1 = "小資方案"
        default:
            menu1 = "經典方案"
            
        }
        
        if phoneIsValid == true && nameT.text != ""{
            
            many1 = Int16(arc4random_uniform(10000))+Int16(table1)!
            
            //CoreData取得表單列表
            let user = NSEntityDescription.insertNewObject(forEntityName: "Food", into: context) as! Food
            //CoreData寫入資料並儲存
            user.name = name1
            user.phone = phone1
            user.local = local1
            user.menu = Int16(SCOAllMenu.chooseCount) 
            user.table = table1
            user.many = many1
            
            user.food1 = allFood1
            user.food2 = allFood2
            user.food3 = allFood3
            user.food4 = allFood4
            
            
            appDel.saveContext()
            
            
            
            //
            
            
            

            
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Final") as! SCOFinal
            
            vc.name2 = name1
            vc.phone2 = phone1
            vc.table2 = table1
            vc.local2 = local1
            vc.many2 = many1
            
            show(vc, sender: self)
            

        }
 
        
    }
    
//    func isPasswordValid(_ password : String) -> Bool{
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")
//        return passwordTest.evaluate(with: password)
//    }
    
    func isPasswordValid2(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)[\\d]{10,10}$")
        return passwordTest.evaluate(with: password)
    }
    

    
    
    func message(myTitle:String,myMessage:String) {
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField==nameT{
            phoneT.becomeFirstResponder()
        }else if textField==phoneT{
            phoneT.resignFirstResponder()
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
