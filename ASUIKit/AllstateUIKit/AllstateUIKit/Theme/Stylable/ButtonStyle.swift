//
//  ButtonStyle.swift
//  AllstateUIKit
//
//  Created by Vairavan, Muthuraman (INFOSYS) on 18/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import Foundation

public class ButtonStyle: ASTextStylable, ASColorStylable {
    public var textFont: UIFont
    public var textColor: UIColor?
    public var disabledTextColor: UIColor?
    public var normalBackgroundColor: UIColor?
    public var highlightedBackgroundColor: UIColor?
    public var disabledBackgroundColor: UIColor?

    init() {
        textFont = ASTheme.font.buttonFont
    }
}

extension ButtonStyle {
    //created property for different styles of button. can add more property later
    public static var primary: ButtonStyle {
        let primaryStyle = ButtonStyle()
        primaryStyle.normalBackgroundColor = ASTheme.color.primaryBackgroundColor
        primaryStyle.highlightedBackgroundColor = ASTheme.color.primaryHighlighted
        primaryStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        primaryStyle.textFont = ASTheme.font.buttonFont
        primaryStyle.textColor = ASTheme.color.buttonWhiteTitle
        primaryStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return primaryStyle
    }

    public static var priority: ButtonStyle {
        let priorityStyle = ButtonStyle()
        priorityStyle.normalBackgroundColor = ASTheme.color.priorityBackgroundColor
        priorityStyle.highlightedBackgroundColor = ASTheme.color.priorityHighlighted
        priorityStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        priorityStyle.textFont = ASTheme.font.buttonFont
        priorityStyle.textColor = ASTheme.color.buttonBlueTitle
        priorityStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return priorityStyle
    }

    public static var highPriority: ButtonStyle {
        let highPriorityStyle = ButtonStyle()
        highPriorityStyle.normalBackgroundColor = ASTheme.color.highPriorityBackgroundColor
        highPriorityStyle.highlightedBackgroundColor = ASTheme.color.highPriorityHighlighted
        highPriorityStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        highPriorityStyle.textFont = ASTheme.font.buttonFont
        highPriorityStyle.textColor = ASTheme.color.buttonWhiteTitle
        highPriorityStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return highPriorityStyle
    }

    public static var secondary: ButtonStyle {
        let secondaryStyle = ButtonStyle()
        secondaryStyle.normalBackgroundColor = ASTheme.color.secondaryButtonBackgroundColor
        secondaryStyle.highlightedBackgroundColor = ASTheme.color.secondaryHighlighted
        secondaryStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        secondaryStyle.textFont = ASTheme.font.buttonFont
        secondaryStyle.textColor = ASTheme.color.buttonBlueTitle
        secondaryStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return secondaryStyle
    }

    public static var secondaryDouble: ButtonStyle {
        let secondaryDoubleStyle = ButtonStyle()
        secondaryDoubleStyle.normalBackgroundColor = ASTheme.color.secondaryButtonBackgroundColor
        secondaryDoubleStyle.highlightedBackgroundColor = ASTheme.color.secondaryHighlighted
        secondaryDoubleStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        secondaryDoubleStyle.textFont = ASTheme.font.buttonFont
        secondaryDoubleStyle.textColor = ASTheme.color.buttonBlueTitle
        secondaryDoubleStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return secondaryDoubleStyle
    }

    public static var tertiary: ButtonStyle {
        let tertiaryStyle = ButtonStyle()
        tertiaryStyle.normalBackgroundColor = ASTheme.color.tertiary
        tertiaryStyle.highlightedBackgroundColor = ASTheme.color.secondaryHighlighted
        tertiaryStyle.disabledBackgroundColor = ASTheme.color.disabledColor
        tertiaryStyle.textFont = ASTheme.font.buttonFont
        tertiaryStyle.textColor = ASTheme.color.buttonBlueTitle
        tertiaryStyle.disabledTextColor = ASTheme.color.buttonDisabledTitle
        return tertiaryStyle
    }
}
