//
//  ViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import UIKit
import Framezilla

protocol SearchViewInput {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool)
}

protocol SearchViewOutput {
    func editingText(_ text: String)
}

class SearchViewController: UIViewController {

    private let output: SearchViewOutput
    private var viewModel: SearchViewModel

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return textField
    }()

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
        view.backgroundColor = UIColor(red: 114 / 255.0, green: 144 / 255.0, blue: 185 / 255.0, alpha: 1)
        view.addSubview(searchTextField)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        searchTextField.configureFrame { maker in
            maker.top(inset: 100).left(inset: 10).right(inset: 10).height(50)
        }
    }

    @objc private func textFieldEditingChanged() {
        output.editingText(searchTextField.text!)
    }
}

extension SearchViewController: SearchViewInput, ViewUpdate {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel
        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<SearchViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
    }
}
