//
//  ContentMessageMultipleCTACard.swift
//  AllstateUIKit

import UIKit

public class ContentMessageMultiCTACard: ContentMessageCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentMessageMultiCTACard(data: data)
    }
}
