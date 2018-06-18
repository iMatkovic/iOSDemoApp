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

    //MARK: - States
    enum State {
        case empty
        case noInternet
        case loaded
    }

    private(set) var state: State = .empty {
        didSet {
            onStateChanged?(state)
        }
    }

    var onStateChanged: ((State) -> Void)? {
        didSet {
            onStateChanged?(state)
        }
    }


    //MARK: - Data

    func loadData() {
        feedService.getAll { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = self?.filterData(posts) ?? []
                self?.state = .loaded
            case .failure(let error):
                self?.handle(error)
            }
        }
    }


    private func handle(_ error: ServiceError) {
        switch error {
        case .noInternet:
            state = .noInternet
        case .cannotParse(let error):
            print(error)
        case .other(let error):
            onError?(error.localizedDescription)
        default:
            break
        }
    }


    //Just to show high order functions
    private func filterData(_ posts: [Post]) -> [Post] {
        return posts.filter { $0.id != 1 }
    }


    func numberOfItems() -> Int {
        return posts.count
    }


}
