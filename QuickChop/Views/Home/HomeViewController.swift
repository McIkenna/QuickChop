//
//  HomeViewController.swift
//  QuickChop
//
//  Created by New Account on 10/12/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
   
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
            .init(id:"id1", name: "African Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "American Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "Asian Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "Indian Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "European Dish", image: "https://picsum.photos/100/200")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCells()
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
    }
}
