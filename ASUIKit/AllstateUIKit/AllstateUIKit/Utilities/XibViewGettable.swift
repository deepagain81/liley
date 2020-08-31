//
//  XibViewGettable.swift
//  ASUIKit

import Foundation

public protocol XibViewGettable where Self: UIView {}

extension XibViewGettable {

    private static func getViewFromXib<T: UIView>() -> T {
        let xibName = String(describing: T.self)
        if let view = Bundle(for: self).loadNibNamed(xibName, owner: self, options: nil)?.first as? T {
            return view
        }
        fatalError("Cannot find Xib")
    }

    private static func intiWithSubviews() -> UINib {
        let xibName = String(describing: self)

        if let resourcePath = Bundle(for: self).path(
            forResource: "AllstateUIKit",
            ofType: "bundle") {
            return UINib(nibName: xibName, bundle: Bundle(path: resourcePath))
        }
        fatalError("Cannot find Xib")
    }

    public static func getView() -> Self {
        return getViewFromXib()
    }

    static func getNib() -> UINib {
        return intiWithSubviews()
    }
}
