//
//  MainListItemsFactory.swift
//  translator
//
//  Created by Сергей Яковлев on 11.03.2022.
//

import Foundation
import CollectionViewTools
import UIKit

final class SearchListItemsFactory {

    weak var viewController: SearchViewController?
    weak var output: SearchViewOutput?

    func makeSectionItems(state: SearchState, output: SearchViewOutput) -> [GeneralCollectionViewDiffSectionItem] {

        var sectionItems: [GeneralCollectionViewDiffSectionItem] = []

        sectionItems = state.words.map { word -> GeneralCollectionViewDiffSectionItem in
            let sectionItem = GeneralCollectionViewDiffSectionItem()

            sectionItem.minimumLineSpacing = 12
            sectionItem.insets = .init(top: 24, left: 16, bottom: 24, right: 16)

            guard let meanings = word.meanings else {
                return sectionItem
            }

            sectionItem.reusableViewItems = [SearchHeaderItem(word: word)]

            sectionItem.cellItems = meanings.compactMap { meaning -> SearchCollectionViewCellItem? in
                guard let translation = meaning.translation?.text, let imageUrl = meaning.imageUrl else {
                    return nil
                }

                let cellItem = SearchCollectionViewCellItem(translation: translation)
                cellItem.diffIdentifier = UUID().uuidString
                cellItem.itemDidSelectHandler = { [weak output] _ in
                    output?.selectCell(text: word.text!, translation: translation, image: imageUrl)
                }
                return cellItem
            }
            sectionItem.minimumLineSpacing = 10
            return sectionItem
        }
        return sectionItems
    }
}
