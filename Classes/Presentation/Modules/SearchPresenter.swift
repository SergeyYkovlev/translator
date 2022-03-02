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

}

extension SearchPresenter: SearchModuleInput {
    func update(force: Bool, animated: Bool) {

    }

}
