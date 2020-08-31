//
//  ASThemeRegular.swift
//  ASUIKit

import Foundation

//PS: Do not add any additional functions to ASThemeRegular, unless ASThemeProtocol is updated with new functions.

final class ASThemeRegular: ASThemeProtocol {
    //load all custom font and register it
    init() {
        UIFont.loadAllCustomFonts()
    }

    // All the color names here refered from Zeplin as per AllState's requirement for color
    lazy var background: UIColor? = {
        return UIColor.whiteColor
    }()
    lazy var buttonWhiteTitle: UIColor? = {
        return UIColor.whiteColor
    }()
    lazy var buttonBlueTitle: UIColor? = {
        return UIColor.primaryDeepBlue
    }()
    lazy var buttonDisabledTitle: UIColor? = {
        return UIColor.disabledTitleColor
    }()
    lazy var secondaryButtonBackgroundColor: UIColor? = {
     return UIColor.whiteColor
    }()
    lazy var primaryHighlighted: UIColor? = {
        return  UIColor.primaryHighlighted
    }()
    lazy var priorityHighlighted: UIColor? = {
        return UIColor.priorityHighlighted
    }()
    lazy var highPriorityHighlighted: UIColor? = {
        return UIColor.highPriorityHighlighted
    }()
    lazy var secondaryHighlighted: UIColor? = {
        return UIColor.secondaryHighlighted
    }()
    lazy var tertiary: UIColor? = {
        return UIColor.tertiary
    }()
    lazy var disabledColor: UIColor? = {
        return UIColor.grey1
    }()
    lazy var primaryBackgroundColor: UIColor? = {
        return UIColor.primaryBlue
    }()
    lazy var priorityBackgroundColor: UIColor? = {
        return UIColor.secondaryYellow
    }()
    lazy var highPriorityBackgroundColor: UIColor? = {
        return UIColor.secondaryRed
    }()
    lazy var disabledBlueColor: UIColor? = {
        return UIColor.disabledBlueColor
    }()

    // All the font family names here are refered from Zeplin as per AllState's requirement for font

    lazy var largeTitle: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .largeTitle, fontName: "SFProText-Bold", fontSize: 34.0)
    }()
    lazy var title1: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title1, fontName: "SFProDisplay-Regular", fontSize: 28.0)
    }()
    lazy var title2: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title2, fontName: "SFProDisplay-Regular", fontSize: 22.0)
    }()
    lazy var title3: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title3, fontName: "SFProDisplay-Regular", fontSize: 20.0)
    }()
    lazy var headline: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .headline, fontName: "SFProText-Semibold", fontSize: 17.0)
    }()
    lazy var body: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .body, fontName: "SFProText-Regular", fontSize: 17.0)
    }()
    lazy var callout: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .callout, fontName: "SFProText-Regular", fontSize: 16.0)
    }()
    lazy var subhead: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Regular", fontSize: 15.0)
    }()
    lazy var footnote: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .footnote, fontName: "SFProText-Regular", fontSize: 13.0)
    }()
    lazy var caption1: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .caption1, fontName: "SFProText-Regular", fontSize: 12.0)
    }()
    lazy var caption2: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .caption2, fontName: "SFProText-Regular", fontSize: 11.0)
    }()

    //TO DO:  Custom font to be added, which is not available in the Zeplin Style guide.

    // To create a new font please follow the below steps
    // Step 1: Goto Resources folder and open Fonts folder
    // Step 2: Add the .otf file in your target
    // Step 3: Open Info.plist and below "Fonts provided by application"
    // Step 4: Add the font name in the array and Save
    // Step 5: In ASThemeRegular.swift file add the custom font as done in above with the valid style
    // Step 6: Also please make sure that you have defined the same font name in ASThemeFont file

    // NOTE: Please make sure that while adding the custom font in this file
    // follow the proper naming convension meticulously

    lazy var caption2Heavy: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .caption2, fontName: "SFProText-Heavy", fontSize: 11.0)
    }()
    lazy var captionMedium: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .caption1, fontName: "SFProText-Medium", fontSize: 12.0)
    }()
    lazy var rowLabelFont: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .headline, fontName: "SFProText-Heavy", fontSize: 17.0)
    }()
    lazy var ctaButtonSubHeadHeavy: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Heavy", fontSize: 15.0)
    }()
    lazy var semibold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .footnote, fontName: "SFProText-Semibold", fontSize: 13.0)
    }()
    lazy var regular: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .footnote, fontName: "SFProText-Regular", fontSize: 13.0)
    }()
    lazy var headline2: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Semibold", fontSize: 15.0)
    }()
    lazy var subheadHeavy: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Heavy", fontSize: 15.0)
    }()
    lazy var buttonFont: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Heavy", fontSize: 15.0)
    }()
    lazy var headlineSemiBold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Semibold", fontSize: 15.0)
    }()
    lazy var titleBold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title1, fontName: "SFProText-Bold", fontSize: 22.0)
    }()
    lazy var subheadBold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Bold", fontSize: 22.0)
    }()
    lazy var largeTitleRegular: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .largeTitle, fontName: "SFProText-Regular", fontSize: 34.0)
    }()
    lazy var subheadSemiBold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Semibold", fontSize: 34.0)
    }()
    lazy var subheadRegular: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Semibold", fontSize: 17.0)
    }()
    lazy var subheadBold15: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Bold", fontSize: 15.0)
    }()
    lazy var subheadRegular17: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Regular", fontSize: 17.0)
    }()
    lazy var titleSemibold17: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title3, fontName: "SFProText-Semibold", fontSize: 17.0)
    }()
    lazy var subheadMedium13: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Medium", fontSize: 13.0)
    }()
    lazy var subheadSemibold11: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .subheadline, fontName: "SFProText-Semibold", fontSize: 11.0)
    }()
    lazy var title2DisplayBold34: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title2, fontName: "SFProDisplay-Bold", fontSize: 34.0)
    }()
    lazy var largeTitleDisplayRegular: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .largeTitle, fontName: "SFProDisplay-Regular", fontSize: 34.0)
    }()
    lazy var title2DisplayBold: UIFont = {
        return UIFont.preferredCustomFont(forTextStyle: .title2, fontName: "SFProDisplay-Bold", fontSize: 22.0)
    }()
    // Fixed size fonts
    lazy var displayMedium12: UIFont = {
        return UIFont(name: "SFProDisplay-Medium", size: 12.0)
    }() ?? UIFont()
    lazy var displayMedium14: UIFont = {
        return UIFont(name: "SFProDisplay-Medium", size: 14.0)
    }() ?? UIFont()
    lazy var fixedLargeTitleDisplayRegular: UIFont = {
        return UIFont(name: "SFProDisplay-Regular", size: 34.0)
    }() ?? UIFont()
    lazy var textRegular17: UIFont = {
        return UIFont(name: "SFProText-Regular", size: 17.0)
    }() ?? UIFont()
    lazy var fixedCTASubHeadHeavy: UIFont = {
        return UIFont(name: "SFProText-Heavy", size: 15.0)
    }() ?? UIFont()
}
