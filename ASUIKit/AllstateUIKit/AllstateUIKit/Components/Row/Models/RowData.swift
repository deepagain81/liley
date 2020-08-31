//
//  ASRowData.swift
//  AllstateUIKit

import Foundation

//The Row Data Model is constructed based on the elements required to construct the rows defined
//in the current requirement. If layout changes this needs to revisted.
public struct RowData {

    var rowUniqueId: String
    var leftIcon: UIImage?
    var title: String?
    var subtitle: String?
    var detailSubtitle: String?
    var rightIcon: UIImage?
    var iconImageForAlertInfo: UIImage?
    var subheadlineTopLabelTitle: String?
    var footNoteViewLabelTitle: String?
    var informationalAndHiPriNoteLabelTitle: String?
    var subheadlineBottomLabelTitle: String?
    var disclosureImageView: UIImage?
    var allStateIconImage: UIImage?
    var agentImageView: UIImage?

    public init(rowTag: String? = nil,
                title: String? = nil,
                subtitle: String? = nil, detailSubtitle: String? = nil, leftIcon: UIImage? = nil,
                rightIcon: UIImage? = nil) {
        self.rowUniqueId = rowTag ?? ""
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.title = title ?? ""
        self.subtitle = subtitle ?? ""
        self.detailSubtitle = detailSubtitle ?? ""
    }
    public init(subheadlineTopLabelTitle: String? = nil,
                footNoteViewLabelTitle: String? = nil,
                informationalAndHiPriNoteLabelTitle: String? = nil,
                subheadlineBottomLabelTitle: String? = nil, iconImageForAlertInfo: UIImage? = nil,
                disclosureImageView: UIImage? = nil,
                allStateIconImage: UIImage? = nil,
                rowTag: String? = nil) {
        self.subheadlineTopLabelTitle = subheadlineTopLabelTitle ?? ""
        self.footNoteViewLabelTitle = footNoteViewLabelTitle ?? ""
        self.informationalAndHiPriNoteLabelTitle = informationalAndHiPriNoteLabelTitle ?? ""
        self.subheadlineBottomLabelTitle = subheadlineBottomLabelTitle ?? ""
        self.iconImageForAlertInfo = iconImageForAlertInfo
        self.disclosureImageView = disclosureImageView
        self.allStateIconImage = allStateIconImage
        self.rowUniqueId = rowTag ?? ""
        self.leftIcon = nil
        self.rightIcon = nil
        self.title = ""
        self.subtitle = ""
    }

    public init(rowTag: String? = nil,
                title: String? = nil,
                subtitle: String? = nil,
                agentImage: UIImage? = nil,
                disclosureImage: UIImage? = nil) {
        self.rowUniqueId = rowTag ?? ""
        self.title = title ?? ""
        self.subtitle = subtitle ?? ""
        self.agentImageView = agentImage
        self.disclosureImageView = disclosureImage
    }
}
