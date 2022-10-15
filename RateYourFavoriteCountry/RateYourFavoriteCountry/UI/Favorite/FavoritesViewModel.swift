//
//  FavoritesViewModel.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 15/10/22.
//

import UIKit

protocol FavoritesViewModelDelegate: AnyObject {
    var numberOfSection: Int { get }
    func numberOfItem(`in` section: Int) -> Int

    func sectionInset(for section: Int) -> UIEdgeInsets
    var spaceBetweenItems: CGFloat { get }
    func sizeForCell(availableWidth width: CGFloat) -> CGSize

    //func dataForCell(at indexPath: IndexPath) -> (Icon, Icon.Rating)?

    func reloadIconData()
}


final class FavoritesViewModel {
//    private let iconManager: IconManagement
//    private var presentableIcons: [Icon]
//
//    init(iconManager: IconManagement = IconManager.shared) {
//        self.iconManager = iconManager
//        presentableIcons = iconManager.topFavoriteIcons(first: 10)
//    }
}

extension FavoritesViewModel: FavoritesViewModelDelegate {
    func numberOfItem(in section: Int) -> Int {
        <#code#>
    }
    
    func sectionInset(for section: Int) -> UIEdgeInsets {
        <#code#>
    }
    
    var spaceBetweenItems: CGFloat {
        <#code#>
    }
    
    func sizeForCell(availableWidth width: CGFloat) -> CGSize {
        <#code#>
    }
    
    func reloadIconData() {
        <#code#>
    }
    
    var numberOfSection: Int { 1 }
}

