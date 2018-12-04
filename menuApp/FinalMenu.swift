//
//  FinalMenu.swift
//  menuApp
//
//  Created by 李書賢 on 2018/11/27.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit


class FinalMenu: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var food1A = [String]()
    var food2A = [String]()
    var food3A = [String]()
    var food4A = [String]()
    
    var food1Img = [UIImage]()
    var food2Img = [UIImage]()
    var food3Img = [UIImage]()
    var food4Img = [UIImage]()
    
    var money1A = [String]()
    var money2A = [String]()
    var money3A = [String]()
    var money4A = [String]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (section) {
        case 0: 
            return food1A.count
        case 1:
            return food2A.count
        case 2:
            return food3A.count
        default:
            return food4A.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        
        switch (indexPath.section) {
        case 0:
             cell.textLabel?.text = food1A[indexPath.row]
            cell.imageView?.image = food1Img[indexPath.row]
            cell.detailTextLabel?.text = money1A[indexPath.row]
        case 1:
            cell.textLabel?.text = food2A[indexPath.row]
            cell.imageView?.image = food2Img[indexPath.row]
            cell.detailTextLabel?.text = money2A[indexPath.row]
        case 2:
            cell.textLabel?.text = food3A[indexPath.row]
            cell.imageView?.image = food3Img[indexPath.row]
            cell.detailTextLabel?.text = money3A[indexPath.row]
        default:
            cell.textLabel?.text = food4A[indexPath.row]
            cell.imageView?.image = food4Img[indexPath.row]
            cell.detailTextLabel?.text = money4A[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        food1A = SCOFood1.food1A
        food2A = SCOFood2.food2A
        food3A = SCOFood3.food3A
        food4A = SCOFood4.food4A
        
        food1Img = SCOFood1.food1Img
        food2Img = SCOFood2.food2Img
        food3Img = SCOFood3.food3Img
        food4Img = SCOFood4.food4Img
        
        money1A = SCOFood1.money1A
        money2A = SCOFood2.money2A
        money3A = SCOFood3.money3A
        money4A = SCOFood4.money4A
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        headerText.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headerText.textAlignment = .center
        switch (section) {
        case 0:
            headerText.text = "前菜"
        case 1:
            headerText.text = "主菜"
        case 2:
            headerText.text = "湯品"
        default:
            headerText.text = "甜點"
        }
        
        return headerText
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
