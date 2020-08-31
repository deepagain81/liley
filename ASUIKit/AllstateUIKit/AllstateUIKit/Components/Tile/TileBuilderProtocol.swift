//
//  TileBuilderProtocol.swift
//  ASUIKit

import Foundation

/// Types of the tile, based on which the tile layout and style would be configured
public enum TileType: String {
    case quickAccess
    case agent
    case idCard
    case promo
}

public typealias OnTileClick = (_ tileID: String) -> Void
//Protocol to guide the class which would build the tiles.
//Here we can define functions which are required by the framework's consumer for constructing tile
//External enties of the framework will not have direct access to the component builder.
public protocol TileBuilderProtocol {
    /// To create Tile as Button
    /// - Parameters:
    ///   - tileData: Dynamic data from the model ASTileData
    ///   - type: Type of the tile (Quick Access, Agent, Id Card, Promo)
    func createTileButton(with tileData: TileData, type: TileType) -> TileButtonProtocol
    /// To create Tile as view
    /// - Parameters:
    ///   - tileData: Dynamic data from the model ASTileData
    ///   - type: Type of the tile (Quick Access, Agent, Id Card, Promo)
    func createTileView(with tileData: TileData, type: TileType) -> TileViewProtocol
    //Style 2
    func createTileView(with tileData: TileData, type: TileType, onClick: @escaping OnTileClick) -> TileViewProtocol

}
