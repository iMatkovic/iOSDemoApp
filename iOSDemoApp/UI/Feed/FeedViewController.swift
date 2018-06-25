//
//  FeedViewController.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 17/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import UIKit
class FeedViewController: BaseViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    //MARK: - UserInteractions

    @objc
    private func pulledToRefresh() {
        viewModel.loadData()
    }

    //MARK: - Dependencies
    var viewModel: FeedViewModel!
    private let refreshControl = UIRefreshControl()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addCallbacks()
        configure()
        addPullToRefresh()
        viewModel.loadData()
    }

    //MARK: - Utility

    private func configure() {
        activityIndicator.hidesWhenStopped = true
    }

    private func setupTableView() {
        tableView.register(FeedTableViewCell.self)
        tableView.delegate = self
        tableView.backgroundColor = .martianDark
        tableView.separatorColor = .martianDarkGray
        tableView.dataSource = self
    }

    private func addCallbacks() {

        viewModel.onError = { [weak self] error in
            self?.showOkAlert(error)
        }

        viewModel.onStateChanged = { [weak self] state in
            switch state {
            case .empty:
                //We can add here some custom empty View
                self?.tableView.isHidden = true
                self?.activityIndicator.startAnimating()
                self?.refreshControl.endRefreshing()
            case .loaded:
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
                self?.activityIndicator.stopAnimating()
                self?.tableView.isHidden = false
            case .noInternet:
                self?.refreshControl.endRefreshing()
                //TODO: Add reusable noInternetView
                break
            }
        }
    }

    private func addPullToRefresh() {
        refreshControl.tintColor = .white
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
    }

}
//MARK: - Extensions
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: FeedTableViewCell = tableView.dequeueReusableCell(), let post = viewModel.posts[safe: indexPath.row] else {
            return UITableViewCell()
        }

        cell.post = post
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
