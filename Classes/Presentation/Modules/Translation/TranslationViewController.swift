//
//  TranslationViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation
import UIKit
import Framezilla

protocol TranslationViewOutput {

}

class TranslationViewController: UIViewController {
    private let output: TranslationViewOutput

    private lazy var textTranslationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .main1
        return label
    }()

    init(output: TranslationViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .main3
        view.addSubview(textTranslationLabel)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        textTranslationLabel.configureFrame { maker in
            maker.top(inset:250).left(inset: 20).right(inset: 20).height(50)
        }
    }
}
