//
//  ListOrders.swift
//  QuickChop
//
//  Created by New Account on 10/26/21.
//

import UIKit
import ProgressHUD
class ListOrders: UIViewController {
    
    @IBOutlet weak var orderTable : UITableView!
    var orders : [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
        ProgressHUD.show()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders{[weak self](result) in
                                          switch result {
        case .success(let orders):
            ProgressHUD.dismiss()
            self?.orders = orders
            self?.orderTable.reloadData()
        case .failure(let error):
            ProgressHUD.showError(error.localizedDescription)
                                          }}
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
