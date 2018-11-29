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
    
    var phone1=""
    var name1=""
    var local1=""
    var table1=""
 
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

        nameT.delegate=self
        phoneT.delegate=self
        
       
        //CoreData
        
        context=appDel.persistentContainer.viewContext
        
        
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
        
        
        if phoneIsValid == true && nameT.text != ""{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Final") as! SCOFinal
            
            vc.name2=name1
            vc.phone2=phone1
            vc.table2=table1
            vc.local2=local1
            
            
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
