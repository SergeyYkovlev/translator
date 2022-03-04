//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import UIKit

public struct Header: Equatable {

    public let key: String
    public let value: String
}

public extension Header {

    static let `default`: [Header] = [Header.dpi(scale: UIScreen.main.scale)]

    static func authorization(token: String) -> Header {
        .init(key: "Authorization", value: token)
    }

    static func contentType(type: String) -> Header {
        .init(key: "Content-Type", value: type)
    }

    static func userAgent(osVersion: String, appVersion: String) -> Header {
        .init(key: "User-Agent", value: "iOS \(osVersion) version \(appVersion)")
    }

    static func dpi(scale: CGFloat) -> Header {
        .init(key: "dpi", value: "@\(Int(scale))x")
    }

    static func clientId(id: String) -> Header {
        .init(key: "clientId", value: id)
    }
}
