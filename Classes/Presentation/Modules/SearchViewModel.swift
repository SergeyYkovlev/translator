//
//  SearchViewModel.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation
import CollectionViewTools

class SearchViewModel {

    let words: [Word]
    let listSectionItems: [GeneralCollectionViewDiffSectionItem]

    init(state: SearchState, listItemsFactory: SearchListItemsFactory, output: SearchViewOutput) {
        words = state.words
        listSectionItems = listItemsFactory.makeSectionItems(state: state, output: output)
    }
}
