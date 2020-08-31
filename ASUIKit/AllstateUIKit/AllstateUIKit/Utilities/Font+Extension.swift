//
//  Font+Extension.swift
//  AllstateUIKit

import Foundation
import UIKit

extension UIFont {
    /// create font that dynamically scale when accessibility changes
    /// - Parameters:
    ///   - textStyle: textstyle like large
    ///   - fontName:  name of font
    ///   - fontSize:  font size that given in zeplin.
    ///   when accessibility is turned off, font with same size will be scaled again
    class func preferredCustomFont(forTextStyle textStyle: UIFont.TextStyle,
                                   fontName: String,
                                   fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize)
        }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }

    /// load all custom font required for framework
    class func loadAllCustomFonts() {
        let bundle = Bundle(for: ASTheme.self)
        UIFont.registerFont(withFilenameString: "SFProDisplay-Regular.otf", bundle: bundle)
        UIFont.registerFont(withFilenameString: "SFProText-Bold.otf", bundle: bundle)
        UIFont.registerFont(withFilenameString: "SFProText-Heavy.otf", bundle: bundle)
        UIFont.registerFont(withFilenameString: "SFProText-Regular.otf", bundle: bundle)
        UIFont.registerFont(withFilenameString: "SFProText-Semibold.otf", bundle: bundle)
         UIFont.registerFont(withFilenameString: "SFProText-Medium.otf", bundle: bundle)
        //TO DO:  Custom font to be added, which is not available in the Zeplin Style guide.
        UIFont.registerFont(withFilenameString: "SF-Pro-Display-Bold.otf", bundle: bundle)
        UIFont.registerFont(withFilenameString: "SF-Pro-Display-Medium.otf", bundle: bundle)
    }

    /// register font in framework
    /// - Parameters:
    ///   - filenameString: .otf ot .ttf font file name
    ///   - bundle: refer framewrok  bundle
    class func registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if CTFontManagerRegisterGraphicsFont(font, &errorRef) == false {
            print("UIFont+:  Failed to register font - register graphics font failed" +
                "- this font may have already been registered in the main bundle.")
        }
    }
}
