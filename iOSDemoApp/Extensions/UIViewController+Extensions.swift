//
//  UIViewController+Extensions.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit

public protocol RootShowable: class {
    func showAsRoot()
}

extension RootShowable where Self: UIViewController {

    public func showAsRoot() {
        guard let window = window else {
            print("WARNING: no window!")
            return
        }
        window.rootViewController = self
        window.makeKeyAndVisible()
    }
}

extension UIViewController: RootShowable {

    public var window: UIWindow? {
        var appWindow = view.window
        if appWindow == nil {
            if UIApplication.shared.windows.count > 0 {
                appWindow = UIApplication.shared.windows[0]
            }
        }
        return appWindow
    }


    public var contentViewController: UIViewController? {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.topViewController?.contentViewController
        } else {
            return self
        }
    }


    public func showAlert(title: String, message: String? = nil, actions: [UIAlertAction]) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        for action in actions {
            alert.addAction(action)
        }

        self.present(alert, animated: true, completion: nil)
    }

}
