//
//  TranslationViewModel.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation

class TranslationViewModel {
    var text: String = ""
    var translation: String = ""
    var image: URL?

    init(state: TranslationState, output: TranslationViewOutput) {
        text = state.word
        translation = state.translationWord
        image = state.imageUrl
    }
}
