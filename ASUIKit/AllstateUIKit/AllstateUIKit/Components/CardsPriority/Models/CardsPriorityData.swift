//
//  CardsPriorityData.swift
//  AllstateUIKit

import Foundation
import UIKit

/// The Cards Priority Data Model is constructed based on the elements required to construct the card
/// This defines the card to have three sections
public struct CardsPriorityData {
    var headerSection: CardsPriorityHeaderSection?
    var contentSection: CardsPriorityContentSection?
    var callToActionSection: CardsPriorityCTASection?
    public init() {}
    mutating public func prepareHeaderSectionWith(titleLine1: String?,
                                                  titleLine2: String?,
                                                  titleLine3Left: String?,
                                                  titleLine3Right: String?) {
        self.headerSection = CardsPriorityHeaderSection(titleLine1: titleLine1,
                                                  titleLine2: titleLine2,
                                                  titleLine3Left: titleLine3Left,
                                                  titleLine3Right: titleLine3Right)
    }
    mutating public func prepareContentSectionWith(titleLine1: String?, titleLine2: String?) {
        self.contentSection = CardsPriorityContentSection(titleLine1: titleLine1,
                                                        titleLine2: titleLine2)
    }
    mutating public func prepareCTASection(callToActionData: [(image: UIImage?,
        title: String)]) -> CardsPriorityCTASection {
        var firstCTA: CTAButton?
        var secondCTA: CTAButton?
        if callToActionData.count > 0 {
            firstCTA = CTAButton(image: callToActionData[0].image, text: callToActionData[0].title)
        }
        if callToActionData.count > 1 {
            secondCTA = CTAButton(image: callToActionData[1].image, text: callToActionData[1].title)
        }
        self.callToActionSection = CardsPriorityCTASection(firstItem: firstCTA, secondItem: secondCTA)
        return self.callToActionSection!
    }
}

/// Defines the structure of Card's top section
struct CardsPriorityHeaderSection {
    var titleLine1: String?
    var titleLine2: String?
    var titleLine3Left: String?
    var titleLine3Right: String?
}

/// Defines the structure of Card's middle section
struct CardsPriorityContentSection {
    var titleLine1: String?
    var titleLine2: String?
}

/// Defines the structure of Card's CTA (Click/Call to Action) section
/// Currently defines to have only 2 CTAs
public struct CardsPriorityCTASection {
    var firstItem: CTAButton?
    var secondItem: CTAButton?
}

/// Defines the structure of items in CTA sections, Click to Action Item
struct CTAButton {
    var image: UIImage?
    var text: String?
}
