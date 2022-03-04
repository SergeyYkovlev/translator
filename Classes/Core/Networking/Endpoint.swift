//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

public protocol Endpoint {

    var baseURL: URL { get }
    var path: String { get }
    var method: Method { get }
    var headers: [Header] { get }
    var parameters: [String: String] { get }
    var parameterEncoding: ParameterEncoding { get }
    var parametersData: Data? { get }
}

public extension Endpoint {

    var method: Method {
        .get
    }

    var headers: [Header] {
        Header.default
    }

    var parameters: [String: String] {
        [:]
    }

    var parameterEncoding: ParameterEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }

    var parametersData: Data? {
        return nil
    }
}

public extension Endpoint where Self: RawRepresentable, Self.RawValue == String {

    var path: String {
        rawValue
    }
}
