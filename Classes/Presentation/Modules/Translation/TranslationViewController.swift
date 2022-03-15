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

    init(output: TranslationViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
