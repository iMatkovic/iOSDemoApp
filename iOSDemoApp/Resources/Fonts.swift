//
//  Fonts.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit

enum Font: String {
    case avenirBook = "Avenir-Book"
    case avenirLight = "Avenir-Light"
    case avenirRoman = "Avenir-Roman"

    var name: String {
        return self.rawValue
    }

    func size(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }

    static func book(size: CGFloat) -> UIFont {
        return Font.avenirBook.size(size)
    }

    static func light(size: CGFloat) -> UIFont {
        return Font.avenirLight.size(size)
    }

    static func roman(size: CGFloat) -> UIFont {
        return Font.avenirRoman.size(size)
    }

}
