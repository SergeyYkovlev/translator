//
//  TranslationPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation
import UIKit

class TranslationPresenter {
    var view: TranslationViewController?
    var output: TranslationModuleOutput?

    var state: TranslationState

    init(state: TranslationState) {
        self.state = state
    }

}

extension TranslationPresenter: TranslationViewOutput {
    func viewWillAppear() {
        update(force: false, animated: true)
    }

    func viewDidLoad() {
    }
}

extension TranslationPresenter: TranslationModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = TranslationViewModel(state: state, output: self)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
