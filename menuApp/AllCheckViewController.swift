//
//  AllCheckViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/6.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class AllCheckViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        
        switch section {
        case 0:
            headerText.text = "狀態 ： 等待受理"
      
        default:
            headerText.text = "菜單"
        }

        
        headerText.backgroundColor=#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headerText.textAlignment = .center
        return headerText
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        
        default:
            return allFoodA.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = titles[indexPath.row]
            cell.detailTextLabel?.text = details[indexPath.row]
            cell.detailTextLabel?.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            if indexPath.row == 5{
                cell.detailTextLabel?.textColor = #colorLiteral(red: 0.9835967422, green: 0.2380926712, blue: 0.2917757777, alpha: 1)
            }
            
        default:
          
            
            if indexPath.row < myFood1A.count{
                
                cell.textLabel?.text = "前菜"
                cell.detailTextLabel?.text = allFoodA[indexPath.row]
                cell.detailTextLabel?.textColor = #colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
                
            }else if indexPath.row >= myFood1A.count && indexPath.row < (myFood1A+myFood2A).count{
                
                cell.textLabel?.text = "主菜"
                cell.detailTextLabel?.text = allFoodA[indexPath.row]
                cell.detailTextLabel?.textColor = #colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
                
            }else if indexPath.row >= (myFood1A+myFood2A).count && indexPath.row < (myFood1A+myFood2A+myFood3A).count{
                
                cell.textLabel?.text = "湯品"
                cell.detailTextLabel?.text = allFoodA[indexPath.row]
                cell.detailTextLabel?.textColor = #colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
                
            }else{
                
                cell.textLabel?.text = "甜點"
                cell.detailTextLabel?.text = allFoodA[indexPath.row]
                cell.detailTextLabel?.textColor = #colorLiteral(red: 0.4889183461, green: 0.3858236486, blue: 0.9835967422, alpha: 1)
                
            }
            
            
        }
        
        return cell

        
        
    }
    

    var name1 = ""
    var phone1 = ""
    var local1 = ""
    var table1 = ""
    var many1 = 0
    var menu1 = 0
    
    var titles = ["訂單人","電話","方案","地區","預估桌數","訂單編號"]
    var details = [String]()
    
    var food1 = ""
    var food2 = ""
    var food3 = ""
    var food4 = ""
    
    var menuString = ""
    
    var myFood1A = [String]()
    var myFood2A = [String]()
    var myFood3A = [String]()
    var myFood4A = [String]()
    
    var allFoodA = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myFood1A=food1.components(separatedBy: " ")
        myFood2A=food2.components(separatedBy: " ")
        myFood3A=food3.components(separatedBy: " ")
        myFood4A=food4.components(separatedBy: " ")
        
        
        for _ in myFood1A{
            if let indexNil=myFood1A.index(of: ""){
                myFood1A.remove(at: indexNil)
            }
        }
        for _ in myFood2A{
            if let indexNil=myFood2A.index(of: ""){
                myFood2A.remove(at: indexNil)
            }
        }
        for _ in myFood3A{
            if let indexNil=myFood3A.index(of: ""){
                myFood3A.remove(at: indexNil)
            }
        }
        for _ in myFood4A{
            if let indexNil=myFood4A.index(of: ""){
                myFood4A.remove(at: indexNil)
            }
        }
        
        allFoodA = myFood1A + myFood2A + myFood3A + myFood4A
        
        switch menu1 {
        case 1:
            menuString = "一般方案"
        case 2:
            menuString = "尊貴方案"
        case 3:
            menuString = "小資方案"
        default:
            menuString = "經典方案"
        }
        
        
        details = [name1,phone1,menuString,local1,table1,String(many1)]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
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
