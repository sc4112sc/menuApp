//
//  ViewController.swift
//  menuApp
//
//  Created by ios on 2018/1/26.
//  Copyright © 2018年 ios. All rights reserved.
//

import UIKit





class ViewController: UIViewController,UIPopoverPresentationControllerDelegate{

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var popoverCtrl = segue.destination.popoverPresentationController
        
        if sender is UIButton {
            popoverCtrl?.sourceRect = (sender as! UIButton).bounds
        }
        else if sender is UIBarButtonItem{
            popoverCtrl?.barButtonItem = sender as? UIBarButtonItem
        }
        popoverCtrl?.delegate = self
    }
    
    @IBOutlet weak var popBtn: UIBarButtonItem!
   
    
    
    @IBAction func calPop(_ sender: Any) {
        



        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }

    
    @IBAction func btn1(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "scouser") as! SCOUser
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "allmenu") as! SCOAllMenu
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var mytimer:Timer! = nil
    
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func changeImg(_ sender: UIPageControl) {
        self.change1()
    }
    
    @IBAction func swipeR(_ sender: UISwipeGestureRecognizer) {
        print("right")
        
        
        if pageControl.currentPage==0{
            
            pageControl.currentPage=pageControl.numberOfPages-1
            
        }else{
            
            pageControl.currentPage=pageControl.currentPage-1
        }
        
        self.change1()
    }
    @IBAction func swipeL(_ sender: UISwipeGestureRecognizer) {
        print("left")
        
        if pageControl.currentPage==pageControl.numberOfPages-1{
            
            pageControl.currentPage=0
            
        }else{
            
            pageControl.currentPage=pageControl.currentPage+1
            
        }
        
        self.change1()
    }
    
    func change1(){
        
        
        switch pageControl.currentPage {
        case 0:
            imgA.image = UIImage(named: "ch1.jpg")
            
        case 1:
            imgA.image = UIImage(named: "ch2.jpg")
           
        case 2:
            imgA.image = UIImage(named: "ch3.jpg")
            
        case 3:
            imgA.image = UIImage(named: "ch4.jpg")
            
        case 4:
            imgA.image = UIImage(named: "ch5.jpg")
            
        default:
            imgA.image = nil
            
        }
        
    }
    
    
    
    

    
    @objc func calImage() {
        
        if pageControl.currentPage==pageControl.numberOfPages-1{
            
            pageControl.currentPage=0
            
        }else{
            
            pageControl.currentPage=pageControl.currentPage+1
            
        }
        
         self.change1()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgA.image = UIImage(named: "m0")
        pageControl.currentPage = 0
        
        mytimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calImage), userInfo: nil, repeats: true)
        
        mytimer.fire()
        
        self.navigationItem.leftBarButtonItem?.image = UIImage(named: "orderAll")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

