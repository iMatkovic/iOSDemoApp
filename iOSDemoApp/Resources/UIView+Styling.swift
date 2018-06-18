//
//  UIView+Styling.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit

public struct UIViewStyle<T: UIView> {

    private let styling: (T) -> Void

    public init(styling: @escaping (T) -> Void) {
        self.styling = styling
    }

    public static func compose(_ styles: UIViewStyle<T>...) -> UIViewStyle<T> {

        return UIViewStyle { view in
            for style in styles {
                style.styling(view)
            }
        }
    }

    public func composing(with other: UIViewStyle<T>) -> UIViewStyle<T> {
        return UIViewStyle { view in
            self.styling(view)
            other.styling(view)
        }
    }

    public func composing(with otherStyling: @escaping (T) -> Void) -> UIViewStyle<T> {
        return self.composing(with: UIViewStyle(styling: otherStyling))
    }

    public func apply(to view: T) {
        styling(view)
    }

    public func apply(to views: T...) {
        for view in views {
            styling(view)
        }
    }
}
