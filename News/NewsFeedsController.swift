//
//  NewsFeedsController.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 09.09.2021.
//

import UIKit
import Alamofire
import RealmSwift



class NewsFeedsController: UITableViewController {
    
    let newsFeedsAPI = NewsFeedAPI()
    var newsFeed: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем нашу кастомную ячейку
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        newsFeedsAPI.getNews{ [weak self] users in
            self?.newsFeed = users!
            print(users)
       //     self?.tableView.reloadData()
    
        }

    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             // #warning Incomplete implementation, return the number of rows
             return newsFeed.count
         }

         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//             let news: Any = newsFeed[indexPath.row]
//
//            guard let text = news.text else {return cell}
//            cell.textLabel!.text = "\(text)"
              return cell
         }

   

}

