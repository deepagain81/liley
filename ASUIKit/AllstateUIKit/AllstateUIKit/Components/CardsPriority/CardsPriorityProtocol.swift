//
//  CardsPriorityProtocol.swift
//  AllstateUIKit

import Foundation

/// Type of Cards, based on which the CardsPriority layout and style would be configured.
/// 1. cmc -> Content/Message card,
/// 2. cmmc -> Content/Message/Multi-CTA,
/// 3. Content/Message/Multi-Source,
/// 4. cmmsp -> Content/Message/Multi-Source-Priority,
/// 5. Content/Message/Multi-Source-High-Priority,
/// 6. Content/Amount-Priority and
/// 7. Content/Amount-High-Priority
public enum CardsPriorityType: String {
    case contentMessageCard
    case multiCTACard
    case multiSourceCard
    case multiSourcePriorityCard
    case multiSourceHighPriorityCard
    case amountPriorityCard
    case amountHighPriorityCard
}

/// External entries of the framework will not have direct access to the component builder
public protocol CardsPriorityBuilderProtocol {
    static func create(data: CardsPriorityData, type: CardsPriorityType, withAnimation: Bool) -> CardsPriority
}
