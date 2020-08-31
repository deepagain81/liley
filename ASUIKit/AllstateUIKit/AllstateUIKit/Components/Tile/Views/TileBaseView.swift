//
//  TileBaseView.swift
//  ASUIKit

import Foundation

//P.S: Sample of creating base class when we can commom base as required. This not the final implemenation.

class TileBaseView: ASThemeableView, XibViewGettable, TileViewProtocol {

    func setTileActionCallback(_ onClick: @escaping OnTileClick) {}

    func setTileDelegate(as delegate: TileDelegate) {}

    func updateTileColor(with color: UIColor) {}

    func changeTileType(to type: TileType) {}

    func reloadTile(with data: TileData) {}

}
