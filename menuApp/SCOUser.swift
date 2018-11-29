//
//  SCOUser.swift
//  menuApp
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit

class SCOUser: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var locations : [String] = ["北部","中部","南部","東部"]
    var myTile=""
    
    var boyName1:[String]=["小明","小智","老王","志明"]
    var boyName2:[String]=["大雄","胖虎","小夫"]
    var boyName3:[String]=["小黑","小白","小黃"]
    var boyName4:[String]=["哈特利","獅子丸"]
    
    var boyImg1:[UIImage]=[UIImage(named:"b1.jpg")!,
                           UIImage(named:"b2.jpg")!,
                           UIImage(named:"b3.jpg")!,
                           UIImage(named:"b4.jpg")!]
    
    var boyImg2:[UIImage]=[UIImage(named:"bnew5.jpg")!,
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
    
    var boyPhone:[String]=[]
    var girlPhone:[String]=[]
    
    var boyPhone1:[String]=["0912345678","0987654321","0944773321","0988456725"]
    var boyPhone2:[String]=["0922234128","0976558451","0999876122"]
    var boyPhone3:[String]=["0934565834","0956767563","0996786053"]
    var boyPhone4:[String]=["0970789465","0907905673"]
    
     var girlPhone1:[String]=["0954906945","0954608549","0943294023"]
     var girlPhone2:[String]=["0934565434","0912141467","0966352112"]
     var girlPhone3:[String]=["0954665067","0964565400"]
     var girlPhone4:[String]=["0964535841","0902935039","0953453401","0954334209"]
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "<Your Font Name>", size: 22)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = locations[row]
        pickerLabel?.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        pickerLabel?.font = UIFont (name: "Helvetica Neue", size: 22)
        //pickerLabel?.backgroundColor = UIColor.orange
        return pickerLabel!
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
            
           boyPhone=boyPhone1
           girlPhone=girlPhone1
            
           myTile="北部"
            
            print(boyName)
        }else if locations[row]==locations[1] {
            boyName=boyName2
            boyImg=boyImg2
            
            girlName=girlName2
            girlImg=girlImg2
            
            boyPhone=boyPhone2
            girlPhone=girlPhone2
            
            myTile="中部"
            
            print(boyName)
        }else if locations[row]==locations[2] {
            boyName=boyName3
            boyImg=boyImg3
            
            girlName=girlName3
            girlImg=girlImg3
            
            boyPhone=boyPhone3
            girlPhone=girlPhone3
            
            myTile="南部"
            
            print(boyName)
        }else if locations[row]==locations[3] {
            boyName=boyName4
            boyImg=boyImg4
            
            girlName=girlName4
            girlImg=girlImg4
            
            boyPhone=boyPhone4
            girlPhone=girlPhone4
            
            myTile="東部"
            
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
    
    
    

    @IBOutlet weak var searchBtn: UIButton!
    @IBAction func search(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "cooker") as! SCOCooker
        

        vc.titals=myTile
        
        vc.arysB=boyName
        vc.arysG=girlName
        
        vc.imgsB=boyImg
        vc.imgsG=girlImg
        
        vc.phoneB=boyPhone
        vc.phoneG=girlPhone
        
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBtn.layer.cornerRadius = 30
        
        boyName=boyName1
        boyImg=boyImg1
        
        girlName=girlName1
        girlImg=girlImg1
        
        boyPhone=boyPhone1
        girlPhone=girlPhone1
        
        myTile="北部"
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
