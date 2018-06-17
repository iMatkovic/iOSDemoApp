//
//  Networking.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
import Alamofire
public protocol DataServiceProtocol {
    func fetch<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, onComplete: @escaping (ServiceResult<T>) -> Void)
    func fetch<T: Decodable>(url: String, onComplete: @escaping (ServiceResult<T>) -> Void)
}

class DataService: DataServiceProtocol {

    private var networkConfig: NetworkConfigProtocol
    private var logging: NetworkLoggingProtocol

    init(networkConfig: NetworkConfigProtocol, logging: NetworkLoggingProtocol) {
        self.networkConfig = networkConfig
        self.logging = logging
    }

    func fetch<T: Decodable>(url: String, onComplete: @escaping (ServiceResult<T>) -> Void) {
        fetch(url: url, method: .get, parameters: nil, encoding: JSONEncoding.default, onComplete: onComplete)
    }

    func fetch<T: Decodable>(url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, onComplete: @escaping (ServiceResult<T>) -> Void) {

        let headers = networkConfig.staticHeaders
        let urlWithBase = "\(networkConfig.baseURL)\(url)"

        let request = Alamofire.request(urlWithBase, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { response in
            self.logging.log(response)
            switch response.result {
            case .success(let json):
                print(json)
                guard let data = response.data, let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    onComplete(.failure(.cannotParse("\(T.self)")))
                    return
                }
                onComplete(.success(decoded))
            case .failure(let error):
                onComplete(.failure(.other(error)))
            }
        }
        logging.log(request)
    }

}
