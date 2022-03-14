//
//  SearchCollectionViewCellItem.swift
//  translator
//
//  Created by Сергей Яковлев on 11.03.2022.
//

import Foundation
import UIKit
import Framezilla
import CollectionViewTools

class SearchCollectionViewCellItem: CollectionViewDiffCellItem {

    private typealias Cell = SearchCollectionViewCell

    let diffIdentifier: String

    let reuseType: ReuseType = .class(Cell.self)

    private var translation: String

    init(translation: String) {
        self.translation = translation
        diffIdentifier = UUID().uuidString
    }

    func configure(_ cell: UICollectionViewCell) {
        guard let cell = cell as? Cell else {
            return
        }
        cell.translationLabel.text = translation
    }

    func size(in collectionView: UICollectionView, sectionItem: CollectionViewSectionItem) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 55)
    }

    func isEqual(to item: DiffItem) -> Bool {
        guard let rhs = item as? SearchCollectionViewCellItem else {
            return false
        }

        let lhs = self
        return lhs.diffIdentifier == rhs.diffIdentifier &&
            lhs.translation == rhs.translation
    }

}
