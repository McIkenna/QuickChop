//
//  Route.swift
//  QuickChop
//
//  Created by New Account on 10/27/21.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    var description : String {
        switch self {
        case .temp: return "/dishes/cat1"
        }
    }
}
