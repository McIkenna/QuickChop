//
//  CategoryCollectionViewCell.swift
//  QuickChop
//
//  Created by New Account on 10/13/21.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView : UIImageView!
    @IBOutlet weak var categoryTitleLabel : UILabel!

    func setup(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
        
        print("DEBUGGG: \(category.name) ---- \(category.image)")
    }

}
