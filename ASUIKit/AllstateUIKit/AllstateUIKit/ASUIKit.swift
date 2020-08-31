//
//  ASUIKit.swift
//  ASUIKit

import Foundation

//The main interface for the reusable componets by in the ASUIKit framework
//This would have component access points only

//Access Tile component
public var tileBuilder: TileBuilderProtocol {
    return TileBuilder()
}

//Access Card component
public var cardBuilder: CardBuilderProtocol {
    return CardBuilder()
}

//Access Floating Row component
public var floatingRowBuilder: FloatingRowBuilderProtocol {
    return FloatingRowBuilder()
}

//Access Navigation Header component
public var navigationBuilder: NavigationHeaderBuilderProtocol {
    return NavigationHeaderBuilder()
}

//Access Sheet component
public var sheetBuilder: SheetBuilderProtocol {
    return SheetBuilder()
}

//Access Status component
public var statusBuilder: StatusBuilderProtocol {
    return StatusBuilder()
}
//TO DO:  Interface to be added, for new component, as required.
