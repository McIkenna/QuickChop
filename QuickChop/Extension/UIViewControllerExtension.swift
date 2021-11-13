//
//  UIViewControllerExtension.swift
//  QuickChop
//
//  Created by New Account on 10/21/21.
//

import UIKit

extension UIViewController {
    static var identifier : String{
        return String(describing : self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
}
