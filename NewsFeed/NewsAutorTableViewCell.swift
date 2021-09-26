//
//  NewsAutorTableViewCell.swift
//  PerfApp-1436
//
//  Created by zeons on 23.09.2021.
//

import UIKit

class NewsAutorTableViewCell: UITableViewCell {

    @IBOutlet var newsAutorAvatar: avatarImage!
    @IBOutlet var newsDateLabel: UILabel!
    @IBOutlet var newsAuthorName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
