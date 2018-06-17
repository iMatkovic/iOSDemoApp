//
//  ApiConfig.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
struct NetworkConfig: NetworkConfigProtocol {
    let baseURL = "https://demo.martian.agency/api"
    let staticHeaders: [String: String] = ["X-Auth": "bWFydGlhbmFuZG1hY2hpbmU="]
}
