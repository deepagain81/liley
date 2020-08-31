//
//  ASKitProtocols.swift
//  ASUIKit

import Foundation
import UIKit

//This defines the functions provided by the tile view
//These are the functions which the framework's consumer would get to work on the Tile View
//As well a way to set observer for the action callbacks on the CardView
//Shall we call it "TileableView" instead of TileViewProtocol? Makes any sense?
public protocol TileViewProtocol where Self: UIView {

    //Register as tile delegate only if intereseted in tapping in to the user action on tile
    //or some callsbacks from the TileView
    func setTileDelegate(as delegate: TileDelegate)

    func updateTileColor(with color: UIColor)

    func reloadTile(with data: TileData)
    
    func addBadgeOnTile(with data: TileData)

    func updateBadge(_ badgeCount: Int)
}

public protocol TileButtonProtocol where Self: UIButton {
}

//This protocol represents the actions or callbacks from the Tile View to the consumer.
public protocol TileDelegate: class {

    func onTilePress(tileID: String)

}

public extension TileViewProtocol {
    func addBadgeOnTile(with data: TileData) {}
    func updateBadge(_ badgeCount: Int) {}
}
