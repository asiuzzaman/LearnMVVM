//
//  FavoritesViewControllers.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 13/10/22.
//

import UIKit

final class FavoritesViewControllers: UIViewController {
    static func makeViewController() -> FavoritesViewControllers? {
        let viewController = UIStoryboard(name: "Favorites", bundle: .main)
            .instantiateViewController(withIdentifier: "FavoritesViewControllers")
        guard let favoritesViewController = viewController as? FavoritesViewControllers else {
            return nil
        }
        // need to initiate viewmodel
        return favoritesViewController
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareCollectionView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parent?.navigationItem.title = "Favorites"
    }
}


private extension FavoritesViewControllers {
    func prepareView(){
        view.backgroundColor = UIColor(hexString: "#EFEFF4", alpha: 1.0)
    }
    func prepareCollectionView() {
        
    }
}
