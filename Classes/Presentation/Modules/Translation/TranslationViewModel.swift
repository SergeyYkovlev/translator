//
//  TranslationViewModel.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation

class TranslationViewModel {
    let words: [Word]
    init(state: SearchState, output: TranslationViewOutput) {
        words = state.words
    }
}
