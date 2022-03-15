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
//        viewController.delegate = self
        searchModule.output = self
        translationModule.output = self
        rootViewController.pushViewController(searchModule.viewController, animated: true)
    }
}

extension MainCoordinator: SearchModuleOutput {
    func searchModuleTranslationOpenViewController() {
        rootViewController.pushViewController(translationModule.viewController, animated: true)
    }
}

extension MainCoordinator: TranslationModuleOutput {

}
