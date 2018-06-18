//
//  Colors.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    static let martianRed = rgb(239, 64, 89)
    static let martianDark = rgb(61, 61, 61)
    static let martianDarkGray = rgb(142, 142, 142)
    static let martiangGray = rgb(199, 199, 199)
    static let martiangLightGray = rgb(245, 245, 245)
}
