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
    func translationLabel() {
        view?.textLabel.text = state.text1
        view?.textTranslationLabel.text = state.text2
//        guard var  text = view?.textTranslationLabel.text else{
//            return
//        }
//        guard let meanings = state.words.first?.meanings else {
//            return
//        }
//        text =  meanings.compactMap { meaning -> SearchCollectionViewCellItem? in
//            guard let translation = meaning.translation?.text else {
//                return nil
//            }
//        }
    }
}

extension TranslationPresenter: TranslationModuleInput {

}
