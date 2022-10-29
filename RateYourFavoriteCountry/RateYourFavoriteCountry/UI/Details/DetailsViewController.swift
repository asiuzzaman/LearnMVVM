//
//  DetailsViewController.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 26/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    private var viewModel: DetailsViewModelDelegate!
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var iconCollectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static func makeViewController(icon: Icon, allowRating: Bool) -> DetailsViewController? {
        let viewController = UIStoryboard(name: "Details", bundle: .main)
            .instantiateViewController(withIdentifier: "DetailsViewController")

        guard let detailsViewController = viewController as? DetailsViewController else {
            return nil
        }

        detailsViewController.viewModel = DetailsViewModel(icon: icon, allowRating: allowRating)
        return detailsViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        iconCollectionView.reloadData()
    }

}
