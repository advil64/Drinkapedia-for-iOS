//
//  SecondViewController.swift
//  Drinkapedia
//
//  Created by Advith Chegu on 3/6/18.
//  Copyright © 2018 Advith Chegu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var DrinkPicker: UIPickerView!
    @IBOutlet weak var quantitytext: UITextField!
    @IBOutlet weak var alcconcentrationtext: UITextField!
    @IBOutlet weak var hourstext: UITextField!
    @IBOutlet weak var submitbtn: UIButton!
    var dr : String = "Alcohol"
    static var drinks = [drinkinfo]()
    var drinkpick = ["Alcohol", "Water", "Coffee", "Sugar"]
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return drinkpick[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return drinkpick.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dr = drinkpick[row]
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        SecondViewController.drinks.append(drinkinfo(type : dr, quantity : Double(quantitytext.text!)!, concentration : Double(alcconcentrationtext.text!)!, hours : Int(hourstext.text!)!))
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }


}

