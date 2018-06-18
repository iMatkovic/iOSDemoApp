//
//  ServiceFactory.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
struct ServiceFactory {

    static var dataService: DataServiceProtocol {
        let config = NetworkConfig()
        let logg = NetworkLogger()
        let dataService = DataService(networkConfig: config, logging: logg)
        return dataService
    }

    static var feedService: FeedServiceProtocol {
        let feedService = FeedService(dataService)
        return feedService
    }

}
