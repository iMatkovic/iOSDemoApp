//
//  Styles.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
enum UILabelStyle {

    static let base = UIViewStyle<UILabel> { _ in

    }

    static let headline1White = base.composing { label in
    
        label.textColor = .white
    }
}
