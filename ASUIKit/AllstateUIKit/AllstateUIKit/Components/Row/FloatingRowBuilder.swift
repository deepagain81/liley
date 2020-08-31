//
//  FloatingRowBuilder.swift
//  ASUIKit

import Foundation

/// FloatingRowBuilder implements the FloatingRowBuilderProtocol methods for row creation with variation.
class FloatingRowBuilder: FloatingRowBuilderProtocol {
    /// Create method with row click event.
    /// - Parameters:
    ///   - rowData: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    ///   - onClick: This closure is used to provide row clicked event.
    func create(with rowData: RowData, type: RowType, onClick: OnRowClick?) -> RowView {
        let row: RowBaseView = createAndConfigRow(with: rowData, type: type)
        row.clickCompletion = onClick
        return row
    }
}

/// All private functions for configuring floating rows
extension FloatingRowBuilder {
    /// This method is used to create the floating row with the input data.
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func createAndConfigRow(with data: RowData, type: RowType) -> RowBaseView {
        switch type {
        case .defaultRow:
            return getDefaultRowIcon(with: data, type: type)
        case .defaultRowIcon:
            return getDefaultRowIcon(with: data, type: type)
        case .defaultVariationRow:
            return getDefaultVariationRowIcon(with: data, type: type)
        case .defaultVariationRowIcon:
            return getDefaultVariationRowIcon(with: data, type: type)
        case .defaultVariationRowImage:
            return getDefaultVariationRowImage(with: data, type: type)
        case .multiSource:
            return getMultiSource(with: data, type: type)
        case .informational:
            return getInformational(with: data, type: type)
        case .highPriority:
            return getHighPriority(with: data, type: type)
        case .idCard:
            return getIdCard(with: data, type: type)
        }
    }
    /// Function used to configure default row icon view.
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func getDefaultRowIcon(with data: RowData, type: RowType) -> RowBaseView {
        let defaultRow = RowAsView()
        defaultRow.configureDefaultRowIcon(with: data, rowType: type)
        return defaultRow
    }
    private func getDefaultVariationRowIcon(with data: RowData, type: RowType) -> RowBaseView {
        let defaultRow = RowVariationAsView()
        defaultRow.configureDefaultVariationRowIcon(with: data, rowType: type)
        return defaultRow
    }
    private func getDefaultVariationRowImage(with data: RowData, type: RowType) -> RowBaseView {
        let defaultRow = AgentFloatingRowView()
        defaultRow.configureDefaultVariationRowImage(with: data, rowType: type)
        return defaultRow
    }
    /// Create MultiSource Floating Row with ASRowData Model
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func getMultiSource(with data: RowData, type: RowType) -> FloatingRowView {
        let multiSourceRow = FloatingRowView()
        multiSourceRow.configure(data: data, floatingRowType: type)
        return multiSourceRow
    }
    /// Create Informational Floating Row with ASRowData Model
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func getInformational(with data: RowData, type: RowType) -> FloatingRowView {
        let informationalRow = FloatingRowView()
        informationalRow.configure(data: data, floatingRowType: type)
        return informationalRow
    }
    /// Create High Priority Floating Row with ASRowData Model
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func getHighPriority(with data: RowData, type: RowType) -> FloatingRowView {
        let highPriorityRow = FloatingRowView()
        highPriorityRow.configure(data: data, floatingRowType: type)
        return highPriorityRow
    }
    /// Create ID Card Floating Row with ASRowData Model
    /// - Parameters:
    ///   - data: This is a model used to provide initial data for row creation.
    ///   - type: This is a enum which defines the type of row that needs to be created.
    private func getIdCard(with data: RowData, type: RowType) -> FloatingRowView {
        let idCardRow = FloatingRowView()
        idCardRow.configure(data: data, floatingRowType: type)
        return idCardRow
    }
}
