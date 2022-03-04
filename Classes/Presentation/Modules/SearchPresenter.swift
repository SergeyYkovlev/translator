//
//  SearchPresenter.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation
import UIKit
import CoreLocation

final class SearchPresenter {

    let searchService: SearchServiceImpl = .init()

    weak var view: SearchViewController?
    weak var output: SearchModuleOutput?

    var state: SearchState
    init(state: SearchState) {
        self.state = state
    }

}

extension SearchPresenter: SearchViewOutput {

    func translation() {
        searchService.fetchWords(query: state.enteredText, success: { [weak self] words in
            self?.state.word = words
        }, failure: nil)
    }

    func editingText(_ text: String) {
        state.enteredText = text
        print(state.enteredText)
    }
}

extension SearchPresenter: SearchModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = SearchViewModel(state: state)
        view?.update(with: viewModel, force: force, animated: animated)
    }

}
