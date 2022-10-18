//
//  FavoritesIconCell.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 16/10/22.
//

import UIKit

class FavoritesIconCell: UICollectionViewCell {
    @IBOutlet private weak var holderView
    : UIView!
    
    @IBOutlet private weak var imageLabel: UILabel!
    @IBOutlet private weak var ratingCollectionView: UICollectionView!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    private var iconRating: Icon.Rating = .veryBad
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        holderView.clipsToBounds = true
        holderView.layer.cornerRadius = 30
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor(hexString: "#3697DD", alpha: 1.0).cgColor
        
        ratingCollectionView.register(
            UINib(nibName: "IconCell", bundle: .main),
            forCellWithReuseIdentifier: "IconCell"
        )
        ratingCollectionView.dataSource = self
        ratingCollectionView.delegate = self
        
        
        // Initialization code
    }

}

extension FavoritesIconCell: UICollectionViewDelegate {
    
}

extension FavoritesIconCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        iconRating.rawValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dequeuedCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "IconCell",
            for: indexPath
        ) as? IconCell

        guard let cell = dequeuedCell else {
            return UICollectionViewCell()
        }

        cell.prepare(with: UIImage(named: "party"))
        return cell
    }
    
    
}
