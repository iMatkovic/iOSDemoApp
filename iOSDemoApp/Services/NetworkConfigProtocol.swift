//
//  NetworkingProtocol.swift
//  
//
//  Created by Ivan Matkovic on 18/06/2018.
//

import Foundation
public protocol NetworkConfigProtocol {
    
    var baseURL: String { get }
    var staticHeaders: [String: String] { get }

}
