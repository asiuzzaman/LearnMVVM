//
//  TabBarController.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 12/10/22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        //setupViewControllers()
    }
}

private extension TabBarController {
    
    
    func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.green // make green

        setTabBarItemAppearance(for: appearance.compactInlineLayoutAppearance)
        setTabBarItemAppearance(for: appearance.stackedLayoutAppearance)
        setTabBarItemAppearance(for: appearance.inlineLayoutAppearance)
        tabBar.standardAppearance = appearance
    }

    func setTabBarItemAppearance(for appearance: UITabBarItemAppearance) {
        appearance.normal.iconColor = .lightGray
        appearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]

        appearance.selected.iconColor = .white
        appearance.selected.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold),
            .foregroundColor: UIColor.green // make green
        ]
    }
}
