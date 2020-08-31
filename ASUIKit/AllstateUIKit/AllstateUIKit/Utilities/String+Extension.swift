//
//  String+Extension.swift
//  AllstateUIKit
//

import Foundation
extension String {
    public func localized(in bundle: Bundle = Bundle.main) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
