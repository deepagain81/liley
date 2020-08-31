//
//  NavigationHeaderData.swift
//  ASUIKit
//
//

import Foundation
///Configurating the navigation bar header with data.
public struct NavigationBarInfo {
    var featureSummary: String?
    var segmentTitles: [String]?
    var statusHeaderData: StatusHeaderData?
    var leftTile: TileData?
    var middleTile: TileData?
    var rightTile: TileData?
    var userName: String?

    public init(featureSummary: String) {
        self.featureSummary = featureSummary
    }

    public init(segmentTitles: [String], featureSummary: String) {
        self.segmentTitles = segmentTitles
        self.featureSummary = featureSummary
    }

    public init(segmentTitles: [String], statusHeaderData: StatusHeaderData) {
        self.segmentTitles = segmentTitles
        self.statusHeaderData = statusHeaderData
    }

    public init(leftTile: TileData, userName: String) {
        self.leftTile = leftTile
        self.userName = userName
    }

    public init(leftTile: TileData, middleTile: TileData, userName: String) {
        self.leftTile = leftTile
        self.middleTile = middleTile
        self.userName = userName
    }

    public init(leftTile: TileData, middleTile: TileData, rightTile: TileData, userName: String) {
        self.leftTile = leftTile
        self.middleTile = middleTile
        self.rightTile = rightTile
        self.userName = userName
    }
}
