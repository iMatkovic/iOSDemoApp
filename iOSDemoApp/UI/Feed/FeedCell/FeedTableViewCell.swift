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
    @IBOutlet weak var postTextLabel: UILabel!

    var post: Post? {
        didSet {

            guard let post = post else {
                return
            }

            postTitleLabel.text = post.title
            postTextLabel.text = post.body

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .martianDark
        selectionStyle = .none

        UILabelStyle.mainBody.apply(to: postTextLabel)
        UILabelStyle.mainTitle.apply(to: postTitleLabel)

    }


}
