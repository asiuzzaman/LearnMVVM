//
//  RatingViewModel.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 30/10/22.
//

import UIKit

protocol RatingViewModelDelegate: AnyObject {
    var numberOfSection: Int { get }
    func numberOfItems(`in` section: Int) -> Int
    func heightForItem(at indexPath: IndexPath) -> CGFloat
    func cellDataForItem(at indexPath: IndexPath) -> (Icon, Icon.Rating)?
    func reloadIconData()
}

final class RatingViewModel {
    private let iconManager: IconManagement
    private var availableIcons: [Icon]

    init(iconManager: IconManagement = IconManager.shared) {
        self.iconManager = iconManager
        availableIcons = iconManager.allIcons.sorted(by: { firstIcon, secondIcon in
            firstIcon.name.caseInsensitiveCompare(secondIcon.name) == .orderedAscending
        })
    }
}

extension RatingViewModel: RatingViewModelDelegate {
    var numberOfSection: Int {
        1
    }
    
    func numberOfItems(in section: Int) -> Int {
        availableIcons.count
    }
    
    func heightForItem(at indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func cellDataForItem(at indexPath: IndexPath) -> (Icon, Icon.Rating)? {
        let index = indexPath.row

        guard index < availableIcons.count else {
            return nil
        }

        let icon = availableIcons[index]
        return (icon, iconManager.rating(icon: icon))
    }
    
    func reloadIconData() {
        self.availableIcons = iconManager.allIcons.sorted(by: { firstIcon, secondIcon in
            firstIcon.name.caseInsensitiveCompare(secondIcon.name) == .orderedAscending
        })
    }
                                                     
                                                     
}
