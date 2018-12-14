//
//  AllBookViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/6.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit
import CoreData

class AllBookViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //CoreData
    var context:NSManagedObjectContext!
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        cell.textLabel?.text = "訂單人 : \(myData[indexPath.row].myName)"
        cell.detailTextLabel?.text = "訂單編號 : \(myData[indexPath.row].myMany)"
        
       
        
        
        cell.imageView?.image = UIImage(named: "cr1")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let secVC=storyboard?.instantiateViewController(withIdentifier: "allCheck") as! AllCheckViewController
        secVC.name1=myData[indexPath.row].myName
        secVC.many1=Int(myData[indexPath.row].myMany)
        secVC.menu1=Int(myData[indexPath.row].myMenu)
        secVC.phone1=myData[indexPath.row].myPhone
        secVC.local1=myData[indexPath.row].myLocal
        secVC.table1=myData[indexPath.row].myTable
        
        secVC.food1=myFoodData[indexPath.row].myFood1
        secVC.food2=myFoodData[indexPath.row].myFood2
        secVC.food3=myFoodData[indexPath.row].myFood3
        secVC.food4=myFoodData[indexPath.row].myFood4
        
        show(secVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let fetchRepuest:NSFetchRequest<Food>=Food.fetchRequest()
            let predicate=NSPredicate(format: "many = '\(myData[indexPath.row].myMany)'")
            fetchRepuest.predicate=predicate
            let allItems = try! context.fetch(fetchRepuest)
            context.delete(allItems[0])
            appDel.saveContext()
            
            myData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBOutlet weak var myTableView: UITableView!
    var myData:[(myName:String,myPhone:String,myMenu:Int16,myTable:String,myLocal:String,myMany:Int16)] = []
    var myFoodData:[(myFood1:String,myFood2:String,myFood3:String,myFood4:String)] = []
    
    override func viewDidAppear(_ animated: Bool) {
        //先清空 否則會堆疊
        myData=[]
        myFoodData=[]
        
        context = appDel.persistentContainer.viewContext
        let allItems = try! context.fetch(Food.fetchRequest())
        
        for item in allItems as! [Food]
        {
            
            
            myData.append((item.name!,item.phone!,item.menu,item.table!,item.local!,item.many))
            
            myFoodData.append((item.food1!,item.food2!,item.food3!,item.food4!))
            
        }
        //重新載入
        myTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //CoreData
        
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calDone(_ sender: Any) {
        
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
