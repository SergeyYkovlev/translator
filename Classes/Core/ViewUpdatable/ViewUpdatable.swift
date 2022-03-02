//
//  ViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation

public protocol ViewUpdate {

    // swiftlint:disable:next function_parameter_count
    func update<T, U: Equatable>(new newViewModel: T,
                                 old oldViewModel: T,
                                 keyPath: KeyPath<T, U>,
                                 force: Bool,
                                 configurationBlock: (U) -> Void)
}

public extension ViewUpdate {

    // swiftlint:disable:next function_parameter_count
    func update<T, U: Equatable>(new newViewModel: T,
                                 old oldViewModel: T,
                                 keyPath: KeyPath<T, U>,
                                 force: Bool,
                                 configurationBlock: (U) -> Void) {
        let newValue = newViewModel[keyPath: keyPath]
        if force {
            configurationBlock(newValue)
        }
        else if oldViewModel[keyPath: keyPath] != newValue {
            configurationBlock(newValue)
        }
    }
}
