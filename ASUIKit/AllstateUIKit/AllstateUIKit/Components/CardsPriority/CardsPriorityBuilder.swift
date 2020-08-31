//
//  CardsPriorityBuilder.swift
//  AllstateUIKit

import Foundation

/// The class that builds the various types of Cards
public final class CardsPriorityBuilder: CardsPriorityBuilderProtocol {
    static public func create(data: CardsPriorityData, type: CardsPriorityType, withAnimation: Bool) -> CardsPriority {
        return createAndConfigureCard(data: data, type: type, withAnimation: withAnimation)
    }
}

extension CardsPriorityBuilder {
    /// Private function will create the card
    /// - Parameters:
    ///   - data: Model class is called to add values to the Label/Buttons from the service
    ///   - type: Should select the required type of cards
    ///   - withAnimation: Added animation if required(for demo, I set it for 5 seconds)
    private static func createAndConfigureCard(data: CardsPriorityData,
                                               type: CardsPriorityType,
                                               withAnimation: Bool) -> CardsPriority {
        return makeCardView(data: data, type: type, withAnimation: withAnimation)
    }

    private static func makeCardView(data: CardsPriorityData,
                                     type: CardsPriorityType,
                                     withAnimation: Bool) -> CardsPriority {
        let priorityCard: CardsPriority!
        switch type {
        case .contentMessageCard:
            priorityCard = ContentMessageCard()
        case .multiCTACard:
            priorityCard = ContentMessageMultiCTACard()
        case .multiSourceCard:
            priorityCard = ContentMessageMultiSourceCard()
        case .multiSourcePriorityCard:
            priorityCard = ContentMessageMultiSourcePriorityCard()
        case .multiSourceHighPriorityCard:
            priorityCard = ContentMessageMultiSourceHighPriorityCard()
        case .amountPriorityCard:
            priorityCard = ContentAmountPriorityCard()
        case .amountHighPriorityCard:
            priorityCard = ContentAmountHighPriorityCard()
        }
        if withAnimation {
            priorityCard.addGradientColorForlazyLoad()
            priorityCard.startAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                DispatchQueue.main.async {
                    priorityCard.stopAnimation { (model) in
                        if let cardModel = model as? CardsPriority {
                        cardModel.prepareCardUI(data: data)
                        }
                    }
                }
            }
        } else {
            priorityCard.prepareCardUI(data: data)
        }
        return priorityCard
    }

}
