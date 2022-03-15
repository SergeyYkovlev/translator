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

}

extension TranslationPresenter: TranslationModuleInput {

}
