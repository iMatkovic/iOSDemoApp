//
//  FeedService.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
protocol FeedServiceProtocol {
    func getAll(onComplete: @escaping ((ServiceResult<[Post]>) -> Void))
}
class FeedService: FeedServiceProtocol {

    let dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }


    func getAll(onComplete: @escaping ((ServiceResult<[Post]>) -> Void)) {
        dataService.fetch(url: "/posts") { (result: ServiceResult<[Post]>) in
            onComplete(result)
        }
    }
}
