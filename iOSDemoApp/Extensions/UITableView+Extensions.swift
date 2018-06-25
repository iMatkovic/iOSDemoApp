//
//  UITableView+Extensions.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {

    func removeFooter() {
        self.tableFooterView = UIView()
    }

    func register<T: UITableViewCell>(_: T.Type) where T: NibViewable, T: ReusableView {
        self.register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T? where T: ReusableView {
        return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T
    }


}
