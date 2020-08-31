//
//  NavigationHederBaseView.swift
//  ASUIKit
//
//

import Foundation
// MARK: Scroll functionality variables
//Height constants  and variable for scrolling functionality
//Utilized by overview header, feature summar and quick access navigation headers
public enum HeightConstants {
    static let zero: CGFloat = 0
    static var initialNavBarHeight: CGFloat = zero
    static var finalNavBarHeight: CGFloat = 44
    static var differenceNavBarHeight: CGFloat = zero
    static var largeStackViewHeight: CGFloat = zero
    static var smallStackViewHeight: CGFloat = zero
    static var differenceStackViewHeight: CGFloat = zero
    static var offsetNavBar: CGFloat = zero
    static var lastContentOffset: CGFloat = zero
    static var navOffset: CGFloat = zero
    static let tileSwitchAlpha: CGFloat = 0.9
    static let tilePaddingHeight: CGFloat = 10.0
}
///Base class for Navigation Bar Components
public class NavigationHeaderBaseView: ASThemeableView, XibViewGettable, NavigationHeaderView {
    ///Returns CGFloat value for setting the initial height constraint
    public func calculateInitialViewConstraints(navigationController: UINavigationController) -> CGFloat {
    let constraintHeight: CGFloat = 0
    return constraintHeight
    }
    ///Returns CGFloat value for Scroll Height constraints
    public func calculateScrollHeightConstraints(navigationController: UINavigationController) -> CGFloat {
        let constraintHeight: CGFloat = 0
        return constraintHeight
    }
    ///Calculate the height difference between default state of the navigation bar and expanded state
    ///i.e, when large titles option is enabled for navigation header
    public func calculateNavBarDifference(navigationController: UINavigationController) {
        HeightConstants.initialNavBarHeight = navigationController.navigationBar.frame.height
        HeightConstants.differenceNavBarHeight = HeightConstants.initialNavBarHeight - HeightConstants.finalNavBarHeight
    }
    ///To set tile events 
    public func setTileDelegate(as delegate: TileDelegate) {}

    ///The top stack represents the UI elements present in collapsed state and the bottom stack represents
    ///the UI elements in expanded state. The difference is initially calculated for interpolation
    public func calculateStackViewHeightDifference(from topstack: UIStackView,
                                                   to bottomStack: UIStackView,
                                                   heightConstraint bottomConstraintHeight: CGFloat = 0) {

        var height: CGFloat = HeightConstants.zero
            if topstack.isHidden == false {
            height += topstack.frame.height
        }
        HeightConstants.smallStackViewHeight = height
        height = HeightConstants.zero
            if bottomStack.isHidden == false {
             height = bottomStack.frame.height > bottomConstraintHeight ?
                                   bottomStack.frame.height : (bottomConstraintHeight)
        }
        topstack.alpha = HeightConstants.zero
        HeightConstants.largeStackViewHeight = height
        HeightConstants.differenceStackViewHeight = HeightConstants.largeStackViewHeight -
            HeightConstants.smallStackViewHeight
    }
    public func scrollViewWillBeginDragging(upwards: Bool) {}
    public func setNavigationBarDelegate(as delegate: NavigationBarDelegate) {}
    public func setSelectedIndex(_ currentIndex: Int) { }
}
