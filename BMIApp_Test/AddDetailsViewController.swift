//Name : Deepshi
//Student No: 301089444

//  AddDetailsViewController.swift
//  BMIApp_Test
//
//  Created by Student on 2019-12-11.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddDetailsViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var genderField: UITextField!
    
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    
    
    @IBOutlet weak var unitChanger: UISwitch!
    
    
    
    
    @IBOutlet weak var BMIlbl: UILabel!
    

    @IBOutlet weak var intLbl: UILabel!
    
    
    var american = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BMIlbl.text = ""
       
        if (american == true)
        {
            unitChanger.setOn(true, animated: true)
        }
        else
        {
            unitChanger.setOn(false, animated: true)
        }


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unitOption(_ sender: Any) {
        
        if unitChanger.isOn {
            unitChanger.setOn(true, animated:true)
            american = true;
        } else {
            unitChanger.setOn(false, animated:true)
            american = false;
        }
    }
    
        
    @IBAction func calculateBMI(_ sender: UIButton) {
        
      let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let data = Data(context: context)
        data.name = nameField.text!
        data.age  = Int16(ageField.text!)
        data.gender = genderField.text!
        data.height = Double(heightField.text!)
        
    var weight = 0.0
        var height = 0.0
        if let h = Double(heightField.text!){
            height = h
        }
        if let w = Double(weightField.text!) {
            weight = w
        }
        
        if( american ){
            weight += 20
        }
        
        var bmiCalc = (weight * 703) / (height * height)
        if( bmiCalc.isNaN ){
            bmiCalc = 0.0
        }
        BMIlbl.text = String(format: "%.2f", bmiCalc)
        let status = getBMIstatus(bmi: bmiCalc)
        intLbl.text = status
    }
    
    func getBMIstatus( bmi:Double ) -> String {
        var status = ""
        
        if( bmi < 16.0){
            status = "Severely Underweight"
        } else if( bmi < 18.0 ){
            status = "Underweight"
        } else if( bmi < 22 ){
            status = "Normal"
        } else if( bmi < 26 ){
            status = "Overweight"
        } else {
            status = "Severely Overweight"
        }
        
        return status
    }
    
    
    

}
