//
//  Badge.swift
//  AllstateUIKit
//
//  Created by Kumar, Manoj (Accenture) on 19/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit
import QuartzCore

let badgeViewWidth: CGFloat = 24
let maxCount: Int = 9
public enum BadgePosition {
    case topRight
    case center
}

class BadgeView: UIView {
    func setBackgroundColor(_ backgroundColor: UIColor?) {
        super.backgroundColor = backgroundColor
    }
}

public class Badge {
    var count: Int = 0 {
        didSet {
            countLabel?.text = "\(count)"
            checkZero()
        }
    }

    private var countLabel: UILabel? {
        didSet {
            countLabel?.text = "\(count)"
            checkZero()
        }
    }
    private var badgeView: BadgeView!

    // MARK: - SETUP
    public init(view: UIView, position: BadgePosition) {
        setView(view, position: position)
    }

    public func setView(_ view: UIView, position: BadgePosition) {
        badgeView = BadgeView()
        badgeView?.isUserInteractionEnabled = false
        badgeView.backgroundColor = UIColor.secondaryRed

        countLabel = UILabel(frame: badgeView.frame)
        countLabel?.isUserInteractionEnabled = false
        countLabel?.textAlignment = .center
        countLabel?.textColor = UIColor.white
        countLabel?.backgroundColor = UIColor.clear
        countLabel?.font = ASTheme.font.subheadSemibold11

        let newFrame = getBadgePostionFrame(view, position: position)
        badgeView.frame = newFrame
        countLabel?.frame = badgeView.frame
        badgeView.layer.cornerRadius = newFrame.size.height / 2

        view.superview?.addSubview(badgeView)
        view.superview?.addSubview(countLabel!)
        view.superview?.bringSubviewToFront(badgeView)
        view.superview?.bringSubviewToFront(countLabel!)
        checkZero()
    }

    private func getBadgePostionFrame(_ view: UIView, position: BadgePosition) -> CGRect {
        let frame: CGRect = view.frame
        let badgeWidth: CGFloat = badgeViewWidth
        let badgeHeight: CGFloat = badgeViewWidth

        switch position {
        case .topRight:
            let xPostion: CGFloat = frame.origin.x + frame.size.width - (badgeViewWidth/2)
            let yPostion: CGFloat = frame.origin.y - (badgeViewWidth/2)
            return CGRect(x: xPostion, y: yPostion, width: badgeWidth,
              height: badgeHeight)
        case .center:
            let xPostion: CGFloat = frame.origin.x + (frame.size.width/2) - (badgeViewWidth/2)
            let yPostion: CGFloat = frame.origin.y + (frame.size.height/2) - (badgeViewWidth/2)
            return CGRect(x: xPostion, y: yPostion, width: badgeWidth,
              height: badgeHeight)
          }
    }

    // Change the color of the notification circle
    public func setCircleColor(_ circleColor: UIColor?, label labelColor: UIColor?) {
        badgeView.backgroundColor = circleColor
        if let labelColor = labelColor {
            countLabel?.textColor = labelColor
        }
    }

    public func setCircleBorderColor(_ color: UIColor?, borderWidth width: CGFloat) {
        badgeView.layer.borderColor = color?.cgColor
        badgeView.layer.borderWidth = width
    }

    // Set the count yourself
    public func updateBadgeCount(_ newCount: Int) {
        count = newCount
        var labelText = "\(NSNumber(value: count))"
        if count > maxCount {
            labelText = "\(NSNumber(value: maxCount))+"
        }
        countLabel?.text = labelText
        checkZero()
    }

    // Set the font of the label
    public func setCountLabel(_ font: UIFont?) {
        countLabel?.font = font
    }

    public func countLabelFont() -> UIFont? {
        return countLabel?.font
    }

    private func checkZero() {
        if count <= 0 {
            badgeView.isHidden = true
            countLabel?.isHidden = true
        } else {
            badgeView.isHidden = false
            countLabel?.isHidden = false
        }
    }
}
