//
//  BaseTile.swift
//  AllstateUIKit

import UIKit

private struct ShadowConstant {
    static let shadowOpacityValue: Float = 1.0
    static let shadowRadiusValue: CGFloat = 6.0
    static let shadowOffsetWidth: CGFloat = 0.0
    static let shadowOffsetHeight: CGFloat = 4.0
    static let shadowValueNil: CGFloat = 0.0
    static let shadowPathValue: CGFloat = 1

}

@IBDesignable
public class BaseTile: UIButton {
    var checkDefaultFlag = true
    // MARK: - ------- To set Inspectable elements to customize in storyboard-------
    //To set corner radius for ASTile
    @IBInspectable var cornerRadius: Double {
         get {
           return Double(layer.cornerRadius)
         } set {
           checkDefaultFlag = false
           layer.cornerRadius = CGFloat(newValue)
           layer.masksToBounds = layer.cornerRadius > 0
         }
    }
    //To set border width for ASTile
    @IBInspectable var borderWidth: Double {
        get {
          return Double(layer.borderWidth)
        } set {
         checkDefaultFlag = false
         layer.borderWidth = CGFloat(newValue)
        }
    }
    //To set border color for ASTile
    @IBInspectable var borderColor: UIColor? {
       get {
          return UIColor(cgColor: layer.borderColor!)
       } set {
          checkDefaultFlag = false
          layer.borderColor = newValue?.cgColor
       }
    }
    //To set shadow radius for ASTile
    @IBInspectable var shadowRadius: Double {
        get {
          return Double(layer.shadowRadius)
        } set {
          checkDefaultFlag = false
          layer.shadowRadius = CGFloat(newValue)
        }
    }
    //To set shadow color for ASTile
    @IBInspectable var shadowColor: UIColor? {
      get {
         return UIColor(cgColor: layer.shadowColor!)
      } set {
         checkDefaultFlag = false
         layer.shadowColor = newValue?.cgColor
      }
    }
    //To set shadow opacity for ASTile
    @IBInspectable var shadowOpacity: Float {
      get {
         return layer.shadowOpacity
      } set {
         checkDefaultFlag = false
         layer.shadowOpacity = newValue
     }
    }
    //To set shadow offset for ASTile
    @IBInspectable var shadowOffset: CGSize {
      get {
          return layer.shadowOffset
      } set {
          checkDefaultFlag = false
          layer.shadowOffset = newValue
      }
    }
    //To change background color on highlight
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.greyShadow : UIColor.white
        }
    }
    // MARK: - ------- To load from the nib -------
    public override func awakeFromNib() {
        super.awakeFromNib()
        //if custom settings is not applied in xib
        if checkDefaultFlag == true {
            checkDefaultFlag = false
            setCustomPropertiesForButton()
        }
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
            setCustomPropertiesForButton()
    }
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        titleLabel?.textColor = UIColor.primaryDeepBlue
        titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
        //if custom settings is not applied in xib
        if checkDefaultFlag == true {
            checkDefaultFlag = false
            setCustomPropertiesForButton()
        }
    }
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    // MARK: - ------- To set common properties to a tile -------
    //To calculate label height
    func calculateTitleLabelSize() -> CGSize {
        var titleHeight: CGFloat = 0
        var titleWidth: CGFloat = 0
        if let titleText = titleLabel?.text {
          titleLabel?.text = titleText
          let maximumLabelSize: CGSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
          let expectedLabelSize: CGSize = (titleLabel?.sizeThatFits(maximumLabelSize))!
          titleHeight = expectedLabelSize.height
          titleWidth = expectedLabelSize.width
        }
          let calucatedSize = CGSize(width: titleWidth, height: titleHeight)
          return calucatedSize
    }
    // To set default proprties of a tile
    func setCustomPropertiesForButton() {
        titleLabel?.textColor = UIColor.primaryDeepBlue
        titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
        adjustsImageWhenHighlighted = false
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.grey2?.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.cornerRadius = 10.0
        self.setTileShadow(top: false, left: true, bottom: true, right: true)
    }
}
