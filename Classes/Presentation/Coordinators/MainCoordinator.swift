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

    init(window: UIWindow) {
        self.window = window
        let rootViewController = UINavigationController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        super.init(rootViewController: rootViewController)
    }

    override func start() {
//        viewController.delegate = self
//        searchModule.output = self
        rootViewController.pushViewController(searchModule.viewController, animated: true)
    }
}
