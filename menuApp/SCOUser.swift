//
//  SCOUser.swift
//  menuApp
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOUser: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var locations : [String] = ["台北","台中","台南","高雄"]

    
    var boyName1:[String]=["小明","小智","老王","志明"]
    var boyName2:[String]=["大雄","胖虎","小夫"]
    var boyName3:[String]=["小黑","小白","小黃"]
    var boyName4:[String]=["哈特利","獅子丸"]
    
    var boyImg1:[UIImage]=[UIImage(named:"b1.jpg")!,
                           UIImage(named:"b2.jpg")!,
                           UIImage(named:"b3.jpg")!,
                           UIImage(named:"b4.jpg")!,]
    
    var boyImg2:[UIImage]=[UIImage(named:"b5.jpg")!,
                           UIImage(named:"b6.jpg")!,
                           UIImage(named:"b7.jpg")!]
    
    var boyImg3:[UIImage]=[UIImage(named:"b8.jpg")!,
                           UIImage(named:"b9.jpg")!,
                           UIImage(named:"b10.jpg")!]
    
    var boyImg4:[UIImage]=[UIImage(named:"b11.jpg")!,
                           UIImage(named:"b12.jpeg")!]
    
    var girlName1:[String]=["小美","小愛","小盈"]
    var girlName2:[String]=["阿娟","露露","小喬"]
    var girlName3:[String]=["大喬","小萱"]
    var girlName4:[String]=["蓁蓁","小珊","婷婷","春嬌"]
    
    var girlImg1:[UIImage]=[UIImage(named:"g1.jpg")!,
                           UIImage(named:"g2.jpg")!,
                           UIImage(named:"g3.jpg")!]
    
    var girlImg2:[UIImage]=[UIImage(named:"g4.jpg")!,
                            UIImage(named:"g5.jpg")!,
                            UIImage(named:"g6.jpg")!]
    
    var girlImg3:[UIImage]=[UIImage(named:"g7.jpg")!,
                            UIImage(named:"g8.jpg")!]
    
    var girlImg4:[UIImage]=[UIImage(named:"g9.jpg")!,
                            UIImage(named:"g10.jpg")!,
                            UIImage(named:"g11.jpeg")!,
                            UIImage(named:"g12.png")!]
    
    var boyName:[String]=[]
    var girlName:[String]=[]
    
    var boyImg:[UIImage]=[]
    var girlImg:[UIImage]=[]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        

        
        if locations[row]==locations[0] {
           boyName=boyName1
           boyImg=boyImg1
            
           girlName=girlName1
           girlImg=girlImg1
            
            print(boyName)
        }else if locations[row]==locations[1] {
            boyName=boyName2
            boyImg=boyImg2
            
            girlName=girlName2
            girlImg=girlImg2
            
            print(boyName)
        }else if locations[row]==locations[2] {
            boyName=boyName3
            boyImg=boyImg3
            
            girlName=girlName3
            girlImg=girlImg3
            
            print(boyName)
        }else if locations[row]==locations[3] {
            boyName=boyName4
            boyImg=boyImg4
            
            girlName=girlName4
            girlImg=girlImg4
            
            print(boyName)
        }else{
            
        }
    }
    
    @IBOutlet weak var mySW: UISwitch!
    @IBAction func calMySW(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var mySeg: UISegmentedControl!
    @IBAction func calMySeg(_ sender: UISegmentedControl) {
    }
    
    
    
    @IBAction func search(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cooker") as! SCOCooker
        self.present(vc, animated: true) {
            print("go!")
        }
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
