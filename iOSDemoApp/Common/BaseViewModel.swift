//
//  BaseViewModel.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation

public typealias EmptyCallback = () -> Void

class BaseViewModel {
    var onComplete: EmptyCallback?
    var onError: ((String) -> Void)?
}
