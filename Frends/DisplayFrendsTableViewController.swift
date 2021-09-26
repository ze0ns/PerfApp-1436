//
//  DisplayFrendsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 16.08.2021.
//

import UIKit

class DisplayFrendsTableViewController: UITableViewController {

   // let friendsAPI = FriendsAPI()
    
    var friends: [Friend] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Регистрируем нашу кастомную ячейку
  
       
        let operationQueue = OperationQueue()
        let friendsMakeAPIDataOperation = FriendsMakeAPIDataOperation()
        let friendsParsingOperations = FriendsParsingOperations()
        let friendsDisplayOperation = FriendsDisplayOperation(controller: self)
        
        operationQueue.addOperation(friendsMakeAPIDataOperation)
        friendsParsingOperations.addDependency(friendsMakeAPIDataOperation)
        
        operationQueue.addOperation(friendsParsingOperations)
        friendsDisplayOperation.addDependency(friendsParsingOperations)
        print(Thread.current)
        OperationQueue.main.addOperation(friendsDisplayOperation)
      
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    

    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             // #warning Incomplete implementation, return the number of rows
             return friends.count
         }

         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

             let friend: Friend = friends[indexPath.row]
            
             cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"

             return cell
         }

   

}
