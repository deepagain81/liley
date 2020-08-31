//
//  CardsPriorityController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class CardsPriorityController: UIViewController {
    ///Inside mainStackView, I am adding ScrollView and inside Scrollview adding seven different types of cards
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var cardsScrollView: UIScrollView!
    @IBOutlet weak var contentMessageCardStackView: UIStackView!
    @IBOutlet weak var multiCTACardStackView: UIStackView!
    @IBOutlet weak var multiSourceCardStackView: UIStackView!
    @IBOutlet weak var multiSourcePriorityCardStackView: UIStackView!
    @IBOutlet weak var multiSourceHighPriorityCardStackView: UIStackView!
    @IBOutlet weak var amountPriorityCardStackView: UIStackView!
    @IBOutlet weak var amountHighPriorityCardStackView: UIStackView!

    static var storyboardID: String {
               return "CardsPriorityController"
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        ///Adding 7 Cards
        ///cardsData is the property of Model class(CardsPriorityData), we will assign values with help of cardsData
        var cardsData = CardsPriorityData()
        ///In 7 cards, we have three different types of button title(cta1, cta2 and cta3) used more than once
        ///singleCTAType1array/cta1 is used in cmStackview, cmmcStackView and cmmsStackView
        ///twoCTAarray/cta1 is used in cmmcStackView
        ///singleCTAType2array/cta2 is used in cmmspStackView and capStackView
        ///singleCTAType3array/cta3 is used in cmmshpStackView and cahpStackView
        guard let quickAccessimage = UIImage(named: "quickAccessPicture") else {
            return
        }
        let cta1 = (image:quickAccessimage, title:"SECONDARY CTA")
        let cta2 = (image:quickAccessimage, title:"PRIORITY CTA")
        let cta3 = (image:quickAccessimage, title:"HIGH PRIORITY CTA")
        let singleCTAType1array = [cta1]
        let singleCTAType2array = [cta2]
        let singleCTAType3array = [cta3]
        let twoCTAarray = [cta1, cta1]

        ///Creating Content/Message Card
        cardsData.prepareHeaderSectionWith(titleLine1: "Source/Subheadline",
                                        titleLine2: "SOURCE/FOOTNOTE",
                                        titleLine3Left: "SOURCE/FOOTNOTE",
                                        titleLine3Right: "SOURCE/FOOTNOTE")
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Title 2", titleLine2: "Message/Footnote")
        _ = cardsData.prepareCTASection(callToActionData: singleCTAType1array)
        let cmcCard = CardsPriorityBuilder.create(data: cardsData, type: .contentMessageCard, withAnimation: true)
        cmcCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        contentMessageCardStackView.addArrangedSubview(cmcCard)

        ///Creating Content/Message/Multi-CTA Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Title 2", titleLine2: "Message/Footnote")
        _ = cardsData.prepareCTASection(callToActionData: twoCTAarray)
        let cmmcCard = CardsPriorityBuilder.create(data: cardsData, type: .multiCTACard, withAnimation: false)
        cmmcCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        cmmcCard.addTargetToCallToActionSectionCTA2(with: #selector(onButtonHandler), controller: self)
        multiCTACardStackView.addArrangedSubview(cmmcCard)

        ///Creating Content/Message/Multi-Source Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Title 2", titleLine2: "Message/Footnote")
        _ =  cardsData.prepareCTASection(callToActionData: singleCTAType1array)
        let cmmsCard = CardsPriorityBuilder.create(data: cardsData, type: .multiSourceCard, withAnimation: false)
        cmmsCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        multiSourceCardStackView.addArrangedSubview(cmmsCard)

        ///Creating Content/Message/Multi-Source-Priority Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Large Title", titleLine2: "Message/Subheadline")
        _ = cardsData.prepareCTASection(callToActionData: singleCTAType2array)
        let cmmspCard = CardsPriorityBuilder.create(data: cardsData,
                                              type: .multiSourcePriorityCard,
                                              withAnimation: true)
        cmmspCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        multiSourcePriorityCardStackView.addArrangedSubview(cmmspCard)

        ///Creating Content/Message/Multi-Source-High-Priority Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Large Title", titleLine2: "Message/Subheadline")
        _ = cardsData.prepareCTASection(callToActionData: singleCTAType3array)
        let cmmshpCard = CardsPriorityBuilder.create(data: cardsData,
                                               type: .multiSourceHighPriorityCard,
                                               withAnimation: false)
        cmmshpCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        multiSourceHighPriorityCardStackView.addArrangedSubview(cmmshpCard)

        ///Creating Content-Amount-Priority Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Large Title", titleLine2: "Message/Subheadline")
        _ = cardsData.prepareCTASection(callToActionData: singleCTAType2array)
        let capCard = CardsPriorityBuilder.create(data: cardsData, type: .amountPriorityCard, withAnimation: false)
        capCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        amountPriorityCardStackView.addArrangedSubview(capCard)

        ///Creating Content-Amount-High-Priority Card
        cardsData.prepareContentSectionWith(titleLine1: "Lens/Large Title", titleLine2: "Message/Subheadline")
        _ = cardsData.prepareCTASection(callToActionData: singleCTAType3array)
        let cahpCard = CardsPriorityBuilder.create(data: cardsData, type: .amountHighPriorityCard, withAnimation: false)
        cahpCard.addTargetToCallToActionSectionCTA1(with: #selector(onButtonHandler), controller: self)
        amountHighPriorityCardStackView.addArrangedSubview(cahpCard)

        let height = mainStackView.frame.size.height + 270
        cardsScrollView.contentSize = CGSize(width: 0, height: height)
    }

    // MARK: - Perform action when click on Button
    @objc func onButtonHandler() {
        let alert = UIAlertController(title: "Alert",
                                      message: "This is CTA button click event.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            default:
                break
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}
