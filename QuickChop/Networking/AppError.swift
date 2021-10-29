//
//  AppError.swift
//  QuickChop
//
//  Created by New Account on 10/27/21.
//

import Foundation

enum AppError : LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self{
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "The error is unknown"
        case .invalidUrl:
            return "Common, you cant be serious"
        case .serverError(let error):
            return error
        }
    }
}
