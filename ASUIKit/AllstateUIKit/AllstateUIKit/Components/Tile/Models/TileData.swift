//
//  TileData.swift
//  ASUIKit

import Foundation

//The Tile Data Model is constructed based on the elements required to construct the tiles defined
//in the current requirement. If layout changes this needs to revisted. Eg. if we have multiples images in a tile.
public struct TileData {

    var tileUniqueId: String
    var tileImage: UIImage?
    var tileMessages: [String?]
    var badgeCount: Int?

    public init(tileID: String? = nil, image: UIImage? = nil, messages: [String?], badgeCount: Int? = nil) {
        self.tileUniqueId = tileID ?? ""
        self.tileImage = image
        self.tileMessages = messages
        self.badgeCount = badgeCount
    }
}
