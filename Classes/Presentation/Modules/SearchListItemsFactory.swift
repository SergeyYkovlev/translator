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
        let sectionItem = GeneralCollectionViewDiffSectionItem()

        guard let meanings = state.words.first?.meanings else {
            return [sectionItem]
        }

        sectionItem.cellItems = meanings.compactMap { meaning -> SearchCollectionViewCellItem? in
            guard let translation = meaning.translation?.text else {
                return nil
            }
            let cellItem = SearchCollectionViewCellItem(translation: translation)
            cellItem.diffIdentifier = UUID().uuidString
            cellItem.itemDidSelectHandler = { [weak output] _ in
                output?.openTranslationViewController()
            }
            return cellItem
        }
        sectionItem.minimumLineSpacing = 10
        return [sectionItem]
    }
}
