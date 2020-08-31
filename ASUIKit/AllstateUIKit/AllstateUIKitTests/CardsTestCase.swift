//
//  CardTests.swift
//  AllstateUIKitTests
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 19/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//
@testable import AllstateUIKit
import XCTest

class CardsTestCase: XCTestCase {

    var cardMosaicData: CardData!
    var cardActionData: CardData!
    var cardPromoData: CardData!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var ctaArray:[(image: UIImage?, title: String)] = []
        var promoImageArray:[(logoImage: UIImage?, backgroundImage: UIImage?)] = []
        let ctaTitle = "SECONDARY CTA"
        ctaArray.append((image: UIImage(named: ""), title: ctaTitle))
        ctaArray.append((image: UIImage(named: ""), title: ctaTitle))
        promoImageArray.append((logoImage:UIImage(named: ""), backgroundImage:UIImage(named: "")))
        cardMosaicData = CardData(title: "Source/Subheadline/Agent Name",
                                  subtitle: "SOURCE/FOOTNOTE",
                                  agentImage: UIImage(named: ""),
                                  disclosureImage: UIImage(named: ""),
                                  type: .mosaicCard)
        cardMosaicData.prepareCTASectionConfig(ctaDataArray: ctaArray)

        cardActionData = CardData(title: "Source/Subheadline",
                                  subtitle: "",
                                  agentImage: UIImage(named: ""),
                                  disclosureImage: nil,
                                  type: .actionCard)
        cardActionData.prepareCTASectionConfig(ctaDataArray: ctaArray)

        cardPromoData = CardData(fpoText: "FPO",
                                 headlineText: "Award-winning protection",
                                 captionText: "Phone protection starting at $12.99/mo",
                                 primaryButtonTitle: "PRIMARYCTA",
                                 promoImages: promoImageArray)
    }

    func testCardBuilder_WithCardType_ShouldCreateandConfigCard() {
        guard let moisaicCardInst = cardBuilder.create(with: cardMosaicData,
                                                         type: .mosaicCard) as? CardMosaicActionView else { return }
        XCTAssertTrue(moisaicCardInst.getMainTitleText() == "Source/Subheadline/Agent Name",
                      "Failed: Title text is not - Source/Subheadline/Agent Name")
        XCTAssertTrue(moisaicCardInst.getSubTitleText() == "SOURCE/FOOTNOTE",
                      "Failed: Subtitle text is not - SOURCE/FOOTNOTE")
        XCTAssertNotNil(moisaicCardInst.getMainTitleText())
        XCTAssertTrue(moisaicCardInst.getSubTitleText() == "SOURCE/FOOTNOTE",
                      "Failed: Subtitle text is not -  SOURCE/FOOTNOTE")
        XCTAssertNotNil(moisaicCardInst.getSubTitleText())
        guard let  promoCardInst = cardBuilder.create(with: cardPromoData,
                                                        type: .promoCard) as? CardPromoView else { return }
        XCTAssertTrue(promoCardInst.getHeadLineLabelText() == "Award-winning protection",
                      "Failed: Headline text is not -  Award-winning protection")
        XCTAssertNotNil(promoCardInst.getHeadLineLabelText())
        XCTAssertTrue(promoCardInst.getCaptionLabelText() == "Phone protection starting at $12.99/mo",
                      "Failed: captionLabel text is not -  Phone protection starting at $12.99/mo")
    }

    func testCardView_WithCardType_ShouldCreateandConfigCard() {
        let mosaicCard = CardMosaicActionView()
        mosaicCard.reloadCard(with: cardMosaicData)
        XCTAssertTrue(mosaicCard.getleftCTAButtonText() == "SECONDARY CTA",
                      "Failed: leftCTAButton title text is not -  SECONDARY CTA")
        let agentImage = mosaicCard.getAgentImage()
        XCTAssertNotNil(agentImage)
        let actionCard = CardMosaicActionView()
        actionCard.reloadCard(with: cardActionData)
        XCTAssertTrue(mosaicCard.getrightCTAButtonText() == "SECONDARY CTA",
                      "Failed: leftCTAButton title text is not -  SECONDARY CTA")
        let promoCard = CardPromoView()
        promoCard.reloadCard(with: cardPromoData)
        let promoBackgroundImage = promoCard.getBackgroundImage()
        XCTAssertNotNil(promoBackgroundImage)
        XCTAssertTrue(promoCard.getCallToActionButtonText() == "PRIMARYCTA",
                      "Failed: primaryCTAButton title text is not -  PRIMARYCTA")

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        cardMosaicData = nil
        cardActionData = nil
        cardPromoData = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let mosaicCard = CardMosaicActionView()
            mosaicCard.reloadCard(with: cardMosaicData)
            let actionCard = CardMosaicActionView()
            actionCard.reloadCard(with: cardActionData)
            let promoCard = CardPromoView()
            promoCard.reloadCard(with: cardPromoData)
        }
    }
}
