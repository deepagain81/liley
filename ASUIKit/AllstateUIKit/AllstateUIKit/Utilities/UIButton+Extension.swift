//
//  UIButton+Extension.swift
//  Tiles

import Foundation
import UIKit

private struct ShadowConstant {
    static let shadowOpacityValue: Float = 1.0
    static let shadowRadiusValue: CGFloat = 6.0
    static let shadowOffsetWidth: CGFloat = 0.0
    static let shadowOffsetHeight: CGFloat = 4.0
    static let shadowValueNil: CGFloat = 0.0
    static let shadowPathValue: CGFloat = 1

}

extension UIButton {
    // MARK: To set dropshadow to view with path
    func setTileShadow(top: Bool,
                       left: Bool,
                       bottom: Bool,
                       right: Bool,
                       shadowRadius: CGFloat = ShadowConstant.shadowRadiusValue) {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: ShadowConstant.shadowOffsetWidth,
                                         height: ShadowConstant.shadowOffsetHeight)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOpacity = ShadowConstant.shadowOpacityValue
        let path = UIBezierPath()
        var xOrigin: CGFloat = ShadowConstant.shadowValueNil
        var yOrigin: CGFloat = ShadowConstant.shadowValueNil
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if !top {
            yOrigin+=(shadowRadius+ShadowConstant.shadowPathValue)
        }
        if !bottom {
            viewHeight-=(shadowRadius+ShadowConstant.shadowPathValue)
        }
        if !left {
            xOrigin+=(shadowRadius+ShadowConstant.shadowPathValue)
        }
        if !right {
            viewWidth-=(shadowRadius+ShadowConstant.shadowPathValue)
        }
        // selecting top most point
        path.move(to: CGPoint(x: xOrigin, y: yOrigin))
        // Move to the Bottom Left Corner, this will cover left edges
        path.addLine(to: CGPoint(x: xOrigin, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        path.addLine(to: CGPoint(x: viewWidth, y: yOrigin))
        // Move back to the initial point, this will cover the top edge
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}
