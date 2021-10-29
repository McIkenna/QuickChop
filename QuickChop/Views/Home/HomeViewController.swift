//
//  HomeViewController.swift
//  QuickChop
//
//  Created by New Account on 10/12/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
  //  @IBOutlet weak var specialCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionview : UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    var categories : [DishCategory] = [
            .init(id:"id1", name: "African Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "American Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "Asian Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "Indian Dish", image: "https://picsum.photos/100/200"),
            .init(id:"id1", name: "European Dish", image: "https://picsum.photos/100/200")
    ]
    
    var populars : [Dish] = [
        .init(id:"id1", name: "Egusi Soup", description: "am is the best meal you can ever think of For is the best meal you can ever think of For is the best meal you can ever think of",
            image: "https://picsum.photos/100/200", calories : 38.90),
        .init(id:"id1", name: "Pounded Yam", description: "For is the best meal you can ever think of,For is the best meal you can ever think of For is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 27.90),
        .init(id:"id1", name: "Jollof Rice", description: "Can is the best meal you can ever think For is the best meal you can ever think of For is the best meal you can ever think of of", image: "https://picsum.photos/100/200", calories : 12.94),
        
        .init(id:"id1", name: "Ogbono Soup", description: "For is the best meal you can ever think of For is the best meal you can ever think ofBut is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 108.92),
        .init(id:"id1", name: "Fried Rice", description: "For is the best meal you can ever think of Not is the best meal you can ever think of For is the best meal you can ever think of", image: "https://picsum.photos/100/200", calories : 3.48)
    ]
    
    var specials: [Dish] = [
        .init(id:"id1", name: "Cooked Beet", description: "The new addition to our menu", image: "https://picsum.photos/100/200", calories : 323.8),
        .init(id:"id1", name: "Teriyaki Chicken", description: "spiced with hot chili", image: "https://picsum.photos/100/200", calories : 124.58),
        .init(id:"id1", name: "Adobe Chicken", description: "Another one you would love", image: "https://picsum.photos/100/200", calories : 3.48)
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkService.shared.myFirstRequest{(result) in
            switch result{
            case .success(let data):
                for dish in data{
                    print(dish.name ?? "")
                }
            case .failure(let error):
                print("The error is: \(error.localizedDescription)")
            }
        }
        
//        let service = NetworkService()
//     let request = service.createRequest(route: .temp, method: .get, parameters: ["firstName" : "Ikenna", "lastName" : "Ifekaonwu"])
//        print("The URL is: \(request?.url)")
//        print("The body: \(request?.httpBody)")
       specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        registerCells()
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
