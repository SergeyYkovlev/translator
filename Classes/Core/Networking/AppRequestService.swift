//
//  Copyright © 2020 BitCom Solution. All rights reserved.
//

import Foundation

class AppRequestService: RequestService {

    override init(sessionTaskService: SessionTaskService = .init(),
                  requestFactory: RequestFactory = .init(),
                  decoder: JSONDecoder = .init()) {
        super.init(sessionTaskService: sessionTaskService, requestFactory: requestFactory, decoder: decoder)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
    }
}
