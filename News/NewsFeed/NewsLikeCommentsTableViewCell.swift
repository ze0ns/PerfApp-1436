//
//  NewsLikeCommentsTableViewCell.swift
//  PerfApp-1436
//
//  Created by zeons on 23.09.2021.
//

import UIKit

class NewsLikeCommentsTableViewCell: UITableViewCell {

    @IBOutlet var newsCommentColl: UIImageView!
    @IBOutlet var likeColl: likeControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
