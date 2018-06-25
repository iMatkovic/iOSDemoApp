//
//  Array+Extensions.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
public extension Array {
    
    public subscript(safe index: Int) -> Element? {
        return index >= 0 && index < self.count ? self[index] : nil
    }
    
}
