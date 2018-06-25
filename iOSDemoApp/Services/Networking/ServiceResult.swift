//
//  ServiceResult.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
public enum ServiceResult<Value> {
    case success(Value)
    case failure(ServiceError)
}

public enum ServiceError {
    case validationError(ValidationResult)
    case cannotParse(String)
    case noInternet
    case userCancelled
    case other(Error)
}

public enum ValidationResult {
    
    case notFound
    case badRequest
    case unauthorized
    case forbidden
    case notAllowed
    case timeout
    case serverError
    case other(Int)
    
    init(code: Int) {
        switch code {
        case 500..<600: self = .serverError
        case 404: self = .notFound
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 405: self = .notAllowed
        case 408: self = .timeout
        default: self = .other(code)
        }
    }
}
