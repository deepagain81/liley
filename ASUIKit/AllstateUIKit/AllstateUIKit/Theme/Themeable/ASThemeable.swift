//
//  ASThemeable.swift
//  ASUIKit

import Foundation

public protocol ASThemeable where Self: AnyObject {

    //In themable components this to be called when view is created.
    func onViewDidLoad()

    //To update with new theme, if required, after the view is loaded
    //This function would either be called on view refresh as required
    //or
    //This view could be subscribed to current theme to notify theme change
    //This could be implemented when there are multiple theme in the application.
    func applyCurrentTheme()
}
