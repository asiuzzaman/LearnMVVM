//
//  RatingViewControllers.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 13/10/22.
//

import UIKit

final class RatingViewControllers: UIViewController {
    private var viewModel: RatingViewModelDelegate!
    
    static func makeViewController() -> RatingViewControllers? {
        let viewController = UIStoryboard(name: "Ratings", bundle: .main)
            .instantiateViewController(withIdentifier: "RatingsViewController")
        guard let ratingsViewController = viewController as? RatingViewControllers else {
            return nil
        }
        
        // need to initiate view model
        ratingsViewController.viewModel = RatingViewModel()
        
        return ratingsViewController
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

