//
//  CardBuilderProtocol.swift
//  ASUIKit

import Foundation

///Card Type would determine the card style, such as rows number, row with currency Symbols etc
public enum CardType: String {
    case messageCard
    case messageMultiSourceCard
    case amountCard
    case actionCard
    case mosaicCard
    case promoCard
}

///Card priority types, which can be used to define the color application on the card
public enum Priority {
    case none, low, high
}

public typealias OnCardLeftButtonTap = (_ cardID: String) -> Void
public typealias OnCardRightButtonTap = (_ cardID: String) -> Void
public typealias OnCardTopViewClick = (_ cardID: String) -> Void
///Protocol to guide the class which would build the cards.
///Here we can define functions which are required by the framework's consumer for constructing the card
///External enties of the framework will not have direct access to the component builder.
///CardBuilderProtocol would define the builder class capability
public protocol CardBuilderProtocol {
    /// Card without any callback action. Here to get notified on CTA event
    /// Set the card action delegate for CardView
    /// - Parameters:
    ///   - cardData: cardData
    ///   - type: cardType
    func create(with cardData: CardData, type: CardType) -> CardView
}
