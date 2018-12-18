//
//  StudyViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/9.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var titles = ["八寶丸","佛跳牆","櫻花蝦米糕","龍蝦三明治","法式焗鮮蝦","鳳梨蝦球","鮑魚燴花菇","五福臨門大拼盤","魚翅羹","翡翠羹"]
    
    var img1 = ["w1.jpg","r1.jpg","w2.jpg","w12.jpg","w3.JPG","w10.jpg","w9.Jpeg","bb1.jpg","r3.jpg","r1.jpg"]
    var img2 = ["study01.jpg","study02.jpg","study03.jpg","study04.jpg","study05.jpg","study06.jpg","study07.jpg","study08.jpg","study09.jpg","study10.jpg"]
    @IBAction func calDone(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell1")!
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.imageView?.image = UIImage(named: "rice1")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "熱門菜色"
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "insideStudy") as! InsideStudyViewController
        vc.imgName1 = img1[indexPath.row]
        vc.imgName2 = img2[indexPath.row]
        show(vc, sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
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
