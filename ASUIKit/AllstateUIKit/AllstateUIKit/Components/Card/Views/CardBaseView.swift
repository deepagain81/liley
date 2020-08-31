//
//  CardView.swift
//  ASUIKit

import Foundation

//P.S: The card implementation is just for Demo !

//The Card View on the ground
final class CardBaseView: ASThemeableView, XibViewGettable {

    @IBOutlet private weak var priorityView: UIView!

    private var CTA1ActionCompletion: OnCardLeftButtonTap?
    private var CTA2ActionCompletion: OnCardRightButtonTap?
    private weak var delegate: CardDelegateProtocol?

    override func onViewDidLoad() {

    }

    //Configure the Card view with provided configuration
    func config(_ data: CardData) {

        //Setup the top section
        if let topData = data.topSection {
            self.configFirstSection(topSectionData: topData)

        }

        //Setup the middle section
        if let middleData = data.middleSection {
            self.configSecondSection(middleSectionData: middleData)

        }

        //Setup the CTA section
        if let ctaData = data.callToActionSection {
            self.configCTASection(CTASectionDta: ctaData)
        }
    }

    @IBAction func ctaAction1(_ sender: Any) {
        delegate?.onLeftCTAPress(cardID: "CTA1")
        if let completionBlock = CTA1ActionCompletion {
            completionBlock("CTA1")
        }
    }

    @IBAction func ctaAction2(_ sender: Any) {
        delegate?.onRightCTAPress(cardID: "CTA2")
        if let completionBlock = CTA2ActionCompletion {
            completionBlock("CTA1")
        }
    }
}

//CardView needs to adhere to CardViewProtocol to provide the user facing functions on card view
extension CardBaseView: CardView {

    //Sets the action callback for CTA item1 in CTA group
    func setCTA1ActionCallback(_ action: @escaping OnCardLeftButtonTap) {
        self.CTA1ActionCompletion = action
    }

    //Sets the action callback for CTA item2 in CTA group
    func setCTA2ActionCallback(_ action: @escaping OnCardRightButtonTap) {
        self.CTA2ActionCompletion = action
    }

    //Sets the card delegate
    func setCardDelegate(as delegate: CardDelegateProtocol) {
        self.delegate = delegate
    }

    //Changes the card priority
    func updatePriority(with priority: Priority) {
        switch priority {
        case .none:
            priorityView.backgroundColor = .white
        case .high:
            priorityView.backgroundColor = .red
        case .low:
            priorityView.backgroundColor = .yellow
        }
    }

    //Can be used to reconfig the card with new set of config
    func reloadCard(with data: CardData) {

    }

}

//Private functions
extension CardBaseView {

    fileprivate func configFirstSection(topSectionData: ContentCardTopSection) {
        //TBD: Could be loaded from seperate NIB or single NIB with all three section
    }

    fileprivate func configSecondSection(middleSectionData: ContentCardMiddleSection) {
        //TBD: Could be loaded from seperate NIB or single NIB with all three section
    }

    fileprivate func configCTASection(CTASectionDta: CTASection) {
        //TBD: Could be loaded from seperate NIB or single NIB with all three section
    }

}
