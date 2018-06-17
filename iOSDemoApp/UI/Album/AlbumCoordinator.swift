//
//  AlbumCoordinator.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
final class AlbumCoordinator: Coordinator {
    
    private var childCoordinators: [Coordinator] = []
    
    private var navigationController = BaseNavigationController()
    
    func start() -> UIViewController {
        navigationController.navigationBar.tintColor = .black
        return createFeedViewController()
    }
    
    private func createFeedViewController() -> UIViewController {
        let viewController = UIViewController()
           viewController.view.backgroundColor = .blue
        navigationController.viewControllers = [viewController]
        return navigationController
    }
    
}
