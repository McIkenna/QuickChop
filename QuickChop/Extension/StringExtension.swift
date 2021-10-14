//
//  StringExtension.swift
//  QuickChop
//
//  Created by New Account on 10/13/21.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
