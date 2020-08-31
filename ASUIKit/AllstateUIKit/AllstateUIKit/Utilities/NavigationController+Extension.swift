//
//  NavigationHeader.swift
//  AllstateUIKit
//

import UIKit

// MARK: Default Navigation bar Setup
extension UINavigationController {
    /// Setting Custom Navigation bar
     public func setNavigationBarAttributes() {
        self.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.primaryDeepBlue!,
             NSAttributedString.Key.font: ASTheme.font.fixedLargeTitleDisplayRegular] // fixed size font
        self.navigationBar.tintColor = UIColor.primaryDeepBlue
        self.navigationBar.backgroundColor = .white
        self.navigationBar.barTintColor = UIColor.whiteColor
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.primaryDeepBlue!]
        self.navigationBar.shadowImage = UIImage()
    }
}
