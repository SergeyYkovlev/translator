//
//  SearchServiceImpl.swift
//  translator
//
//  Created by Сергей Яковлев on 04.03.2022.
//

import Foundation

final class SearchServiceImpl: AppRequestService, SearchService {
    func fetchWords(query: String, success: (([Word]) -> Void)?, failure: (() -> Void)?) {
        request(SerachEndpoint.searchWord(query), success: { (words: [Word]) in
            DispatchQueue.main.async {
                success?(words)
            }
        }, failure: nil)
    }
}
