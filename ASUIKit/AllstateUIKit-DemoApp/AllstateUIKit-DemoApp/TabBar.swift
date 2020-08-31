//
//  ASTabBar.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

private enum TabBarConstants {
    static let tabBarIndicatorHeight: CGFloat = 3.0
    static let cornerRadius: CGFloat = 15.0
    static let verticalOffset: CGFloat = -13.0
    static let horizontalOffset: CGFloat = 0.0
    static let lineHeightOffset: CGFloat = 12.0
    static let lineWidthOffset: CGFloat = 10.0
    static let lineIntialPostion: CGFloat = 4.0
    static let paddingHeight: CGFloat = 6.0
}

let semiboldFont = UIFont(name: "SFProText-Semibold", size: 13)

class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = self.tabBar
        tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: UIColor.primaryBlue,
        size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count),
                     height: tabBar.frame.height))
        tabBarAppearanceInit()
    }
}
extension UITabBarController {
    public func tabBarAppearanceInit() {
         UITabBar.appearance().barTintColor = ASTheme.color.background
        let attrsNormal = [NSAttributedString.Key.foregroundColor: UIColor.primaryDeepBlue,
                           NSAttributedString.Key.font: semiboldFont]
        UITabBarItem.appearance().setTitleTextAttributes(attrsNormal as [NSAttributedString.Key: Any],
                                                          for: UIControl.State.normal)
         let attrsSelected = [NSAttributedString.Key.foregroundColor: UIColor.primaryBlue,
                              NSAttributedString.Key.font: semiboldFont]
        UITabBarItem.appearance().setTitleTextAttributes(attrsSelected as [NSAttributedString.Key: Any],
                                                          for: UIControl.State.selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: TabBarConstants.horizontalOffset,
                                                                     vertical: TabBarConstants.verticalOffset)
    }
}

extension UIImage {

    //creating selectionIndicator
    public func createSelectionIndicator(color: UIColor?, size: CGSize) -> UIImage {
        let lineHeight = TabBarConstants.tabBarIndicatorHeight
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color?.setFill()

        let height = calculateHeight(lineHeight: lineHeight)
        let path = UIBezierPath(roundedRect: CGRect(origin:
        CGPoint(x: TabBarConstants.lineIntialPostion, y: size.height - height),
        size: CGSize(width: size.width - TabBarConstants.lineWidthOffset, height: lineHeight)),
        cornerRadius: TabBarConstants.cornerRadius)
        path.stroke()
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    //calculates height between title and bottom safe area
    fileprivate func calculateHeight(lineHeight: CGFloat) -> CGFloat {
        let window = UIApplication.shared.keyWindow
        if  window!.safeAreaInsets.bottom  != 0 {
            return lineHeight + TabBarConstants.lineHeightOffset
        }
        return TabBarConstants.paddingHeight
    }
}
