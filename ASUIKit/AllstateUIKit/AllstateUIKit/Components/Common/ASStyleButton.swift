//  ASStyleButton.swift
//  AllstateUIKit

import UIKit
//Defines the structure of Card's top section
@IBDesignable public class ASStyleButton: UIButton {
    var type: ButtonStyle = .primary
    //Default methods to initialize
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    override public func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        sharedInit()
    }
    //Updates the color change while the button is pressed
    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.setASButtonBackgroundColor(state: .highlighted)
            } else if self.isEnabled {
                self.setASButtonBackgroundColor(state: .normal)
            } else {
                self.setASButtonBackgroundColor(state: .disabled)
            }
        }
    }
    //Updates the color change on button is enabled or normal
    override open var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.setASButtonBackgroundColor(state: .normal)
                self.setASTextColor(state: .normal)
            } else {
                self.setASButtonBackgroundColor(state: .disabled)
                self.setASTextColor(state: .disabled)
            }
        }
    }
    //Set all the properties which are common for all the ASButton types
    func sharedInit() {
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
        self.imageView?.layer.cornerRadius = 5.0
        self.titleLabel?.font = ASTheme.font.caption2Heavy
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
    }
    //Set the ASButton style and set its property
    public func setASButtonType(type: ButtonStyle) {
        self.type = type
        self.setASButtonProperty()
    }
    func setASButtonProperty() {
        self.setASButtonBackgroundColor(state: .normal)
        self.setASTextColor(state: .normal)
    }
    //Constant value for padding the text
    @IBInspectable public var padding: CGFloat = 0.0
    // To support Accessability for Large, Small and all types of sizes
    // According to intrinsicContentSize the button text will be increased
    // or decreased in the device
    override public var intrinsicContentSize: CGSize {
        let titlesize = self.calculateTitleLabelSize()
        return CGSize(width: self.frame.width, height: titlesize.height + padding +  20.0)
    }
    //To calculate label height
    func calculateTitleLabelSize() -> CGSize {
        var titleHeight: CGFloat = 0
        var titleWidth: CGFloat = 0
        if let titleText = titleLabel?.text {
          titleLabel?.text = titleText
          titleLabel?.numberOfLines = 0
          let maximumLabelSize: CGSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
          let expectedLabelSize: CGSize = (titleLabel?.sizeThatFits(maximumLabelSize))!
          titleHeight = expectedLabelSize.height
          titleWidth = expectedLabelSize.width
    }
          let calucatedSize = CGSize(width: titleWidth, height: titleHeight)
          return calucatedSize
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            self.titleLabel?.font = ASTheme.font.caption2Heavy
            self.invalidateIntrinsicContentSize()
            self.superview?.setNeedsLayout()
            self.superview?.layoutIfNeeded()
        }
    }
}
