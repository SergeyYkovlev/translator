//
//  SearchViewModel.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation

class SearchViewModel {
    let isBackgroundGreen: Bool
    
    init(state: SearchState) {
        isBackgroundGreen = state.isBackgroundGreen
    }
}
