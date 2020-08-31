//
//  BottomSheetBuilder.swift
//  AllstateUIKit

import Foundation

final class SheetBuilder: SheetBuilderProtocol {
    static var sheetVC: SheetViewController?
    func create(with presenter: UIViewController) -> UIViewController {
        return createSheet(with: presenter)
    }
    func setState(state: SheetState) {
        return stateChange(state: state)
    }
}

fileprivate extension SheetBuilder {
    func stateChange(state: SheetState) {
        SheetBuilder.sheetVC?.isStateChanged = state
    }
    func createSheet(with presenter: UIViewController) -> UIViewController {
        SheetBuilder.sheetVC = SheetViewController.getNib()
        SheetBuilder.sheetVC?.setPresenter(with: presenter)
        SheetBuilder.sheetVC?.setUpSheet()
        return SheetBuilder.sheetVC ?? SheetViewController()
    }
}
