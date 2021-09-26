//
//  NewsFeedAPIOperations.swift
//  PerfApp-1436
//print("----------------PRINT-----------------")
//print(response.data?.prettyJSON)

import Foundation
import Alamofire
import DynamicJSON
import SwiftUI

class FriendsMakeAPIDataOperation: Operation{

    var data: Data?
    
   override func main(){
        var requestContructor = URLComponents()
        requestContructor.scheme = "https"
        requestContructor.host = "api.vk.com"
        requestContructor.path = "/method/friends.get"
        requestContructor.queryItems = [
        URLQueryItem(name: "user_id", value: "\(Session.shared.userId)"),
        URLQueryItem(name: "order", value: "name"),
        URLQueryItem(name: "count", value: "1000"),
        URLQueryItem(name: "fields", value: "photo_100, photo_50"),
        URLQueryItem(name: "access_token", value: "\(Session.shared.token)"),
        URLQueryItem(name: "v", value: "5.131")
        ]
        guard let url = requestContructor.url else {return}
        guard let data = try? Data(contentsOf: url) else {return}
        self.data = data
    }
}

class FriendsParsingOperations: Operation{
    var friendsList: [Friend]? = []
    
    override func main(){
        guard let friendsListData = dependencies.first as? FriendsMakeAPIDataOperation,
              let data = friendsListData.data else {return}
        print(data.prettyJSON)
        do{
            let responseData = try JSONDecoder().decode(FriendsResponse.self, from: data)
            self.friendsList = responseData.response.items
        }catch{
            print("Operations Error")
            print(error)
        }
    }
}
class FriendsDisplayOperation: Operation{
    var friendViewController: DisplayFrendsTableViewController
    
    override func main(){
        guard let parsedFriendsListData = dependencies.first as? FriendsParsingOperations,
              let friendsList = parsedFriendsListData.friendsList else {return}
        friendViewController.friends = friendsList
        friendViewController.tableView.reloadData()
    }

    init(controller: DisplayFrendsTableViewController){
        self.friendViewController = controller
    }
}

