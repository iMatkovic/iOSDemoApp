//
//  BaseViewController.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
public typealias EmptyCallback = ()-> Void
open class BaseViewController: UIViewController {
    public var onFinished: EmptyCallback?
}

extension BaseViewController {
    
    open class func instance() -> Self {
        if let vc = createFromStoryboard(type: self) {
            return vc
        } else {
            print("WARNING: can't create view controller from storybard:\(self)")
            return self.init()
        }
    }
    
    private class func createFromStoryboard<T: UIViewController>(type: T.Type) -> T? {
        
        let storyboardName = String(describing: type)
        
        let bundle = Bundle(for: T.self)
        
        guard bundle.path(forResource: storyboardName, ofType: "storyboardc") != nil else {
            return nil
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        guard let vc = storyboard.instantiateInitialViewController() else {
            print("no vc in storyboard(hint: check initial vc)") ; return nil
        }
        
        return vc as? T
    }
}
