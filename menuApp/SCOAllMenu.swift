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
    

    
   static var chooseCount=1
    
    var imgs:[UIImage]=[UIImage(named:"mu1.jpg")!,
                            UIImage(named:"mu2.jpg")!,
                            UIImage(named:"mu3.jpg")!,
                            UIImage(named:"mu4.jpg")!]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell=tableView.dequeueReusableCell(withIdentifier: "Cell2") as! SCOMenuCell
        
        cell.img1.image=imgs[indexPath.row]
        
        
        
        return cell
    }
    var gomymu=0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Food1") as! SCOFood1
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "Tables") as! SCOTables
        
        if indexPath.row==0{
            SCOAllMenu.chooseCount=1
            show(vc, sender: self)
        }else if indexPath.row==1{
            SCOAllMenu.chooseCount=2
            show(vc, sender: self)
        }else if indexPath.row==2{
            SCOAllMenu.chooseCount=3
            show(vc, sender: self)
        }else{
            SCOAllMenu.chooseCount=4
            show(vc4, sender: self)
        }
        
        
        
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
        
        // gomymu=indexPath.row
        
        
       // performSegue(withIdentifier: "yourSegueIdentifer", sender: self)
    }
    
    
   // func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
       // if segue.identifier == "yourSegueIdentifer" {
          //  if let nextVC = segue.destination as? SCOFinal {
               // nextVC.mymu = sender as! Int
           // }
       // }
   // }
    
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
