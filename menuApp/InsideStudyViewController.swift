//
//  InsideStudyViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/9.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class InsideStudyViewController: UIViewController {
    
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var myImg2: UIImageView!
    

    
    var imgName1 = ""
    var imgName2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImg.image = UIImage(named: imgName1)
        myImg2.image = UIImage(named: imgName2)
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
