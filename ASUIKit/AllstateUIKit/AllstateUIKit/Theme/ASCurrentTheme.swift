//
//  ASCurrentTheme.swift
//  ASUIKit

import Foundation

//PS: Do not update this class unless an informed decision is made.

//Defines the deferent flavours of the Theme for the application.
//For now only one theme. This needs to be updated if have more theme in the app.
public enum ASThemeType: String {
    case regular
}

//This class will manage the current theme
public final class ASCurrentTheme {

    static let shared = ASCurrentTheme()

    private(set) var currentTheme: ASThemeProtocol?

    private init() {}

    //Use this function will return the current theme.
    //For now there would be only one theme, i.e Regular.
    func getCurrent() -> ASThemeProtocol {
        if let theme = currentTheme {
            return theme
        } else {
            configure(with: createTheme(for: ASThemeType.regular))
            return getCurrent()
        }
    }

    //Use this function to configure theme
    func configure(with theme: ASThemeProtocol) {
        self.currentTheme = theme
    }

    //This function creates theme based on the define type.
    //Update this function when application is expected to render multiple themes.
    func createTheme(for type: ASThemeType) -> ASThemeProtocol {
        switch type {
        case .regular:
            return ASThemeRegular()
        }
    }
}
