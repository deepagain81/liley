//
//  XibGettable.swift
//  LileyStoreIOS
//
//  Created by Chapagain, Deepak (INFOSYS) on 8/9/20.
//  Copyright © 2020 Chapagain, Deepak. All rights reserved.
//
import Foundation
import UIKit

public protocol XibGettable where Self: UIViewController {}
/// To load an xib of a view controller
extension XibGettable {

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
