//
//  RatingTableViewCell.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 4/11/22.
//

import UIKit

class RatingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var Iconimage1: UIImageView!
    @IBOutlet weak var Iconimage2: UIImageView!
    @IBOutlet weak var Iconimage3: UIImageView!
    @IBOutlet weak var Iconimage4: UIImageView!
    @IBOutlet weak var Iconimage5: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func prepare(with data: (Icon, Icon.Rating) ) {
        let (icon, rating) = data
        
        iconImageView.image = icon.image
        titleLabel.text = icon.name
        showRating(rating)
        
    }
    
    func showRating(_ rating: Icon.Rating) {
        let ratingValue = rating.rawValue
        
        Iconimage1.isHidden = ratingValue < 5
        Iconimage2.isHidden = ratingValue < 4
        Iconimage3.isHidden = ratingValue < 3
        Iconimage4.isHidden = ratingValue < 2
        Iconimage5.isHidden = ratingValue < 1
    }
    
}
