//
//  TranslationViewController.swift
//  translator
//
//  Created by Сергей Яковлев on 15.03.2022.
//

import Foundation
import UIKit
import Framezilla
import Kingfisher

protocol TranslationViewInput: AnyObject {
    func update(with viewModel: TranslationViewModel, force: Bool, animated: Bool)
}

protocol TranslationViewOutput {
    func viewDidLoad()
    func viewWillAppear()
}

class TranslationViewController: UIViewController {
    private let output: TranslationViewOutput
    private var viewModel: TranslationViewModel

        private struct Constants {
            static let textLabelSideInset: CGFloat = 20
            static let textLabelTopInset: CGFloat = 200
            static let textLabelHeight: CGFloat = 50
            static let textTranslationLabelSideInset: CGFloat = 20
            static let textTranslationLabelTopInset: CGFloat = 270
            static let textTranslationLabeleHeight: CGFloat = 50
            static let translationImageViewSideInset: CGFloat = 50
            static let translationImageViewTopInset: CGFloat = 340
            static let translationImageViewHeight: CGFloat = 300
        }

    private lazy var textLabel: UILabel = {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let label = UILabel(frame: frame)
        label.layer.cornerRadius = 70
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()

    private lazy var textTranslationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.layer.borderColor = CGColor(
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()

    private lazy var translationImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 70
//        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()

    init(viewModel: TranslationViewModel, output: TranslationViewOutput) {
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
        view.addSubview(textLabel)
        view.addSubview(textTranslationLabel)
        view.addSubview(translationImageView)

        output.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        textLabel.configureFrame { maker in
            maker.top(inset: Constants.textLabelTopInset)
                .left(inset: Constants.textLabelSideInset)
                .right(inset: Constants.textLabelSideInset)
                .height(Constants.textLabelHeight)
        }
        textTranslationLabel.configureFrame { maker in
            maker.top(inset:Constants.textTranslationLabelTopInset)
                .left(inset: Constants.textTranslationLabelSideInset)
                .right(inset: Constants.textTranslationLabelSideInset)
                .height(Constants.textTranslationLabeleHeight)
        }
        translationImageView.configureFrame { maker in
            maker.top(inset: Constants.translationImageViewTopInset)
                .left(inset: Constants.translationImageViewSideInset)
                .right(inset: Constants.translationImageViewSideInset)
                .height(Constants.translationImageViewHeight)
        }
    }
}

extension TranslationViewController: TranslationViewInput, ViewUpdate {
    func update(with viewModel: TranslationViewModel, force: Bool, animated: Bool) {
        let oldViewModel = self.viewModel
        self.viewModel = viewModel

        func updateViewModel<Value: Equatable>(_ keyPath: KeyPath<TranslationViewModel, Value>, configurationBlock: (Value) -> Void) {
            update(new: viewModel, old: oldViewModel, keyPath: keyPath, force: force, configurationBlock: configurationBlock)
        }
        updateViewModel(\.text) { text in
            textLabel.text = text
        }
        updateViewModel(\.translation) { text in
            textTranslationLabel.text = text
        }
        updateViewModel((\.image)) { imageUrl in
            translationImageView.kf.setImage(with: imageUrl)
        }
    }
}
