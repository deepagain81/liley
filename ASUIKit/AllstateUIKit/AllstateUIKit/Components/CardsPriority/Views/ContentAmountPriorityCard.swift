//
//  ContentAmountPriorityCard.swift
//  AllstateUIKit

import Foundation

public class ContentAmountPriorityCard: ContentMessageCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentAmountPriorityCard(data: data)
    }
}
