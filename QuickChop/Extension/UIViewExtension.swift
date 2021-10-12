//
//  UIViewExtension.swift
//  QuickChop
//
//  Created by New Account on 10/11/21.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat {
        get{return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
