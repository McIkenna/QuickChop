//
//  DishListTableViewCell.swift
//  QuickChop
//
//  Created by New Account on 10/21/21.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

    static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageView: UIImageView!
    
  
    @IBOutlet weak var dishTitleLabel: UILabel!
    
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    
    func setup(dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
    }
    
    func setUpOrder(order : Order){
        
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        dishTitleLabel.text = order.dish?.name
            dishDescriptionLabel.text = order.name
    }
}
