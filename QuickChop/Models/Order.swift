//
//  Order.swift
//  QuickChop
//
//  Created by New Account on 10/26/21.
//

import Foundation

struct Order : Decodable{
    let id: String?
    let name: String?
    let dish: Dish?
}
