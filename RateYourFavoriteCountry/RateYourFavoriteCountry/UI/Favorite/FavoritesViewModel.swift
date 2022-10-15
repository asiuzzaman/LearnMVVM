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

    func dataForCell(at indexPath: IndexPath) -> (Icon, Icon.Rating)?

    func reloadIconData()
}


final class FavoritesViewModel {
    private let iconManager: IconManagement
    private var presentableIcons: [Icon]

    init(iconManager: IconManagement = IconManager.shared) {
        self.iconManager = iconManager
        presentableIcons = iconManager.topFavoriteIcons(first: 10)
    }
}

extension FavoritesViewModel: FavoritesViewModelDelegate {
    
    func dataForCell(at indexPath: IndexPath) -> (Icon, Icon.Rating)? {
        let index = indexPath.item
        
        guard index < presentableIcons.count else {
            return nil
        }
        let icon = presentableIcons[index]
        return (icon, iconManager.rating(icon: icon))
    }
    
    
    func numberOfItem(in section: Int) -> Int {
        presentableIcons.count
    }
    
    func sectionInset(for section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    var spaceBetweenItems: CGFloat { 10 }
    
    func sizeForCell(availableWidth width: CGFloat) -> CGSize {
        let collectionViewWidth: Double = width
        let availableWidthForCell = collectionViewWidth - 10.0 - 2 * 10.0
        let dimension = floor(availableWidthForCell / 2.0)
        return CGSize(width: dimension, height: 140)
    }
    
    func reloadIconData() {
        presentableIcons = iconManager.topFavoriteIcons(first: 10)
    }
    
    var numberOfSection: Int { 1 }
}

