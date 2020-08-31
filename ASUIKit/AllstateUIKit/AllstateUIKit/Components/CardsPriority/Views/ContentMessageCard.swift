//
//  ContentMessageCard.swift
//  AllstateUIKit

import UIKit

public class ContentMessageCard: CardsPriority {
    override public func prepareCardUI(data: CardsPriorityData) {
        super.prepareCardUI(data: data)
        contentMessageCard(data: data)
    }
}
