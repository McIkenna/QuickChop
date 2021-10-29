//
//  ListOrders.swift
//  QuickChop
//
//  Created by New Account on 10/26/21.
//

import UIKit

class ListOrders: UIViewController {
    
    @IBOutlet weak var orderTable : UITableView!
    var orders : [Order] = [
        .init(id: "id", name: "Josephine",  dish :
                    .init(
            id:"id1", name: "Egusi Soup", description: "am is the best meal you can ever think of For is the best meal you can ever think of For is the best meal you can ever think of",
            image: "https://picsum.photos/100/200", calories : 38.90)),
        .init(id: "id", name: "Chidinma",  dish :
                    .init(id:"id1", name: "Rice Meal", description: "The best meal on the surface of the earth, prepared for personal satisfaction",
            image: "https://picsum.photos/100/200", calories : 38.90)),
        .init(id: "id", name: "Kenneth",  dish :
                    .init(id:"id1", name: "Spaghetti", description: "This is an italian delicacy made for the bold",
            image: "https://picsum.photos/100/200", calories : 38.90)),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells(){
        orderTable.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}


extension ListOrders : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        
        cell.setUpOrder(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
