//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation

protocol SearchModuleInput: AnyObject {
    var state: SearchState { get }
    func update(force: Bool, animated: Bool)
}

protocol SearchModuleOutput: AnyObject {

}

final class SearchModule {

    var input: SearchModuleInput {
        return presenter
    }

    var output: SearchModuleOutput? {
        get {
            return presenter.output
        }
        set {
            presenter.output = newValue
        }
    }
    let viewController: SearchViewController
    private let presenter: SearchPresenter

    init(state: SearchState = .init()) {
        let presenter = SearchPresenter(state: state)
        let viewController = SearchViewController(output: presenter)
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }

}

