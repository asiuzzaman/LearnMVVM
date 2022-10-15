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
        <#code#>
    }
    
    var allIcons: [Icon] {
        <#code#>
    }
    
    func topFavoriteIcons(first count: Int) -> [Icon] {
        <#code#>
    }
    
    func vote(icon: Icon, rating: Icon.Rating) {
        <#code#>
    }
    
    func rating(icon: Icon) -> Icon.Rating {
        <#code#>
    }
    
    
}
