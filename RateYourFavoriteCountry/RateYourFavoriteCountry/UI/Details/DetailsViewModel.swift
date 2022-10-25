//
//  DetailsViewModel.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 26/10/22.
//

import UIKit


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
