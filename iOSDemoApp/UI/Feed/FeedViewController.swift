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


    //MARK: - Dependencies
    var viewModel: FeedViewModel!


    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addCallbacks()
        viewModel.loadData()
    }

    //MARK: - Utility

    private func setupTableView() {
        tableView.register(FeedTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func addCallbacks() {
        viewModel.onComplete = { [weak self] in
            self?.tableView.reloadData()
        }
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



}
