//
//  Post.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
struct Post: Decodable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
}
