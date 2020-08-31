//
//  CardConfiguration.swift
//  ASUIKit

import Foundation

//The Card Data Model is constructed based on the elements required to construct the card defined currently
//This defines the card to have three sections
public struct CardData {

    var topSection: ContentCardTopSection?
    var headerMosaicSection: ContentMosaicActionCardHeaderSection?
    var middleSection: ContentCardMiddleSection?
    var callToActionSection: CTASection?
    var backgroundImage: UIImage?
    var thumbnailImage: UIImage?
    var promoCard: PromoCardHeaderSection?
    var promoBackground: PromoCardCallToActionSection?
    public init() {}
    /// Method to set Mosaic and Minimized card data
    /// - Parameters:
    ///   - title: card title description
    ///   - subtitle: card subtitle description
    ///   - agentImage: card agentimage
    ///   - disclosureImage: card disclosureimage
    ///   - type: card type
    public init(title: String?,
                subtitle: String?,
                agentImage: UIImage?,
                disclosureImage: UIImage?,
                type: CardType?) {
        headerMosaicSection = ContentMosaicActionCardHeaderSection(title: title,
                                                       subtitle: subtitle,
                                                       agentImage: agentImage,
                                                       disclosureImage: disclosureImage,
                                                       cardType: type)

    }
    /// Method to set Promo card data
    /// - Parameters:
    ///   - fpoText: promo card fpoText description
    ///   - headlineText:promo card headlineText description
    ///   - captionText:promo card captionText description
    ///   - logoImage:promo card logoImage
    ///   - backgroundImage: promo card backgroundImage
    ///   - primaryButtonTitle: promo card primaryButtonTitle description
    ///   - type: card type
    public init(fpoText: String?,
                headlineText: String?,
                captionText: String?,
                primaryButtonTitle: String?,
                promoImages: [(logoImage: UIImage?, backgroundImage: UIImage?)]
                ) {
        promoCard = PromoCardHeaderSection(fpoText: fpoText,
                                        headlineText: headlineText,
                                        captionText: captionText,
                                        logoImage: promoImages[0].logoImage)
        promoBackground = PromoCardCallToActionSection(backgroundImage: promoImages[0].backgroundImage,
                                                 primaryButtonTitle: primaryButtonTitle)

    }
    mutating public func prepareTopSectionWith(titleLine1: String?,
                                               titleLine2: String?,
                                               titleLine3Left: String?,
                                               titleLine3Right: String?) {

        topSection = ContentCardTopSection(titleLine1: titleLine1,
                                                titleLine2: titleLine2,
                                                titleLine3Left: titleLine3Left,
                                                titleLine3Right: titleLine3Right)
    }
    mutating public func prepareMiddleSectionWith(titleLine1: String?,
                                                  titleLine2: String?) {

        middleSection = ContentCardMiddleSection(titleLine1: titleLine1,
                                                      titleLine2: titleLine2)
    }
    /// Method to set data for Mosaic and action card cta section
    /// - Parameter ctaDataArray: Contains array of tuple with image and title
    mutating public func prepareCTASectionConfig(ctaDataArray: [(image: UIImage?, title: String)]) {
        var firstCTA: CTAItem?
        var secondCTA: CTAItem?

        if ctaDataArray.count > 0 {
            firstCTA = CTAItem(buttonImage: ctaDataArray[0].image, buttonText: ctaDataArray[0].title)
        }
        if ctaDataArray.count > 1 {
            secondCTA = CTAItem(buttonImage: ctaDataArray[1].image, buttonText: ctaDataArray[1].title)
        }
        self.callToActionSection = CTASection(firstItem: firstCTA, secondItem: secondCTA)

    }
}

///Defines the structure of Card's top section
struct ContentCardTopSection {
    var titleLine1: String?
    var titleLine2: String?
    var titleLine3Left: String?
    var titleLine3Right: String?
}
///Defines the structure of Mosaic and Action Card's header section
struct ContentMosaicActionCardHeaderSection {
    var title: String?
    var subtitle: String?
    var agentImage: UIImage?
    var disclosureImage: UIImage?
    var cardType: CardType?
}
///Defines the structure of promo card header section
struct PromoCardHeaderSection {
    var fpoText: String?
    var headlineText: String?
    var captionText: String?
    var logoImage: UIImage?
}
///Defines the structure of Card's middle section
struct ContentCardMiddleSection {
    var titleLine1: String?
    var titleLine2: String?
}
///Define the structure of promo card CallToAction section
struct PromoCardCallToActionSection {
    var backgroundImage: UIImage?
    var primaryButtonTitle: String?
}

///Defines the structure of Card's CTA (Click/Call to Action) section
///Currently defines to have only 2 CTAs
struct CTASection {
    var firstItem: CTAItem?
    var secondItem: CTAItem?
}

///Defines the structure of items in CTA sections, Click to Action Item
struct CTAItem {
    var buttonImage: UIImage?
    var buttonText: String?
}
///Defines the structure of items in CTA sections, Click to Action Item
struct PromoImages {
    var backgroundImage: UIImage?
    var logoImage: String?
}
