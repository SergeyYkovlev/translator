//
//  ViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import UIKit
protocol SearchViewInput {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool)
}

protocol SearchViewOutput {

}

class SearchViewController: UIViewController {

    private let output: SearchViewOutput
    private var viewModel: SearchViewModel

    init(viewModel: SearchViewModel, output: SearchViewOutput) {
        self.viewModel = viewModel
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

extension SearchViewController: SearchViewInput, ViewUpdate {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool) {
    }
}
