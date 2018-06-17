//
//  Coordinator.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
public protocol Coordinator: class {
    
    @discardableResult
    func start() -> UIViewController
}
