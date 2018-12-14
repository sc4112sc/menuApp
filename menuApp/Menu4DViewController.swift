//
//  Menu4DViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/7.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class Menu4DViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var food1A = ["五福臨門大拼盤","烏魚子拼盤"]
    var food2A = ["八寶丸","櫻花蝦米糕","法式焗烤蝦","清蒸海上鮮","綜合生魚片"]
    var food3A = ["翡翠羹","魚翅羹"]
   
    
    var food1Img = [UIImage(named:"bb1.jpg")!,
                    UIImage(named:"bb2.jpg")!]
    var food2Img = [UIImage(named:"w1.jpg")!,
                    UIImage(named:"w2.jpg")!,
                    UIImage(named:"w3.JPG")!,
                    UIImage(named:"w4.jpg")!,
                    UIImage(named:"w5.jpg")!]
    var food3Img = [ UIImage(named:"r3.jpg")!,
                     UIImage(named:"r4.jpg")!]
    
    
    var money1A = ["預估價為$800","預估價為$1000"]
    var money2A = ["預估價為$800","預估價為$1000","預估價為$500","預估價為$300","預估價為$600"]
    var money3A = ["預估價為$500","預估價為$300"]
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 2
        case 1:
            return 5
        case 2:
            return 2
        default:
            return 1
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
            cell.textLabel?.text = "時鮮水果盤"
            cell.imageView?.image = UIImage(named:"t3.jpg")
            cell.detailTextLabel?.text = "預估價為$500"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
