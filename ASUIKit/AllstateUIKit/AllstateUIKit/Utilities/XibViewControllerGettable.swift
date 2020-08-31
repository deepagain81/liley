//
//  XibViewControllerGettable.swift
//  AllstateUIKit

import Foundation
import UIKit

public protocol XibViewControllerGettable where Self: UIViewController {}
/// To load an xib of a view controller
extension XibViewControllerGettable {

    private static func getViewFromXib<T: UIViewController>() -> T {
        let xibName = String(describing: T.self)
        let viewController = T.init(nibName: xibName, bundle: Bundle(for: T.self))
        return viewController
    }
    /// Method to be accessed to load xib from different modules
    public static func getVC() -> Self {
        return getViewFromXib()
    }
}
