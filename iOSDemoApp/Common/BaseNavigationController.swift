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
        navigationBar.barTintColor = .martianDark
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: Font.avenirRoman.size(20)]
    }

    private func removeShadowFromNavbar() {
        navigationBar.shadowImage = UIImage()
    }

}
