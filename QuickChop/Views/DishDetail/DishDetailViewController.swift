//
//  DishDetailViewController.swift
//  QuickChop
//
//  Created by New Account on 10/21/21.
//

import UIKit
import ProgressHUD
class DishDetailViewController: UIViewController {

    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    var dish : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateView()
    }
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formatedCalories
        
    }
    @IBAction func placeOrderButton(){
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
                  ProgressHUD.showError("Please Enter your name")
                  return
              }
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name){
            (result) in
            switch result {
            case .success(let order):
                ProgressHUD.showSuccess("Your order has been received.")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }


}
