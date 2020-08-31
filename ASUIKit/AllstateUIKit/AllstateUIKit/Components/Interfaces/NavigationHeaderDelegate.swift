//
//  NavigationHeaderInterface.swift
//  ASUIKit
//

import Foundation
import UIKit

//This defines the functions provided by the navigation haeder view
//These are the functions which the framework's consumer would get to work on the  Navigation Bar
//As well a way to set observer for the action callbacks on the NavigationBarView
public protocol NavigationHeaderView where Self: UIView {
    func calculateScrollHeightConstraints(navigationController: UINavigationController) -> CGFloat
    func calculateInitialViewConstraints(navigationController: UINavigationController) -> CGFloat
    func setTileDelegate(as delegate: TileDelegate)
    func scrollViewWillBeginDragging(upwards: Bool)
    func setNavigationBarDelegate(as delegate: NavigationBarDelegate)
    func setSelectedIndex(_ currentIndex: Int)
}

//This protocol represents the actions or callbacks from the Navigation Bar View to the consumer.
public protocol NavigationBarDelegate: AnyObject {
    func didSelectSegmentControl(index: Int)
}
