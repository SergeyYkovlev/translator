//
//  ViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import UIKit
import Framezilla
import CollectionViewTools

protocol SearchViewInput {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool)
}

protocol SearchViewOutput {
    func editingText(_ text: String)
}

class SearchViewController: UIViewController {

    private struct Constants {
        static let searchTextFieldSideInset: CGFloat = 10
        static let searchTextFieldTopInset: CGFloat = 100
        static let searchTextFieldHeight: CGFloat = 50
        static let collectionViewSideInset: CGFloat = 10
        static let collectionViewTopInset: CGFloat = 20
        static let collectionViewBottomInset: CGFloat = 10
    }

    private lazy var collectionViewManager: CollectionViewManager = .init(collectionView: collectionView)

    let searchService: SearchServiceImpl = .init()
    private let output: SearchViewOutput
    private var viewModel: SearchViewModel

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .main1
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return textField
    }()

    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.alwaysBounceVertical = true
        view.contentInsetAdjustmentBehavior = .never
        view.isPrefetchingEnabled = false
        return view
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
        view.addSubview(collectionView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        searchTextField.configureFrame { maker in
            maker.top(inset: Constants.searchTextFieldTopInset)
                .left(inset: Constants.searchTextFieldSideInset)
                .right(inset: Constants.searchTextFieldSideInset)
                .height(Constants.searchTextFieldHeight)
        }

        collectionView.configureFrame { maker in
            maker.top(to: self.searchTextField.nui_bottom, inset: Constants.collectionViewTopInset)
                .left(inset: Constants.collectionViewSideInset)
                .right(inset: Constants.collectionViewSideInset)
                .bottom(to: view.nui_safeArea.bottom, inset: Constants.collectionViewBottomInset)
        }
        collectionView.scrollIndicatorInsets = collectionView.contentInset
    }
    @objc private func textFieldEditingChanged() {
        guard let text = searchTextField.text else {
            return
        }
        output.editingText(text)
    }
}

extension SearchViewController: SearchViewInput, ViewUpdate {
    func update(with viewModel: SearchViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel
        collectionViewManager.update(with: viewModel.listSectionItems, animated: animated)
        view.setNeedsLayout()
        view.layoutIfNeeded()

        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<SearchViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
    }
}
