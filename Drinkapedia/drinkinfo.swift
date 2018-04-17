//
//  drinkinfo.swift
//  Drinkapedia
//
//  Created by Advith Chegu on 3/8/18.
//  Copyright © 2018 Advith Chegu. All rights reserved.
//

import Foundation

class drinkinfo : NSObject{
    
    var type : String
    var quantity : Double
    var concentration : Double
    var hours : Int
    
    init(type : String, quantity : Double, concentration : Double, hours : Int){
        
        self.type = type
        self.quantity = quantity
        self.concentration = concentration
        self.hours = hours
    }

    func getType() -> String{
        return type
}

    func getQuantity() -> Double{
        return quantity
}

    func getConcentration() -> Double{
        return concentration
}

    func getHours() -> Int{
        return hours
}

}
