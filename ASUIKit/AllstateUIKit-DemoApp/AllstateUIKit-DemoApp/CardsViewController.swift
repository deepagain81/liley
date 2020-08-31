//
//  CardsViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class CardsViewController: UIViewController {

    @IBOutlet private weak var baseStackView: UIStackView!
    @IBOutlet private weak var cardMosaic: CardMosaicActionView!
    @IBOutlet private weak var cardAction: CardMosaicActionView!
    @IBOutlet private weak var cardPromo: CardPromoView!
    // MARK: Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ASTheme.color.background
        loadCardViaStoryBoard()
    }

    override func viewWillDisappear(_ animated: Bool) {
        // To reset Mosaic card pressed state
        super.viewWillDisappear(true)
        cardMosaic.resetCardState()
    }

    // MARK: Get card data
    func getCardData() -> [CardData] {
        var ctaArray:[(image: UIImage, title: String)] = []
         var promoImageArray:[(logoImage: UIImage, backgroundImage: UIImage)] = []
        guard let ctaImage = UIImage(named: "FPOCTA"),
            let promoImage = UIImage(named: "promo"),
            let fpoImage = UIImage(named: "FPOAction"),
            let agentImage = UIImage(named: "AgentPhoto"),
            let disclosureImage = UIImage(named: "Disclosure Arrow"),
            let promoLogoImage = UIImage(named: "logo") else {
                return [CardData()]
        }
        let ctaTitle = "SECONDARY CTA"
        ctaArray.append((image: ctaImage, title: ctaTitle))
        ctaArray.append((image: ctaImage, title: ctaTitle))
        promoImageArray.append((logoImage:promoLogoImage, backgroundImage:promoImage))
        var cardMosaicData = CardData(title: "Source/Subheadline/Agent Name",
                                  subtitle: "SOURCE/FOOTNOTE",
                                  agentImage: agentImage,
                                  disclosureImage: disclosureImage,
                                  type: .mosaicCard)
        cardMosaicData.prepareCTASectionConfig(ctaDataArray: ctaArray)
        var cardActionData = CardData(title: "Source/Subheadline",
                                        subtitle: "",
                                        agentImage: fpoImage,
                                        disclosureImage: nil,
                                        type: .actionCard)
        cardActionData.prepareCTASectionConfig(ctaDataArray: ctaArray)
        let cardPromoData = CardData(fpoText: "FPO",
                                     headlineText: "Award-winning protection",
                                     captionText: "Phone protection starting at $12.99/mo",
                                     primaryButtonTitle: "PRIMARYCTA",
                                     promoImages: promoImageArray)
        let cardsArray = [cardMosaicData, cardActionData, cardPromoData]
        return cardsArray
    }
    // MARK: Invoke cards component via storyboard
    func loadCardViaStoryBoard() {
        let dataArray = getCardData()
        cardMosaic.setCardDelegate(as: self)
        cardAction.setCardDelegate(as: self)
        cardPromo.setCardDelegate(as: self)
        cardMosaic.reloadCard(with: dataArray[0])
        cardAction.reloadCard(with: dataArray[1])
        cardPromo.reloadCard(with: dataArray[2])

    }
    // MARK: Invoke cards component via code
    func loadCardManually() {
        //P.S - This is just for demo
        var dataArray = [CardData]()
        dataArray = getCardData()
        let cardMosaicInst = cardBuilder.create(with: dataArray[0], type: .mosaicCard)
        cardMosaicInst.setCardDelegate(as: self)
        cardMosaicInst.reloadCard(with: dataArray[0])
        baseStackView.addArrangedSubview(cardMosaicInst)
        let cardActionInst = cardBuilder.create(with: dataArray[1], type: .actionCard)
        cardActionInst.setCardDelegate(as: self)
        cardActionInst.reloadCard(with: dataArray[1])
        baseStackView.addArrangedSubview(cardActionInst)
        let cardPromoInst = cardBuilder.create(with: dataArray[2], type: .promoCard)
        cardPromoInst.setCardDelegate(as: self)
        cardPromoInst.reloadCard(with: dataArray[2])
        baseStackView.addArrangedSubview(cardPromoInst)
    }

}
// MARK: Cards Delegate
extension CardsViewController: CardDelegateProtocol {
    func onLeftCTAPress(cardID: String) {
    }
    func onRightCTAPress(cardID: String) {
    }
    func didPressMosaicHeaderSection() {

        let identifier = "AgentCardViewController"
        guard let agentViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            // view controller not found or invalid storyboard identifier
            return
        }
        self.navigationController?.pushViewController(agentViewController, animated: true)
    }
}
// MARK: StoryboardIdentifierProtocol
extension CardsViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "CardsViewController"
    }
}
