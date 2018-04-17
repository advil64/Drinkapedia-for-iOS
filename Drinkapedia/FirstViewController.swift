//
//  FirstViewController.swift
//  Drinkapedia
//
//  Created by Advith Chegu on 3/6/18.
//  Copyright © 2018 Advith Chegu. All rights reserved.
//

import UIKit

class FirstViewController: ThirdViewController {

    @IBOutlet weak var sugarlabel: UILabel!
    
    @IBOutlet weak var waterlabel: UILabel!
    
    @IBOutlet weak var coffeelabel: UILabel!
    
    @IBOutlet weak var alcohollabel: UILabel!
    
    @IBOutlet weak var displaybtn: UIButton!
    
    var hours = 24

    func alccalculations(){
        
        var totalAmountOfAlcohol = 0.0
        var GENDER_WATER_CON = 0.0
        
        if (ThirdViewController.gender == ("Female")){
            GENDER_WATER_CON = 0.49
        }
            
        else if (ThirdViewController.gender == ("Male")) {
            GENDER_WATER_CON = 0.58
        }
        
        let POUNDS_IN_ONE_KG = 2.2046
        let GRAMS_OF_ALCOHOL_IN_OZ = 23.36
        let BLOOD_IN_BODY_PER = 0.806
        let BAC_DECLINE_PER_HOUR = 0.012
        
        let weightKG = Double(ThirdViewController.weight) / POUNDS_IN_ONE_KG
        let waterBodyConL = weightKG * GENDER_WATER_CON
        
        let waterBodyConML = waterBodyConL * 1000
        let gramsOfAlcoholPerML = GRAMS_OF_ALCOHOL_IN_OZ / waterBodyConML
        
        let gramsOfAlcoholPerBloodML = gramsOfAlcoholPerML * BLOOD_IN_BODY_PER
        let gramsOfAlcoholPerBlood100ML = gramsOfAlcoholPerBloodML * 100
        
        for (index, _) in SecondViewController.drinks.enumerated() {
            
            if (SecondViewController.drinks[index].getType() == ("Alcohol")){
                
                    totalAmountOfAlcohol += (SecondViewController.drinks[index].getConcentration() * SecondViewController.drinks[index].getQuantity())
                
                if (SecondViewController.drinks[index].getHours() < hours){
                    hours = SecondViewController.drinks[index].getHours();
                }
            }
        
        }
        
        let bacBeforeHours = totalAmountOfAlcohol * gramsOfAlcoholPerBlood100ML
        
        let finalBAC = (((bacBeforeHours - (BAC_DECLINE_PER_HOUR * Double(hours))) * 1000.000) / 1000.000)
        
        
        if (finalBAC > 0 ) {
            
            if (finalBAC > 0.08 ) {
                alcohollabel.text = "Your BAC is " + String(finalBAC) + ". WARNING: You are NOT safe to drive!"
                
            }
            else {
                alcohollabel.text = "Your BAC is " + String(finalBAC) + ", you are safe to drive, but be careful. Continue to monitor your consumption."
                
            }
        }
        else {
            alcohollabel.text = "Your BAC is 0, you are safe to drive!"
            
            
        }
        

    }
    
    func SugarCalculations() {
    
    var MAX_SUGAR_OZ = 0.0
    var totalAmountOfSugar = 0.0
    var sugarLeftover = 0.0
        
    if (ThirdViewController.gender == ("Female")){
    
        MAX_SUGAR_OZ = 1.32
    }
        
    else if (ThirdViewController.gender == ("M")) {
    
        MAX_SUGAR_OZ = 0.88
    }
    
    for (index, _) in SecondViewController.drinks.enumerated() {
            
        if (SecondViewController.drinks[index].getType() == ("Sugar")){
                
            totalAmountOfSugar += (SecondViewController.drinks[index].getQuantity())
                
            if (SecondViewController.drinks[index].getHours() < hours){
                    hours = SecondViewController.drinks[index].getHours();
                }
            }
            
        }
        
    
    sugarLeftover = ((MAX_SUGAR_OZ - totalAmountOfSugar) * 100.000) / 100.000;
    
    if (totalAmountOfSugar > MAX_SUGAR_OZ) {
        
    
        sugarlabel.text = "You have went past your daily sugar limit. Please refrain from eating more."
    
    }
    
    else {
        
        sugarlabel.text = "You have consumed " + String(totalAmountOfSugar) +   " ounces of sugar." + " You may consume " + String(sugarLeftover) + " more ounces of sugar."
        }
    }
    
    func CaffeineCalculations(){
    
    var totalAmountOfCaffeine = 0.0
    var caffeineLeftover = 0.0
    let MAX_CAFFEINE_OZ = 0.0141

    for (index, _) in SecondViewController.drinks.enumerated() {
            
        if (SecondViewController.drinks[index].getType() == ("Coffee")){
                
            totalAmountOfCaffeine += (SecondViewController.drinks[index].getQuantity())
                
        if (SecondViewController.drinks[index].getHours() < hours){
        
            hours = SecondViewController.drinks[index].getHours()
            
            }
            
        }
            
    }
        
    
    caffeineLeftover = ((MAX_CAFFEINE_OZ - totalAmountOfCaffeine) * 100.0000) / 100.0000
    
        if (totalAmountOfCaffeine > MAX_CAFFEINE_OZ){
        
            coffeelabel.text = ("You have went past your daily caffeine limit. Please refrain from consuming more.")
        }
        
        else {
    
            coffeelabel.text = ("You have consumed " + String(totalAmountOfCaffeine) + " ounces of caffeine. You may consume " + String(caffeineLeftover) + " more ounces of caffeine. ")
        }
    }
    
    func WaterCalculations(){
    
    let WATER_GOAL = Double(ThirdViewController.weight) * 0.666
    var totalAmountOfWater = 0.0
    
    
        for (index, _) in SecondViewController.drinks.enumerated() {
            
            if (SecondViewController.drinks[index].getType() == ("Water")){
                
                totalAmountOfWater += (SecondViewController.drinks[index].getQuantity())
                
                if (SecondViewController.drinks[index].getHours() < hours){
                    
                    hours = SecondViewController.drinks[index].getHours()
                    
                }
                
            }
            
        }
    
    let waterLeftover = ((WATER_GOAL - totalAmountOfWater) * 100.00) / 100.00
    
    if (totalAmountOfWater > WATER_GOAL) {
        
        waterlabel.text = ("You reached your daily recommended intake! Please consume more water if you still feel thirsty or had just exercised.")
    }
        
    else {

        waterlabel.text = ("You have not reached your recommended daily intake of water. Please try to consume at least " + String(waterLeftover) + " more ounces of water.")
        }
    }

    
    
    @IBAction func displayaction(_ sender: Any) {

        alccalculations()
        WaterCalculations()
        SugarCalculations()
        CaffeineCalculations()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

