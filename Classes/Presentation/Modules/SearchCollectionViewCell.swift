//
//  SearchTableViewCell.swift
//  translator
//
//  Created by Сергей Яковлев on 05.03.2022.
//

import Foundation
import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    private struct Constants {
        static let translationLabelLeftInset: CGFloat = 5
        static let translationLabelRightInset: CGFloat = 40
        static let translationLabelTopInset: CGFloat = 10
        static let translationLabelHeight: CGFloat = 30
    }

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
            maker.top(inset: Constants.translationLabelTopInset)
                .left(inset: Constants.translationLabelLeftInset)
                .right(inset: Constants.translationLabelRightInset)
                .height(Constants.translationLabelHeight)
        }
    }
}
