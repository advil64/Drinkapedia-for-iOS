//
//  SecondViewController.swift
//  Drinkapedia
//
//  Created by Advith Chegu on 3/6/18.
//  Copyright © 2018 Advith Chegu. All rights reserved.
//insert other gender

import UIKit

class ThirdViewController: SecondViewController{
    
    @IBOutlet weak var genderbox: UISegmentedControl!
    @IBOutlet weak var contactnumberbox: UITextField!
    @IBOutlet weak var namebox: UITextField!
    @IBOutlet weak var weightbox: UITextField!
    @IBOutlet weak var agebox: UITextField!
    @IBOutlet weak var submitbox: UIButton!
    
    static var gender : String = "Male"
    static var phone : Int = 0
    static var name : String = ""
    static var weight : Int = 0
    static var age : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func indexChanged(_ sender: AnyObject) {
        
        switch genderbox.selectedSegmentIndex
        {
        case 0:
            ThirdViewController.gender = "Male"
        case 1:
            ThirdViewController.gender  = "Female"
        default:
            ThirdViewController.gender = "Male"
        }
    }
    
    @IBAction func sbmtbtn(_ sender: Any) {
        
        ThirdViewController.phone = Int(contactnumberbox.text!)!
        ThirdViewController.name = namebox.text!
        ThirdViewController.weight = Int(weightbox.text!)!
        ThirdViewController.age = Int(agebox.text!)!
    }
}


