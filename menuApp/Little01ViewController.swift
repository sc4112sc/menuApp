//
//  Little01ViewController.swift
//  menuApp
//
//  Created by 李書賢 on 2018/12/12.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit

class Little01ViewController: UIViewController {

    @IBOutlet weak var myText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myText.text = "問：App註冊步驟為何？\n\n\n答：為了將用戶通知給總鋪師們，避免交易糾紛，需要您以信箱完成帳號註冊。註冊成功後，就可進行訊息，不必再做額外操作。經下列步驟：(1) 進入登入頁面，創造帳號。(2) 輸入帳號密碼進行登入(3) 可上傳頭像以供參考。\n\n\n問：如何送出訂單？\n\n\n答：經客戶選擇菜色完畢後，輸入真實手機號碼以供往後訂單受理事宜，並輸入姓名與桌數以供參考。訂單送出後，等待受理期間，可以即時取消。訂單受理後，受理廚師將主動跟您連絡。"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calDone(_ sender: UIButton) {
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
