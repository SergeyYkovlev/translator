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

    func translation() {
        let session = URLSession.shared
        guard let url = URL(string: "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(state.enteredText)") else {
            return
        }
        let task = session.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                return
            }
            do {
                self.state.word = try JSONDecoder().decode([Word].self, from: data!)
                print(self.state.text)
                DispatchQueue.main.async {
                    //                    self.updateView()
                }
            }
            catch {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
        task.resume()
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
