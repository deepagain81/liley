//
//  ASCTAButton.swift
//  ASUIKit

import UIKit

@IBDesignable
public class ASButton: UIButton {

    var buttonStyle: ButtonStyle?

    // MARK: - ------- To set Inspectable elements to customize in storyboard-------
    //Constant value for padding the text
    @IBInspectable public var padding: CGFloat = 0.0
    //Default height Constraint
    public var heightConstraint: NSLayoutConstraint?

    //To set corner radius for ASButton using IBInspectable
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(layer.cornerRadius)
        } set {
            layer.cornerRadius = CGFloat(newValue)
            layer.masksToBounds = layer.cornerRadius > 0
        }
    }

    //To set border width for ASButton using IBInspectable
    @IBInspectable var borderWidth: Double {
        get {
            return Double(layer.borderWidth)
        } set {
            layer.borderWidth = CGFloat(newValue)
        }
    }

    //To set border color for ASButton using IBInspectable
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        } set {
            layer.borderColor = newValue?.cgColor
        }
    }

    //To set shadow radius for ASButton using IBInspectable
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(layer.shadowRadius)
        } set {
            layer.shadowRadius = CGFloat(newValue)
        }
    }

    //To set shadow color for ASButton using IBInspectable
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        } set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    //To set shadow opacity for ASButton using IBInspectable
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        } set {
            layer.shadowOpacity = newValue
        }
    }

    //To set shadow offset for ASButton using IBInspectable
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        } set {
            layer.shadowOffset = newValue
        }
    }

    //Updates the color change while the button is pressed
    override open var isHighlighted: Bool {
        didSet {
            if let style = buttonStyle {
                backgroundColor = isHighlighted ? style.highlightedBackgroundColor : style.normalBackgroundColor
            }
        }
    }

    //Updates the color change on button is enabled or normal
    override open var isEnabled: Bool {
        didSet {
            if let style = buttonStyle {
                if isEnabled {
                    backgroundColor = style.normalBackgroundColor
                    setTitleColor(style.textColor, for: .normal)
                } else {
                    backgroundColor = style.disabledBackgroundColor
                    setTitleColor(style.disabledTextColor, for: .normal)
                }
            }
        }
    }

    /// Default methods to initialize
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Set all the properties which are common for all the ASButton types
    func setDefaultProperties() {
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
        self.imageView?.layer.cornerRadius = 5.0
        self.titleLabel?.font = ASTheme.font.buttonFont
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.adjustsImageSizeForAccessibilityContentSizeCategory = true
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 0.0)
        heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .greaterThanOrEqual,
                                              toItem: nil, attribute: .height, multiplier: 1.0, constant: 64.0)
        self.addConstraint(heightConstraint!)
    }

    // To support Accessability for Large, Small and all types of sizes
    // According to intrinsicContentSize the button text will be increased
    // or decreased in the device
    override public var intrinsicContentSize: CGSize {
        let titlesize = self.calculateTitleLabelSize()
        return CGSize(width: self.frame.width, height: titlesize.height + padding)
    }

    /// To calculate content size of title label height
    func calculateTitleLabelSize() -> CGSize {
        var titleHeight: CGFloat = 0
        var titleWidth: CGFloat = 0
        if let title = titleLabel {
            titleLabel?.numberOfLines = 0
            titleLabel?.lineBreakMode = . byWordWrapping
            titleLabel?.text = title.text
            let maximumLabelSize: CGSize = CGSize(width: title.frame.size.width, height: CGFloat(Float.infinity))
            //calculating content size for text,sizeThatFits method return extact content height for fixed width
            let expectedLabelSize: CGSize = (title.sizeThatFits(maximumLabelSize))
            titleHeight = expectedLabelSize.height
            titleWidth = expectedLabelSize.width
        }
        let calculatedSize = CGSize(width: titleWidth, height: titleHeight)
        return calculatedSize
    }

    //update preferredMaxWidth everytime frame changes
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.preferredMaxLayoutWidth = self.titleLabel!.frame.width
    }

    // MARK: - ------- To apply style to button -------
    /// Apply button style by passing style as parameter
    /// - Parameter style: ButtonStyle has Color and Font Style
    public func apply(style: ButtonStyle) {
        self.buttonStyle = style
        self.setDefaultProperties()
        titleLabel?.font = style.textFont
        setTitleColor(style.textColor, for: .normal)
        setTitleColor(style.disabledTextColor, for: .disabled)
        backgroundColor = style.normalBackgroundColor
    }
}
