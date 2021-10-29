//
//  CardView.swift
//  QuickChop
//
//  Created by New Account on 10/14/21.
//

import UIKit
class CardView : UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        cornerRadius = 10
    }
}
