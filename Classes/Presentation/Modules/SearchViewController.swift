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
    func translation()
}

class SearchViewController: UIViewController {

    private struct Constants {
        static let searchTextFieldSideInset: CGFloat = 10
        static let searchTextFieldTopInset: CGFloat = 100
        static let searchTextFieldHeight: CGFloat = 50
    }

    private let output: SearchViewOutput
    private var viewModel: SearchViewModel

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .main1
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
        view.backgroundColor = .main3
        view.addSubview(searchTextField)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        searchTextField.configureFrame { maker in
            maker.top(inset: Constants.searchTextFieldTopInset)
                .left(inset: Constants.searchTextFieldSideInset)
                .right(inset: Constants.searchTextFieldSideInset)
                .height(Constants.searchTextFieldHeight)
        }
    }

    @objc private func textFieldEditingChanged() {
        guard let text = searchTextField.text else {
            return
        }
        output.editingText(text)
        output.translation()
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
