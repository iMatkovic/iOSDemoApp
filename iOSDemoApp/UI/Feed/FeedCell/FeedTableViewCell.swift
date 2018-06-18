//
//  FeedTableViewCell.swift
//  iOSDemoApp
//
//  Created by Ivan Matkovic on 18/06/2018.
//  Copyright © 2018 Ivan Matkovic. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell, NibViewable, ReusableView {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!

    var post: Post? {
        didSet {

            guard let post = post else {
                return
            }

            postTitleLabel.text = post.title
            userIdLabel.text = "\(post.userId)"
            postTextLabel.text = post.body

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }


}
