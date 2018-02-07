//
//  SCOAllMenu.swift
//  menuApp
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit


class SCOMenuCell: UITableViewCell{
    
    
@IBOutlet weak var img1: UIImageView!
    
}



class SCOAllMenu: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var imgs:[UIImage]=[UIImage(named:"menu1.jpg")!,
                            UIImage(named:"menu2.JPG")!,
                            UIImage(named:"menu3.jpg")!,
                            UIImage(named:"menu4.jpg")!]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell=tableView.dequeueReusableCell(withIdentifier: "Cell2") as! SCOMenuCell
        
        cell.img1.image=imgs[indexPath.row]
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "food1") as! SCOFood1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
