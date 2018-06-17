//
//  MainCoordinator.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
import Foundation

class MainCoordinator: NSObject, Coordinator {
    
//    private var persistenceService: PersistenceServiceProtocol
//    private var authenticationCoordinator: AuthenticationCoordinator?
//
//    init(_ persistenceService: PersistenceServiceProtocol) {
//        self.persistenceService = persistenceService
//    }
    
    fileprivate var childCoordinators: [Coordinator] = [
        FeedCoordinator(),
        ToDoCoordinator(),
        AlbumCoordinator()
    ]
    
    @discardableResult
    func start() -> UIViewController {
            return startFeed()
    }
    
    
    @discardableResult
    private func startFeed() -> UIViewController {
        let tabBarController = createTabBarController()
        tabBarController.showAsRoot()
        return tabBarController
    }
}

// MARK: - Main tab bar
extension MainCoordinator {
    
    fileprivate func tabBarItem(for coordinator: Coordinator) -> UITabBarItem {
        switch coordinator {
        case is FeedCoordinator:
            return .feed
        case is ToDoCoordinator:
            return .todo
        case is AlbumCoordinator:
            return .album
        default:
            fatalError("No tab bar set for this coordinator!")
        }
    }
    
    fileprivate func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        let viewControllers = childCoordinators.map { coordinator -> UIViewController in
            let vc = coordinator.start()
            vc.tabBarItem = tabBarItem(for: coordinator)
            return vc
        }
        
        tabBarController.tabBar.backgroundColor = UIColor.white
        tabBarController.tabBar.backgroundImage =  UIImage()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
}
