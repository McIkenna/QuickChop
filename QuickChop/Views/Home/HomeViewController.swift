//
//  HomeViewController.swift
//  QuickChop
//
//  Created by New Account on 10/12/21.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
  //  @IBOutlet weak var specialCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionview : UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var categories : [DishCategory] = []
    var populars : [Dish] = []
    
    var specials: [Dish] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories{
            [weak self] (result) in
            switch result {
            case .success(let allDishes):
               ProgressHUD.dismiss()
                
            self?.categories = allDishes.categories ?? []
            self?.populars = allDishes.populars ?? []
            self?.specials = allDishes.specials ?? []
                
            self?.categoryCollectionView.reloadData()
            self?.popularCollectionview.reloadData()
            self?.specialCollectionView.reloadData()
                
            case .failure(let error):
                print("Something went wrong")
                ProgressHUD.showError(error.localizedDescription)
            
        } }
    }
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionview.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialCollectionView
            .register(UINib(nibName: DishLandScapeCollectionViewCell.identifier, bundle: nil),  forCellWithReuseIdentifier:
                    DishLandScapeCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView:
            return categories.count
        case popularCollectionview:
            return populars.count
        case specialCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
                cell.setup(category: categories[indexPath.row])
                return cell
        case popularCollectionview:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
                cell.setup(dish: populars[indexPath.row])
                return cell
        case specialCollectionView:
            let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: DishLandScapeCollectionViewCell.identifier, for: indexPath) as! DishLandScapeCollectionViewCell
                    cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionview ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
