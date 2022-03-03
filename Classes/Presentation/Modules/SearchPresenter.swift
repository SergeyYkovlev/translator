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

    weak var view: SearchViewController?
    weak var output: SearchModuleOutput?

    var state: SearchState
    init(state: SearchState) {
        self.state = state
    }

}

extension SearchPresenter: SearchViewOutput {
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
