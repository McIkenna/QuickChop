//
//  DishCategory.swift
//  QuickChop
//
//  Created by New Account on 10/13/21.
//

import Foundation

struct DishCategory : Decodable {
    let id, name, image : String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case name = "title"
        case image
        
    }
}
