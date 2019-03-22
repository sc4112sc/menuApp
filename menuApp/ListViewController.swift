//
//  ListViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/8.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    @IBOutlet weak var myT: UITableView!
    var titles = ["📋  訂單紀錄","📜  菜單介紹","📰  我的名片","📒  小小幫手"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.textLabel?.text = titles[indexPath.row]
//        switch indexPath.row {
//        case 0:
//            cell.imageView?.image = UIImage(named: "sa1")
//        case 1:
//            cell.imageView?.image = UIImage(named: "sa2")
//        case 2:
//            cell.imageView?.image = UIImage(named: "sa1")
//        default:
//            cell.imageView?.image = UIImage(named: "sa2")
//        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerText = UILabel()
        headerText.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        headerText.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        headerText.textAlignment = .center
        
        if CreatUser.isLogin == true{
            
            headerText.text = "👤 \(CreatUser.loginName)"
            
        }else{
            
            headerText.text = "👤 尚未登入"
        }
        
        return headerText
        
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "allBook") as! AllBookViewController
            present(vc, animated: true, completion: nil)
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "study") as! StudyViewController
            present(vc, animated: true, completion: nil)
        case 2:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "creatUser") as! CreatUser
            present(vc, animated: true, completion: nil)
        default:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "myTab") as! MyTabViewController
            present(vc, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CreatUser.isLogin)
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        myT.reloadData()
    }

    @objc func dismissButtonTapped(_ sender: UIButton) {
        presentingViewController!.dismiss(animated: true, completion: nil)
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
