//
//  RequestLogging.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import Alamofire
protocol NetworkLoggingProtocol {
    func log(_ request: DataRequest)
    func log<T>(_ response: DataResponse<T>)
}
public struct NetworkLogger: NetworkLoggingProtocol {

    public func log(_ request: DataRequest) {
        print("\n\n")
        print("🌏⬆️ Starting request:\n")
        print(request.debugDescription)
    }

    public func log<T>(_ response: DataResponse<T>) {
        print("🌏⬇️ Got response:\n")
        print(response.debugDescription)
        print("\n\n")
    }

}
