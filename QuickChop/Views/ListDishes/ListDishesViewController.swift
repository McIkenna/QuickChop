//
//  ListDishesViewController.swift
//  QuickChop
//
//  Created by New Account on 10/21/21.
//

import UIKit

class ListDishesViewController: UIViewController {
    var category : DishCategory!
    
    var dishes : [Dish] = [
        .init(id:"id1", name: "Egusi Soup", description: "am is the best meal you can ever think of For is the best meal you can ever think of For is the best meal you can ever think of",
            image: "https://picsum.photos/100/200", calories : 38.90),
        .init(id:"id1", name: "Pounded Yam", description: "For is the best meal you can ever think of,For is the best meal you can ever think of For is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 27.90),
        .init(id:"id1", name: "Jollof Rice", description: "Can is the best meal you can ever think For is the best meal you can ever think of For is the best meal you can ever think of of", image: "https://picsum.photos/100/200", calories : 12.94),
        
        .init(id:"id1", name: "Ogbono Soup", description: "For is the best meal you can ever think of For is the best meal you can ever think ofBut is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 108.92),
        .init(id:"id1", name: "Fried Rice", description: "For is the best meal you can ever think of Not is the best meal you can ever think of For is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 3.48)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title =  category.name
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var myTableView : UITableView!
    
    private func registerCells(){
        myTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }

}

extension ListDishesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
