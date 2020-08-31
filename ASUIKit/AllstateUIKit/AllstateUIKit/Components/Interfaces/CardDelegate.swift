//
//  CardInterface.swift
//  ASUIKit

import Foundation
import UIKit

///Protocol that defines the framework's CardView.
///The functions to be exposed to public user by the card view.
///These are the functions which the framework's consumer would get to work on the Card View
///As well a way to set observer for the action callbacks on the CardView
public protocol CardView where Self: UIView {
    /// Method to set card delegate
    func setCardDelegate(as delegate: CardDelegateProtocol)
    /// Method to update card priority
    func updatePriority(with priority: Priority)
    /// Method to refresh  card datd
    func reloadCard(with data: CardData)

}

///This protocol represents the actions or callbacks from the Card View to the consumer.
public protocol CardDelegateProtocol: class {
    /// Method for left CTA button action
    /// - Parameter cardID: cardID string
    func onLeftCTAPress(cardID: String)
    /// Method for right CTA button action
    /// - Parameter cardID: cardID string
    func onRightCTAPress(cardID: String)
    /// Method for Mosaic card top section action
    func didPressMosaicHeaderSection()

}
