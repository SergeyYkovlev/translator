//
//  SearchTableViewCell.swift
//  translator
//
//  Created by Сергей Яковлев on 05.03.2022.
//

import Foundation
import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    private(set) lazy var translationLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(translationLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        translationLabel.configureFrame { maker in
            maker.top(inset: 10).left(inset: 5).right(inset: 40).height(30)
        }
    }
}
