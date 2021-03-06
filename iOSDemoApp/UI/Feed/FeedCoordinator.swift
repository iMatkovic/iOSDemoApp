//
//  FeedCoordinator.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
final class FeedCoordinator: Coordinator {

    private var childCoordinators: [Coordinator] = []

    private var navigationController = BaseNavigationController()

    func start() -> UIViewController {
        navigationController.navigationBar.tintColor = .black
        return createFeedViewController()
    }

    private func createFeedViewController() -> UIViewController {
        let viewController = FeedViewController.instance()
        let viewModel = FeedViewModel(ServiceFactory.feedService)
        viewController.title = "Feed"
        viewController.viewModel = viewModel
        navigationController.viewControllers = [viewController]
        return navigationController
    }

}
