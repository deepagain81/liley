//
//  UIColor+Extension.swift
//  AllstateUIKit
//
//  Created by Maria Irudayaraj, Martin (INFOSYS) on 17/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import Foundation
import UIKit
public extension UIColor {

    //load color assest from UIKit framework bundle
    // TO DO: later we can change compatibility traits for dark mode
    private class func loadColorAssest(named: String) -> UIColor? {
        return UIColor(named: named, in: Bundle(for: ASThemeRegular.self), compatibleWith: nil)
    }

    //Primary colors refered from Zeplin
    class var primaryBlue: UIColor? {
        return UIColor.loadColorAssest(named: "primaryBlue")
    }
    class var primaryDeepBlue: UIColor? {
        return UIColor.loadColorAssest(named: "primaryDeepBlue")
    }

    //Secondary colors refered from Zeplin
    class var secondaryAltBlue: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryAltBlue")
    }
    class var secondaryYellow: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryYellow")
    }
    class var secondaryOrange: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryOrange")
    }
    class var secondaryPink: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryPink")
    }
    class var secondaryGreen: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryGreen")
    }
    class var secondaryRed: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryRed")
    }
    class var disabledBlueColor: UIColor? {
        return UIColor.loadColorAssest(named: "disabledBlueColor")
    }

    //Tint colors refered from Zeplin
    class var orangeTint: UIColor? {
        return UIColor.loadColorAssest(named: "orangeTint")
    }
    class var pinkTint: UIColor? {
        return UIColor.loadColorAssest(named: "pinkTint")
    }
    class var greenTint: UIColor? {
        return UIColor.loadColorAssest(named: "greenTint")
    }
    class var yellowTint: UIColor? {
        return UIColor.loadColorAssest(named: "yellowTint")
    }
    class var blueTint: UIColor? {
        return UIColor.loadColorAssest(named: "blueTint")
    }
    class var groundFloor: UIColor? {
        return UIColor.loadColorAssest(named: "groundFloor")
    }
    class var yellowTintDark: UIColor? {
        return UIColor.loadColorAssest(named: "yellowTintDark")
    }
    class var blueTintDark: UIColor? {
        return UIColor.loadColorAssest(named: "blueTintDark")
    }
    class var redTintDark: UIColor? {
        return UIColor.loadColorAssest(named: "redTintDark")
    }
    class var greenTintDark: UIColor? {
        return UIColor.loadColorAssest(named: "greenTintDark")
    }

    //Grey colors refered from Zeplin
    class var grey1: UIColor? {
        return UIColor.loadColorAssest(named: "grey1")
    }
    class var grey2: UIColor? {
        return UIColor.loadColorAssest(named: "grey2")
    }
    class var grey3: UIColor? {
        return .loadColorAssest(named: "grey3")
    }
    class var grey4: UIColor? {
        return UIColor.loadColorAssest(named: "grey4")
    }
    class var grey5: UIColor? {
        return UIColor.loadColorAssest(named: "grey5")
    }
    class var grey6: UIColor? {
        return UIColor.loadColorAssest(named: "grey6")
    }
    class var grey7: UIColor? {
        return UIColor.loadColorAssest(named: "grey7")
    }
    class var greyShadow: UIColor? {
        return UIColor.loadColorAssest(named: "greyShadow")
    }

    //TO DO:  Custom colors to be added, which is not available in the Zeplin Style guide.

    // To create a new color please follow the below steps
    // Step 1: Go to Assets.xcassets or .xcassets extension folder
    // Step 2: Create a New group and name it with a relavant to your requirement
    // Step 3: Select the  + button on bottom left corner and select New Color Asset
    // Step 4: Add the name of the color asset as per your requirement
    // (You have to use the same name in the UIColor extension as above)
    // Step 5: Select the image asset and select the Attribute inspector
    // Step 6: Add your custom color RGB value in it.
    // Step 7: Add the color in the UIColor extension and you can access the color

    // NOTE: Please make sure that while adding the custom color in this and assets file
    // follow the proper naming convension meticulously

    //Custom colors used in other componenets but not in color styleguide
    class var primaryHighlighted: UIColor? {
        return UIColor.loadColorAssest(named: "primaryHighlighted")
    }
    class var priorityHighlighted: UIColor? {
        return UIColor.loadColorAssest(named: "priorityHighlighted")
    }
    class var highPriorityHighlighted: UIColor? {
        return UIColor.loadColorAssest(named: "highPriorityHighlighted")
    }
    class var secondaryHighlighted: UIColor? {
        return UIColor.loadColorAssest(named: "secondaryHighlighted")
    }
    class var tertiary: UIColor? {
        return UIColor.loadColorAssest(named: "tertiary")
    }
    class var disabledColor: UIColor? {
        return UIColor.loadColorAssest(named: "disabledColor")
    }
    class var whiteColor: UIColor? {
        return UIColor.loadColorAssest(named: "whiteColor")
    }
    class var gradientBlueBottom: UIColor {
        return UIColor(red: 1.0 / 255.0, green: 25.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    }
    class var gradientBlueTop: UIColor {
        return UIColor(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 160.0 / 255.0, alpha: 0.0)
    }
    class var shadowColor: UIColor {
        return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.16)
    }
    class var tileShadowColor: UIColor {
        return UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.16)
    }
    class var disabledTitleColor: UIColor {
        return UIColor(red: 107.0/255.0, green: 119.0/255.0, blue: 137.0/255.0, alpha: 1.0)
    }
}
