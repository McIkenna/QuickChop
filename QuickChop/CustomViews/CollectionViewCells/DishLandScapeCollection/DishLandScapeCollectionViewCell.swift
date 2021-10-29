//
//  DishLandScapeCollectionViewCell.swift
//  QuickChop
//
//  Created by New Account on 10/18/21.
//

import UIKit

class DishLandScapeCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: DishLandScapeCollectionViewCell.self)
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish: Dish){
        dishImage.kf.setImage(with:dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formatedCalories
    }

}
