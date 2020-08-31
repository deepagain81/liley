//
//  ViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by Shruthi on 11/28/19.
//  Copyright © 2019 AllState. All rights reserved.
//

import UIKit
import AllstateUIKit_Apple

class ViewController: UIViewController {
    @IBOutlet var baseView: UIView!
    @IBOutlet var actionCard: UIView!
    @IBOutlet var mosaicActionCardView: UIView!
    @IBOutlet var promoCardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Explains the ASTheme interface
        self.view.backgroundColor = ASTheme.color.background
        //Explains the ASUIKit interface
        setupSampleCard()
    }
    func setupSampleCard() {
        //Card interface example
        let cta1 = (image:UIImage(named: "24"), title:"SECONDARY CTA")
        let cta2 = (image:UIImage(named: "24"), title:"SECONDARY CTA")
        let array = [cta1, cta2]
        guard let image = UIImage(named: "promo") else {
                   return
               }
               guard let image1 = UIImage(named: "logo") else {
                   return
               }
        var cardData = ASCardData()
        cardData.prepareMosaicTopSectionWith(titleLine1: "Source/Subheadline/Agent",
        titleLine2: "Source/Footnote", agentImage: UIImage(named: "AgentPhoto"),
        disclosureImage: UIImage(named: "Disclosure Arrow") )
        cardData.prepareCTASectionConfig(CTAdata: (array as? [(image: UIImage, title: String)] ?? nil)!)
        cardData.preparePromoSectionWith(fpoLabel: "FPO", headlineLabel: "Headline",
                                                captionLabel: "Caption", buttonBackgroundImage: image1)
        cardData.preparePromoBackgroundWith(backgroundImage: image, primaryButton: "PRIMARYCTA")
        var cardActionData = ASCardData()
        cardActionData.prepareMosaicTopSectionWith(titleLine1: "Source/Subheadline", titleLine2: nil,
        agentImage: UIImage(named: "32"), disclosureImage: nil)
        cardActionData.prepareCTASectionConfig(CTAdata: (array as? [(image: UIImage, title: String)] ?? nil)!)
        let cardMosaic = ASUIKit.ASCard.create(with: cardData, type: .mosaicCard)
               cardMosaic.setCardDelegate(as: self)
               mosaicActionCardView.addSubview(cardMosaic)
        baseView.addSubview(mosaicActionCardView)
        let cardAction = ASUIKit.ASCard.create(with: cardActionData, type: .actionCard)
               cardAction.setCardDelegate(as: self)
               actionCard.addSubview(cardAction)
        baseView.addSubview(actionCard)
        let cardPromo = ASUIKit.ASCard.create(with: cardData, type: .promoCard)
              cardPromo.setCardDelegate(as: self)
              promoCardView.addSubview(cardPromo)
        baseView.addSubview(promoCardView)
        //Similar to Tile, Card also has multiple way for creation.
        //As user one should be able to create a tile using one these ways.
        //As a developer of ASUIKit, make sure you provide your user all the possible way of creating
        //and interacting with card or any other component.
    }

}
extension ViewController: CardDelegateProtocol {
    func onCTA1Press(cardID: String) {
            print("CTA1 Tapped")
       }
       func onCTA2Press(cardID: String) {
           print("CTA2 Tapped")
       }
      func didPressMosaicTopSection() {
           print("View Tapped")
       }
}
