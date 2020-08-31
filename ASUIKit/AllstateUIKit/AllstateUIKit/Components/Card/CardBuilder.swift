//
//  CardBuilder.swift
//  ASUIKit

import Foundation

///The class that builds the various types of cards
class CardBuilder: CardBuilderProtocol {

    /// Method to create card
    /// - Parameters:
    ///   - cardData: cardData
    ///   - type: cardType
    func create(with cardData: CardData, type: CardType) -> CardView {
        switch type {
        case .actionCard:
                return getMosaicActionCard(with: cardData, type: type)
        case .mosaicCard:
                return getMosaicActionCard(with: cardData, type: type)
        case .promoCard:
                return getPromoCard(with: cardData, type: type)
        default:
                return getCard(with: cardData)
        }
    }

}

///Private functions would contain the actual view creation as shown.
extension CardBuilder {

    private func getCard(with data: CardData ) -> CardBaseView {
        //Update this function to create card based on the card type, when required.
        let cardView = CardBaseView.getView()
        cardView.config(data)
        return cardView
    }
    private func getMosaicActionCard(with data: CardData, type: CardType) -> CardMosaicActionView {
        //Update this function to create card based on the card type, when required.
        let cardView = CardMosaicActionView()
        cardView.setCardType(type: type)
        cardView.config(data)
        return cardView
    }
    private func getPromoCard(with data: CardData, type: CardType) -> CardPromoView {
        //Update this function to create card based on the card type, when required.
        let cardView = CardPromoView()
        cardView.setCardType(type: type)
        cardView.config(data)
        return cardView
    }
}
