//
//  UIView+Extension.swift
//  CardsPromo

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
extension UIView {
    // MARK: To set gradient background
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        let topColor = UIColor.gradientBlueTop
        let bottomColor = UIColor.gradientBlueBottom
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    // MARK: To set dropshadow to view
    public func setDropShadow() {
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.shadowRadius = ShadowConstant.shadowRadiusValue
        self.layer.shadowOpacity = ShadowConstant.shadowOpacityValue
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: ShadowConstant.shadowOffsetWidth,
                                         height: ShadowConstant.shadowOffsetHeight )
        self.layer.zPosition = .greatestFiniteMagnitude
    }

    // MARK: To set dropshadow to view with path
    func dropShadow(top: Bool, left: Bool, bottom: Bool, right: Bool,
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

    // MARK: To remove the bottom shadow from the view
    public func removeBottomShadow() {
        self.layer.shadowRadius = ShadowConstant.shadowValueNil
        self.layer.shadowOpacity = Float(ShadowConstant.shadowValueNil)
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowOffset = CGSize(width: ShadowConstant.shadowValueNil, height: ShadowConstant.shadowValueNil)
    }

    // MARK: To Add Loading Indicator on view
    public func startAnimatingLoadingIndicator(loaderMessage: String = LoadingIndicatorView.loaderDefaultMessage) {
        // Checking whether LoadingIndicatorView is already added as a subview on view or not
        let loadingIndicatorViews = self.subviews.filter { $0 is LoadingIndicatorView }
        // If loadingINdicatorView is not already added as a subview then we are adding LoadingIndicatorView as subview
        if loadingIndicatorViews.count == 0 {
            let loadingIndicatorView = LoadingIndicatorView(frame: self.bounds)
            loadingIndicatorView.loaderMessage = loaderMessage
            self.addSubview(loadingIndicatorView)
        }
    }

    // MARK: To Remove Loading Indicator from view
    public func stopAnimatingLoadingIndicator() {
        // Checking whether LoadingIndicatorView is already added as a subview on view or not
        let loadingIndicator = self.subviews.filter { $0 is LoadingIndicatorView }
        // If LoadingIndicatorView is added on view as subview then we are removing it from view
        if loadingIndicator.count > 0 {
            loadingIndicator[0].removeFromSuperview()
        }
    }
}
