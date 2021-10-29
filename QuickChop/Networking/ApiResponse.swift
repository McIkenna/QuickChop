//
//  ApiResponse.swift
//  QuickChop
//
//  Created by New Account on 10/29/21.
//

import Foundation

struct ApiResponse<T : Decodable> : Decodable {
    let status: Int
    let message : String?
    let data : T?
    let error : String?
}
