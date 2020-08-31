//
//  ContentMessageMultiSourceCard.swift
//  AllstateUIKit

import UIKit

public class ContentMessageMultiSourceCard: ContentMessageCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentMessageMultiSourceCard(data: data)
    }
}
