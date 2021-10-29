//
//  Dish.swift
//  QuickChop
//
//  Created by New Account on 10/14/21.
//

import Foundation
import UIKit

struct Dish : Decodable{
    let id: String?
    let name: String?
    let description: String?
    let image : String?
    let calories: Double?
    
    var formatedCalories: String{
        return String(format: "%.2f calories", calories ?? 0)
    }
}
