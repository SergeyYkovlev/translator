//
//  Copyright © 2020 BitCom Solution. All rights reserved.
//

import Foundation

protocol AppEndpoint: Endpoint {

    var authorizationRequired: Bool { get }
}

extension Endpoint {

    var baseURL: URL {
        if !AppConfiguration.isRelease.value {
            return AppConfiguration.serverURL.value.appendingPathComponent("random_value")
        }
        return AppConfiguration.serverURL.value
    }
}
