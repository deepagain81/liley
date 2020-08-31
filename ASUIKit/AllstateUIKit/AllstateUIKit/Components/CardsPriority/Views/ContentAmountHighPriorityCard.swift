//
//  ContentAmountHighPriorityCard.swift
//  AllstateUIKit

import UIKit

public class ContentAmountHighPriorityCard: ContentAmountPriorityCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentAmountHighPriorityCard(data: data)
    }
}
