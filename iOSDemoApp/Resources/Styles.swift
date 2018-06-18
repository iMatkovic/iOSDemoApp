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

    static let base = UIViewStyle<UILabel> { label in
        label.numberOfLines = 0
    }

    static let mainBody = base.composing { label in
        label.font = Font.avenirBook.size(14)
        label.textColor = UIColor.martiangLightGray
    }

    static let mainTitle = base.composing { label in
        label.font = Font.avenirRoman.size(18)
        label.textColor = UIColor.martianRed
    }

    static let mainSubtitle = base.composing { label in
        label.font = Font.avenirRoman.size(14)
        label.textColor = UIColor.martianRed.withAlphaComponent(0.7)
    }
}
