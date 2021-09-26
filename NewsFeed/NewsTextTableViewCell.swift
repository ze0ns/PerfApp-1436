//
//  NewsTextTableViewCell.swift
//  PerfApp-1436
//
//  Created by zeons on 23.09.2021.
//
//добавил для пул регвест
import UIKit

class NewsTextTableViewCell: UITableViewCell {

    @IBOutlet var newsTextLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newsTextLabel.adjustUITextViewHeight()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UITextView {
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
    }
}
