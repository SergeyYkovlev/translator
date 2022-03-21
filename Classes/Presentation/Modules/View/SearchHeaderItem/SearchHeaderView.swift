//
//  SearchHeaderView.swift
//  translator
//
//  Created by Сергей Яковлев on 18.03.2022.
//

import Foundation
import UIKit
import Framezilla

class SearchHeaderView: UICollectionReusableView {

    private struct Constants {
        static let labelInsets: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
    }

    private(set) lazy var label: UILabel = .init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.configureFrame { maker in
            maker.edges(insets: Constants.labelInsets)
        }
    }
}
