//
//  SearchService.swift
//  translator
//
//  Created by Сергей Яковлев on 03.03.2022.
//

import Foundation

protocol HasSearchService {

    var searchService: SearchService { get }
}

protocol SearchService: AnyObject {
//    func filesUrl(for scope: String) -> URL
}
