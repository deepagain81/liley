//
//  ContentMessageMultiSourcePriorityCard.swift
//  AllstateUIKit

import UIKit

public class ContentMessageMultiSourcePriorityCard: ContentMessageCard {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentMessageMultiSourcePriorityCard(data: data)
    }
}
