//
//  WordHeaderCollectionViewCellItem.swift
//  translator
//
//  Created by Сергей Яковлев on 18.03.2022.
//

import CollectionViewTools
import Texstyle

class SearchHeaderItem: CollectionViewReusableViewItem {

    private typealias View = SearchHeaderView

    var type: ReusableViewType = .header
    var reuseType: ReuseType = .class(View.self)

    private let word: Word

    init(word: Word) {
        self.word = word
    }

    func configure(_ view: UICollectionReusableView) {
        guard let view = view as? View else {
            return
        }

        view.label.attributedText = Text(value: word.text?.uppercased(), style: .heading3a)?.attributed

        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    func size(for collectionView: UICollectionView, with layout: UICollectionViewLayout) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}
