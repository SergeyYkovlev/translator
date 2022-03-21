//
//  SearchModule.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//
import Foundation
import UIKit
import CollectionViewTools

protocol SearchModuleInput: AnyObject {
    var state: SearchState { get }
    func update(force: Bool, animated: Bool)
}

protocol SearchModuleOutput: AnyObject {
    func searchModuleTranslationModuleShowed(text: String, translation: String, image: URL?)
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
        let listItemsFactory = SearchListItemsFactory()
        let presenter = SearchPresenter(state: state, listItemsFactory: listItemsFactory )
        let viewModel = SearchViewModel(state: state, listItemsFactory: listItemsFactory, output: presenter)
        let viewController = SearchViewController(viewModel: viewModel, output: presenter)
        listItemsFactory.output = presenter
        listItemsFactory.viewController = viewController
        presenter.view = viewController
        self.viewController = viewController
        self.presenter = presenter
    }

}
