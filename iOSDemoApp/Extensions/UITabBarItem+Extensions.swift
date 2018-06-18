//
//  UITabBarItem+Extensions.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarItem {
    
    static var feed: UITabBarItem {
        let item = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "feed"), selectedImage: #imageLiteral(resourceName: "feedSelected"))
        item.centerImage()
        return item
    }
    
    static var todo: UITabBarItem {
        let item = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "todo"), selectedImage: #imageLiteral(resourceName: "todoSelected"))
        item.centerImage()
        return item
    }
    
    static var album: UITabBarItem {
        let item = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "album"), selectedImage: #imageLiteral(resourceName: "albumSelected"))
        item.centerImage()
        return item
    }
    
    func centerImage() {
        self.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }

    
}
