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

     var view: SearchViewInput?
    weak var output: SearchModuleOutput?

    var state: SearchState
    private let listItemsFactory: SearchListItemsFactory

    init(state: SearchState,
         listItemsFactory: SearchListItemsFactory) {
        self.state = state
        self.listItemsFactory = listItemsFactory
    }

}

extension SearchPresenter: SearchViewOutput {
    func openTranslationViewController() {
        output?.searchModuleTranslationOpenViewController()
    }

    private func translation() {
        searchService.fetchWords(query: state.enteredText, success: { [weak self] words in
            self?.state.words = words
            self?.update(force: false, animated: true)
        }, failure: nil)
    }

    func editingText(_ text: String) {
        if text.isEmpty {
            self.state.words = []
            self.update(force: false, animated: true)
        }
        else {
            state.enteredText = text
            translation()
        }
    }
}

extension SearchPresenter: SearchModuleInput {
    func update(force: Bool, animated: Bool) {
        let viewModel = SearchViewModel(state: state, listItemsFactory: listItemsFactory, output: self)
        view?.update(with: viewModel, force: force, animated: animated)
    }
}
