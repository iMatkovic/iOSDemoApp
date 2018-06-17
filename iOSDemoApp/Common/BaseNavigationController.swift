//
//  BaseNavigationController.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
class BaseNavigationController: UINavigationController {
    
    func customizeNavigationBar(_ navigationItem: UINavigationItem) {
        removeShadowFromNavbar()
//        navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationBar.shadowImage = UIImage()
//        navigationBar.isTranslucent = true
//        navigationBar.tintColor = .white
//        navigationBar.isOpaque = true
//        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: Font.regular(size: 16)]
//        
//        navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back")
//        navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back")
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
//        
    }
    
    private func removeShadowFromNavbar() {
        navigationBar.shadowImage = UIImage()
    }
    
    func goBack() {
        self.popViewController(animated: true)
    }
}
