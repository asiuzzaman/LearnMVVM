//
//  DetailsViewModel.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 26/10/22.
//

import UIKit

protocol DetailsViewModelDelegate: AnyObject {
    var allowRating: Bool { get }
    var title: String { get }
    var ratingValue: Float { get }
    func setRatingValue(to value: Int)

    var iconImage: UIImage? { get }
    var ratingLabel: String { get }

    var isSavable: Bool { get }
    func saveRating()
}

final class DetailsViewModel {
    let allowRating: Bool

    private let iconManager: IconManagement
    private let icon: Icon
    private var rating: Icon.Rating
    private var initalRating: Icon.Rating

    init(iconManager: IconManagement = IconManager.shared, icon: Icon, allowRating: Bool = true) {
        self.iconManager = iconManager
        self.icon = icon
        rating = iconManager.rating(icon: icon)
        initalRating = iconManager.rating(icon: icon)
        self.allowRating = allowRating
    }
}

extension DetailsViewModel: DetailsViewModelDelegate {
    var ratingValue: Float {
        Float(rating.rawValue)
    }
    
    func setRatingValue(to value: Int) {
        rating = Icon.Rating(rawValue: value) ?? .veryBad
    }
    
    var iconImage: UIImage? {
        icon.image
    }
    
    var ratingLabel: String {
        ["Rating: ",rating.label].joined(separator: " ")
    }
    
    var isSavable: Bool {
        initalRating != rating
    }
    
    func saveRating() {
        iconManager.vote(icon: icon, rating: rating)
    }
    
    var title: String {
        return icon.name
    }
}
