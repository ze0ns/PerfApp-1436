//
//  NewsWallController.swift
//  PerfApp-1436
//
//  Created by zeons on 23.09.2021.
//

import Foundation
import UIKit

final class NewsWallController: UITableViewController {



    var newsLetter: [newsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        let newsStorege = newsStorage()
        newsLetter = newsStorege.news

    }
}
extension NewsWallController{
  
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Новости"
    }
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if newsLetter[indexPath.row].cellIndex == "photo" {
            let cell = Bundle.main.loadNibNamed("NewsPhotoTableViewCell", owner: self, options: nil)?.first as! NewsPhotoTableViewCell
            cell.NewsPhotoImage.image = UIImage(named: newsLetter[indexPath.row].newsImage!)
            return cell
              }
           else
               if   newsLetter[indexPath.row].cellIndex == "avatar"{
                    let cell = Bundle.main.loadNibNamed("NewsAutorTableViewCell", owner: self, options: nil)?.first as! NewsAutorTableViewCell
                    cell.newsAutorAvatar.image = UIImage(named: newsLetter[indexPath.row].newsImage!)
                    cell.newsAuthorName.text = newsLetter[indexPath.row].newsAvtor
                    cell.newsDateLabel.text = newsLetter[indexPath.row].newsDate
                    return cell
               }
           else
           if newsLetter[indexPath.row].cellIndex == "text" {
               let cell = Bundle.main.loadNibNamed("NewsTextTableViewCell", owner: self, options: nil)?.first as! NewsTextTableViewCell
               cell.newsTextLabel.text = newsLetter[indexPath.row].newsText
               return cell
           }
           else{
               let cell = Bundle.main.loadNibNamed("NewsLikeCommentsTableViewCell", owner: self, options: nil)?.first as! NewsLikeCommentsTableViewCell
               return cell
           }
    }
}
 
    
    

