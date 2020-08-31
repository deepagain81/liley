//
//  CardsPriorityExtensions.swift
//  AllstateUIKit

import Foundation
import UIKit

var associateObjectValue: Int = 0

private enum ShadowConstant {
    static let shadowOpacityValue: Float = 0.6
    static let shadowRadiusValue: CGFloat = 3.0
    static let shadowOffsetWidth: CGFloat = 0.0
    static let shadowOffsetHeight: CGFloat = 5.0
}

extension UIView {

    // MARK: - Code based on Animation
    fileprivate var isAnimated: Bool {
        get {
            return objc_getAssociatedObject(self, &associateObjectValue) as? Bool ?? false
        }
        set {
return objc_setAssociatedObject(self, &associateObjectValue, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    // MARK: - Customizing Shimmer animation in storyboard
    @IBInspectable var shimmerAnimation: Bool {
        get {
            return isAnimated
        }
        set {
            self.isAnimated = newValue
        }
    }

    func getAllSubViewsRecursively() -> [UIView] {
        return subviews + subviews.flatMap { $0.getAllSubViewsRecursively() }
    }

    // MARK: - To start Animation
    func startAnimation() {
        for animateView in getSubViewsForAnimation() {
            animateView.clipsToBounds = false
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor.grey1!, UIColor.grey3!.withAlphaComponent(0.8).cgColor, UIColor.grey1!]
            gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.9)
            gradientLayer.frame = animateView.bounds
            animateView.layer.mask = gradientLayer
            let animation = CABasicAnimation(keyPath: "transform.translation.x")
            //            animation.duration = 1.5
            animation.duration = 3
            animation.fromValue = -animateView.frame.size.width
            animation.toValue = animateView.frame.size.width
            animation.repeatCount = .infinity
            gradientLayer.add(animation, forKey: "")
        }
    }
    // MARK: - To stop Animation
    func stopAnimation(completion: (Any) -> Void) {
        for animateView in getSubViewsForAnimation() {
            animateView.layer.removeAllAnimations()
            animateView.layer.mask = nil
        }
            completion(self)
        }
    // MARK: - get Subview for animation
    func getSubViewsForAnimation() -> [UIView] {
        var obj: [UIView] = []
        for objView in getAllSubViewsRecursively() {
            obj.append(objView)
        }
        return obj.filter({ (obj) -> Bool in
            obj.shimmerAnimation
        })
    }

    // MARK: - Adding Gradient Color
    func addGradient(color1: UIColor, color2: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width + 40, height: self.frame.height) //self.bounds
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.colors = [color1.cgColor, color2.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
        // MARK: To set dropshadow to view
        func addShadow() {
            self.layer.masksToBounds = false
            self.layer.shadowRadius = ShadowConstant.shadowRadiusValue
            self.layer.shadowOpacity = ShadowConstant.shadowOpacityValue
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOffset = CGSize(width: ShadowConstant.shadowOffsetWidth,
                                             height: ShadowConstant.shadowOffsetHeight )
        }

    }
