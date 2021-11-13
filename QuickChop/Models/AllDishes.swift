//
//  AllDishes.swift
//  QuickChop
//
//  Created by New Account on 11/3/21.
//

import Foundation

struct AllDishes : Decodable {
    let categories : [DishCategory]?
    let populars : [Dish]?
    let specials : [Dish]?
}
