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
}
