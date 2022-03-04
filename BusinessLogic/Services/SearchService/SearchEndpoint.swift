//
//  SearchEndpoint.swift
//  translator
//
//  Created by Сергей Яковлев on 04.03.2022.
//

import Foundation

enum SerachEndpoint {
    case searchWord(_ word: String)
}

extension SerachEndpoint: AppEndpoint {
    var baseURL: URL {
        return URL(fileURLWithPath: "https://dictionary.skyeng.ru/api/public/v1")
    }

    var path: String {
        switch self {
        case .searchWord:
            return "words/search"
        }
    }

    var method: Method {
        return .get
    }

    var authorizationRequired: Bool {
        return false
    }

    var parameters: [String: String] {
        switch self {
        case .searchWord(let word):
            return ["search": word]
        }
    }

    var parametersData: Data? {
        return nil
    }

    var parameterEncoding: ParameterEncoding {
        return .data
    }
}
