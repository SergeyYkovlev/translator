//
//  MainCoordinator.swift
//  translator
//
//  Created by Сергей Яковлев on 02.03.2022.
//

import Foundation
import  UIKit

class MainCoordinator: BaseCoordinator <UINavigationController> {

    let window: UIWindow
    let searchModule = SearchModule()
    let translationModule = TranslationModule()

    init(window: UIWindow) {
        self.window = window
        let rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        searchModule.output = self
        translationModule.output = self
        rootViewController.pushViewController(searchModule.viewController, animated: true)
    }
}

extension MainCoordinator: SearchModuleOutput {
    func searchModuleTranslationModuleShowed(text: String, translation: String) {

        translationModule.input.state.text1 = text
        translationModule.input.state.text2 = translation
        rootViewController.pushViewController(translationModule.viewController, animated: true)
    }
//    func searchModuleTranslationViewController(enteredText: String) {
//        translationModule.input.state.text1  = enteredText
//    }
//    func searchModuleTranslationModuleShowed() {
//
//        rootViewController.pushViewController(translationModule.viewController, animated: true)
//    }
}

extension MainCoordinator: TranslationModuleOutput {

}
