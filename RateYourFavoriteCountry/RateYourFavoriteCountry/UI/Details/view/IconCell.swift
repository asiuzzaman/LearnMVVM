//
//  IconCell.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 25/10/22.
//

import UIKit

class IconCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    func prepare(with iconImage: UIImage?) {
        imageView.image = iconImage
    }

}
