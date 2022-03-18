//
//  TranslationModule.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation
import UIKit

protocol TranslationModuleInput: AnyObject {
    var state: TranslationState { get }
}

protocol TranslationModuleOutput: AnyObject {
}

class TranslationModule {

    var input: TranslationModuleInput {
    return presenter
    }

    var output: TranslationModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }

    let viewController: TranslationViewController
    private let presenter: TranslationPresenter

    init(state: TranslationState = .init()) {
        let presenter = TranslationPresenter(state: state)
        let viewModel = TranslationViewModel(state: state, output: presenter)
        let viewController = TranslationViewController(viewModel: viewModel, output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }
}
