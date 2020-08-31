//
//  BottomSheetBuilderProtocol.swift
//  AllstateUIKit

import Foundation

///All states of the Bottom Sheet.
public enum SheetState {
    case expanded
    case intermediate
    case collapsed
}

public protocol SheetBuilderProtocol {
    func create(with presenter: UIViewController) -> UIViewController
    func setState(state: SheetState)
}
