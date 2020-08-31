//
//  ContentMessageMultiSourceHighPriorityCard.swift
//  AllstateUIKit

import UIKit

public class ContentMessageMultiSourceHighPriorityCard: ContentMessageMultiSourcePriorityCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentMessageMultiSourceHighPriorityCard(data: data)
    }
}
