//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

public enum GeneralRequestError: Error {
    case noInternetConnection
    case addProduct
    case somethingWrong

    var title: String {
        switch self {
        case .noInternetConnection:
            return "L10n.Error.Connection.title"
        case .addProduct:
            return "L10n.Error.Product.title"
        case .somethingWrong:
            return "L10n.Error.SomethingWrong.title"
        }
    }

    var description: String {
        switch self {
        case .noInternetConnection:
            return "L10n.Error.Connection.title"
        case .addProduct:
            return "L10n.Error.Product.description"
        case .somethingWrong:
            return "L10n.Error.SomethingWrong.description"
        }
    }
}
