//
//  TileBuilder.swift
//  ASUIKit

import Foundation

//The class that builds the various types of tiles
final class TileBuilder: TileBuilderProtocol {
    /// To create a tile as button
    /// - Parameters:
    ///   - tileData: Dynamic data from model ASTileData
    ///   - type: Type of the tile
    func createTileButton(with tileData: TileData, type: TileType) -> TileButtonProtocol {
      return createAndConfigTileButton(with: tileData, type: type)
    }
    /// To create a tile as view
    /// - Parameters:
    ///   - tileData: Dynamic data from model ASTileData
    ///   - type: Type of the tile
    func createTileView(with tileData: TileData, type: TileType) -> TileViewProtocol {
        return createAndConfigTile(with: tileData, type: type)
    }
    func createTileView(with tileData: TileData, type: TileType, onClick: @escaping OnTileClick) -> TileViewProtocol {
        let tile = createAndConfigTile(with: tileData, type: type)
        tile.setTileActionCallback(onClick)
        return tile
    }
}
//All the private functions would go here
extension TileBuilder {
    /// To create tile as a view
    /// - Parameters:
    ///   - data: Dynamic data from model ASTileData
    ///   - type: Type of the tile
    private func createAndConfigTile(with data: TileData, type: TileType) -> TileAsView {
        switch type {
        case .quickAccess:
            return getQuickAccessTile(with: data)
        case .agent:
            return getAgentTile(with: data)
        case .idCard:
            return getIdCardTile(with: data)
        case .promo:
          return TileAsView()
      }
    }
    /// To create tile as a button
    /// - Parameters:
    ///   - data: Dynamic data from model ASTileData
    ///   - type: Type of the tile
    private func createAndConfigTileButton(with data: TileData, type: TileType) -> TileButtonProtocol {
        switch type {
        case .quickAccess:
            return getQuickAccessTileButton(with: data)
        case .agent:
            return getAgentTileButton(with: data)
        case .idCard:
            return getIdCardTileButton(with: data)
        case .promo:
            return getPromoTileButton(with: data)
      }
    }
    //Currently the the different tiles have been created out of same class "TileAsView"
    //This is becuase the UI is simple and could be adjusted slightly to get three variations
    //In case the tile layouts are completely different we can maintain different View classes
    //(along with respective NIB files) to keep it simple.
    /// Returns Quick Access Tile as view
    /// - Parameter data: Type of the tile
    private func getQuickAccessTile(with data: TileData) -> TileAsView {
        let quickAccessTile = TileAsView()
        quickAccessTile.configureQuickAccess(with: data)
        return quickAccessTile
    }
    /// Returns Agent Tile as view
    /// - Parameter data: Type of the tile
    private func getAgentTile(with data: TileData) -> TileAsView {
        let agentTile = TileAsView()
        agentTile.configureAgentTile(with: data)
        return agentTile
    }
    /// Returns ID Card Tile as view
    /// - Parameter data: Type of the tile
    private func getIdCardTile(with data: TileData) -> TileAsView {
        let idCardTile = TileAsView()
        idCardTile.configureIdCardTile(with: data)
        return idCardTile
    }
    /// Returns Quick Access Tile as button
    /// - Parameter data: Type of the tile
    private func getQuickAccessTileButton(with data: TileData) -> TileButtonProtocol {
        let quickAccessTile = TileAsButton()
        quickAccessTile.configureQuickAccessTile(with: data)
        return quickAccessTile
    }
    /// Returns Agent Tile
    /// - Parameter data: Type of the tile as button
    private func getAgentTileButton(with data: TileData) -> TileButtonProtocol {
        let agentTile = TileAsButton()
        agentTile.configureAgentTile(with: data)
        return agentTile
    }
    /// Returns ID Card Tile
    /// - Parameter data: Type of the tile as button
    private func getIdCardTileButton(with data: TileData) -> TileButtonProtocol {
        let idCardTile = TileAsButton()
        idCardTile.configureIdCardTile(with: data)
        return idCardTile
    }
    /// Returns Promo Tile as button
    /// - Parameter data: Type of the tile
    private func getPromoTileButton(with data: TileData) -> TileButtonProtocol {
      let promoTile = PromoTileAsButton()
        promoTile.configurePromoTile(with: data)
        return promoTile
    }
}
