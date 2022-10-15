//
//  IconManager.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 15/10/22.
//

import UIKit

final class IconManager {
    static let shared : IconManagement = IconManager()
    
    private var iconCollection: [Icon]
    private var ratingCollection: [Icon: Icon.Rating]
    
    private init() {
        let icons = Icon.IconType.allCases.map { Icon(ofType: $0) }
        iconCollection = icons

        ratingCollection = icons.reduce(into: [Icon: Icon.Rating]()) { partialResult, icon in
            partialResult[icon] = .ok
        }
    }
    
}

extension IconManager: IconManagement {
    var totalIcons: Int {
        return iconCollection.count
    }
    
    var allIcons: [Icon] {
        iconCollection
    }
    
    func topFavoriteIcons(first count: Int) -> [Icon] {
        
        let shortedData = iconCollection.sorted { icon1, icon2
            in
            let firstRating = ratingCollection[icon1]?.rawValue ?? 0
            let secondRating = ratingCollection[icon2]?.rawValue ?? 0
            return firstRating > secondRating
        }
        
        if shortedData.count > count {
            return Array(shortedData[..<count])
        } else {
            return shortedData
        }
    }
    
    func vote(icon: Icon, rating: Icon.Rating) {
        ratingCollection[icon] = rating
    }
    
    func rating(icon: Icon) -> Icon.Rating {
        return ratingCollection[icon] ?? .veryBad
    }
    
    
}
