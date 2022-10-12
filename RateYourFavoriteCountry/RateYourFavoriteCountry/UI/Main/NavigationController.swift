//
//  NavigationController.swift
//  RateYourFavoriteCountry
//
//  Created by Md. Asiuzzaman on 12/10/22.
//

import UIKit

final class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
}

private extension NavigationController {
    func setupAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = UIColor.green // not exactly green have to check it.
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        
    }
}
