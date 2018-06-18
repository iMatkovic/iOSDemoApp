//
//  FeedViewModel.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import Foundation
class FeedViewModel: BaseViewModel {
    //MARK: - Dependencies
    let feedService: FeedServiceProtocol


    //MARK: - Init
    init(_ feedService: FeedServiceProtocol) {
        self.feedService = feedService
    }

    var posts: [Post] = []

    //MARK: - Data

    func loadData() {
        feedService.getAll { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                self?.onComplete?()
            case .failure(let error):
                print(error)
            }
        }
    }


    func numberOfItems() -> Int {
        return posts.count
    }


}
