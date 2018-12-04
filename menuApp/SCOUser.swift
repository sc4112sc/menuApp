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
    

    @IBOutlet weak var remind: UILabel!
    

    
    var boyName:[String]=[]
    var girlName:[String]=[]
    
    var boyImg:[UIImage]=[]
    var girlImg:[UIImage]=[]
    
    var boyPhone:[String]=[]
    var girlPhone:[String]=[]
    
    var boyYear:[String]=[]
    var girlYear:[String]=[]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "<Your Font Name>", size: 20)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = locations[row]
        pickerLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        pickerLabel?.font = UIFont (name: "Helvetica Neue", size: 22)
        
        pickerLabel?.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        //pickerLabel?.backgroundColor = UIColor.orange
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        
        if locations[row]==locations[0] {
           boyName=["小明","小智","老王","志明"]
            boyImg=[UIImage(named:"b1.jpg")!,
                    UIImage(named:"b2.jpg")!,
                    UIImage(named:"b3.jpg")!,
                    UIImage(named:"b4.jpg")!]
            
           girlName=["小美","小愛","小盈"]
            girlImg=[UIImage(named:"g1.jpg")!,
                     UIImage(named:"g2.jpg")!,
                     UIImage(named:"g3.jpg")!]
            
           boyPhone=["0912345678","0987654321","0944773321","0988456725"]
           girlPhone=["0954906945","0954608549","0943294023"]
            
            boyYear=["擁有15年經歷，拿手菜：佛跳牆","擁有20年經歷，拿手菜：紅燒魚翅羹","擁有8年經歷，拿手菜：紅蟳米糕","擁有10年經歷，拿手菜：六色拼盤"]
            girlYear=["擁有6年經歷，拿手菜：川燙活蝦","擁有13年經歷，拿手菜：花跳魚湯","擁有25年經歷，拿手菜：清蒸石斑"]
            
           myTile="北部"
            
            print(boyName)
        }else if locations[row]==locations[1] {
            boyName=["大雄","胖虎","小夫"]
            boyImg=[UIImage(named:"bnew5.jpg")!,
                    UIImage(named:"b6.jpg")!,
                    UIImage(named:"b7.jpg")!]
            
            girlName=["阿娟","露露","小喬"]
            girlImg=[UIImage(named:"g4.jpg")!,
                     UIImage(named:"g5.jpg")!,
                     UIImage(named:"g6.jpg")!]
            
            boyPhone=["0922234128","0976558451","0999876122"]
            girlPhone=["0934565434","0912141467","0966352112"]
            
            boyYear=["擁有35年經歷，拿手菜：紅燒鮑魚","擁有21年經歷，拿手菜：紅燒魚翅羹","擁有7年經歷，拿手菜：生炒干貝"]
            girlYear=["擁有16年經歷，拿手菜：鳳梨蝦球","擁有10年經歷，拿手菜：花跳魚湯","擁有22年經歷，拿手菜：生魚片"]
            
            myTile="中部"
            
            print(boyName)
        }else if locations[row]==locations[2] {
            boyName=["小黑","小白","小黃"]
            boyImg=[UIImage(named:"b8.jpg")!,
                    UIImage(named:"b9.jpg")!,
                    UIImage(named:"b10.jpg")!]
            
            girlName=["大喬","小萱"]
            girlImg=[UIImage(named:"g7.jpg")!,
                     UIImage(named:"g8.jpg")!]
            
            boyPhone=["0934565834","0956767563","0996786053"]
            girlPhone=["0954665067","0964565400"]
            
            boyYear=["擁有30年經歷，拿手菜：八寶丸","擁有5年經歷，拿手菜：將絲炒大腸","擁有14年經歷，拿手菜：龍江脆皮雞"]
            girlYear=["擁有11年經歷，拿手菜：法式焗鮮蝦","擁有16年經歷，拿手菜：金沙豆腐"]
            
            myTile="南部"
            
            print(boyName)
        }else if locations[row]==locations[3] {
            boyName=["哈特利","獅子丸"]
            boyImg=[UIImage(named:"b11.jpg")!,
                    UIImage(named:"b12.jpeg")!]
            
            girlName=["蓁蓁","小珊","婷婷","春嬌"]
            girlImg=[UIImage(named:"g9.jpg")!,
                     UIImage(named:"g10.jpg")!,
                     UIImage(named:"g11.jpeg")!,
                     UIImage(named:"g12.png")!]
            
            boyPhone=["0970789465","0907905673"]
            girlPhone=["0964535841","0902935039","0953453401","0954334209"]
            
            boyYear=["擁有9年經歷，拿手菜：龍蝦三明治","擁有19年經歷，拿手菜：紅燒魚翅羹"]
            girlYear=["擁有26年經歷，拿手菜：鮑魚燴花菇","擁有17年經歷，拿手菜：花跳魚湯","擁有20年經歷，拿手菜：生魚片","擁有13年經歷，拿手菜：清蒸海上鮮"]
            
            myTile="東部"
            
            print(boyName)
        }else{
            
        }
    }
    
    
    
    @IBOutlet weak var mySW: UISwitch!
    @IBAction func calMySW(_ sender: UISwitch) {
        
        if sender.isOn == true{
            UIView.animate(withDuration: 1) {
                self.remind.frame.origin.x = 0
           }
        }else{
            UIView.animate(withDuration: 1) {
                self.remind.frame.origin.x = 380
            }
        }
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
        
        vc.yearB=boyYear
        vc.yearG=girlYear
        
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBtn.layer.cornerRadius = 30
        
        boyName=["小明","小智","老王","志明"]
        boyImg=[UIImage(named:"b1.jpg")!,
                UIImage(named:"b2.jpg")!,
                UIImage(named:"b3.jpg")!,
                UIImage(named:"b4.jpg")!]
        
        girlName=["小美","小愛","小盈"]
        girlImg=[UIImage(named:"g1.jpg")!,
                 UIImage(named:"g2.jpg")!,
                 UIImage(named:"g3.jpg")!]
        
        boyPhone=["0912345678","0987654321","0944773321","0988456725"]
        girlPhone=["0954906945","0954608549","0943294023"]
        
        boyYear=["擁有15年經歷，拿手菜：佛跳牆","擁有20年經歷，拿手菜：紅燒魚翅羹","擁有8年經歷，拿手菜：紅蟳米糕","擁有10年經歷，拿手菜：六色拼盤"]
        girlYear=["擁有6年經歷，拿手菜：川燙活蝦","擁有13年經歷，拿手菜：花跳魚湯","擁有25年經歷，拿手菜：清蒸石斑"]
        
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
