//
//  ViewController.swift
//  GiaiPTBac2_Xcode
//
//  Created by Tran Van Tin on 4/9/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txta: UITextField!
    @IBOutlet var txtb: UITextField!
    @IBOutlet var txtc: UITextField!
    @IBOutlet var lblKq1: UILabel!
    @IBOutlet var lblKq2: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblKq1.isHidden = true
        lblKq2.isHidden = true
        self.txta.delegate = self
        self.txtb.delegate = self
        self.txtc.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        
        let components = string.components(separatedBy: inverseSet)
        
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                if string == "-" {
                    if (textField.text!.isEmpty == true){
                        return true
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
    }

    
    @IBAction func btnGiai(_ sender: Any) {
        lblKq2.text = ""
        lblKq1.isHidden = false
        if(txta.text! == "" || txtb.text! == "" || txtc.text! == ""){
            lblKq1.text = "Ban chua nhap du cac so!!!"
        } else {
            let a:Double = Double(txta.text!)!
            let b:Double = Double(txtb.text!)!
            let c:Double = Double(txtc.text!)!
            
            if(a==0){
                if(b==0){
                    if(c==0){
                        lblKq1.text = "Phuong trinh co nghiem bat ky!"
                    } else {
                        lblKq1.text = "Phuong trinh vo nghiem!"
                    }
                } else if(c==0){
                    lblKq1.text = "PT co nghiem x = 0"
                } else {
                    lblKq1.text = "Phuong trinh co nghiem x = \(-c/b)!"
                }
            } else {
                let delta = ((b*b) - (4*a*c))
                if(delta<0){
                    lblKq1.text = "Phuong trinh vo nghiem!"
                } else if(delta == 0){
                    let x = (-b)/(2*a)
                    lblKq1.text = "Phuong trinh co nghiem x = \(x)!"
                } else {
                    lblKq2.isHidden = false
                    let x1 = (-b-sqrt(delta))/(2*a)
                    let x2 = (-b+sqrt(delta))/(2*a)
                    lblKq1.text = "Phuong trinh co nghiem x1 = \(x1)!"
                    lblKq2.text = "Phuong trinh co nghiem x2 = \(x2)!"
                }
            }
        }
    }

}

