//
//  ASThemeProtocol.swift
//  ASUIKit

import Foundation

//Colors required by the application to be defined here
public protocol ASThemeColor {
    var background: UIColor? { get }
    var buttonWhiteTitle: UIColor? {get}
    var buttonBlueTitle: UIColor? {get}
    var buttonDisabledTitle: UIColor? {get}
    var secondaryButtonBackgroundColor: UIColor? { get }
    var primaryHighlighted: UIColor? { get }
    var priorityHighlighted: UIColor? { get }
    var highPriorityHighlighted: UIColor? { get }
    var secondaryHighlighted: UIColor? { get }
    var tertiary: UIColor? { get }
    var disabledColor: UIColor? { get }
    var priorityBackgroundColor: UIColor? { get }
    var highPriorityBackgroundColor: UIColor? { get }
    var primaryBackgroundColor: UIColor? { get }
    var disabledBlueColor: UIColor? { get }
}

public protocol ASThemeFont {
    var largeTitle: UIFont { get }
    var title1: UIFont { get }
    var title2: UIFont { get }
    var title3: UIFont { get }
    var headline: UIFont { get }
    var body: UIFont { get }
    var callout: UIFont { get }
    var subhead: UIFont { get }
    var footnote: UIFont { get }
    var caption1: UIFont { get }
    var caption2: UIFont { get }

    //TO DO:  Custom font to be added, which is not available in the Zeplin Style guide.

    var caption2Heavy: UIFont { get }
    var captionMedium: UIFont { get }
    var rowLabelFont: UIFont { get }
    var ctaButtonSubHeadHeavy: UIFont { get }
    var semibold: UIFont { get }
    var regular: UIFont { get }
    var headline2: UIFont { get }
    var subheadHeavy: UIFont { get }
    var buttonFont: UIFont { get }
    var headlineSemiBold: UIFont { get }
    var titleBold: UIFont { get }
    var subheadBold: UIFont { get }
    var largeTitleRegular: UIFont { get }
    var subheadSemiBold: UIFont { get }
    var subheadRegular: UIFont { get }
    var subheadBold15: UIFont { get }
    var subheadRegular17: UIFont { get }
    var titleSemibold17: UIFont { get }
    var subheadMedium13: UIFont { get }
    var subheadSemibold11: UIFont { get }
    var largeTitleDisplayRegular: UIFont { get }
    var title2DisplayBold34: UIFont { get }
    var title2DisplayBold: UIFont { get }
    var displayMedium12: UIFont { get }
    var displayMedium14: UIFont { get }
    var fixedLargeTitleDisplayRegular: UIFont { get }
    var textRegular17: UIFont { get }
    var fixedCTASubHeadHeavy: UIFont { get }
}

//The theme is made of color and font
protocol ASThemeProtocol: ASThemeColor, ASThemeFont {}
