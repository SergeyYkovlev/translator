//
//  ViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

protocol AppEndpoint: Endpoint {

    var authorizationRequired: Bool { get }
}

extension Endpoint {

    var baseURL: URL {
        return URL(string: "https://dictionary.skyeng.ru/api/public/v1")!
    }
}
