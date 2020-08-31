//
//  ASTheme.swift
//  ASUIKit

import Foundation

public final class ASTheme {

    //Access font from the current theme
    public class var font: ASThemeFont {
        return ASCurrentTheme.shared.getCurrent()
    }

    //Access font color the current theme
    public class var color: ASThemeColor {
        return ASCurrentTheme.shared.getCurrent()
    }

    // MARK: Some styling values.
    //Can define further as required.
    public class var cornerRadius: CGFloat {
        return 5 //Just a sample corner radius value
    }

    public class var leadingOffset: CGFloat {
        return 8 //Just a sample offset.
    }

    public class var trailingOffset: CGFloat {
        return 8 //Just a sample offset
    }

    public class var viewGapOffset: CGFloat {
        return 24 //Just a sample offset
    }

}
