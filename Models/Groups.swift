//
//  groups.swift
//  client-server-1436
//
//  Created by Oschepkov Aleksandr on 19.08.2021.
//

import Foundation
import RealmSwift
import DynamicJSON

 struct GroupsDynamic {
     var id: Int = 0
     var is_closed: Int = 0
     var is_advertiser: Int = 0
     var description: String = ""
     var type : String = "page"
     var is_memberInt = 0
     var photo50: String = ""
     var photo200: String = ""
     var isAdmin: Int = 0
     var photo100: String = ""
     var name: String = ""
     var screenName: String = ""
      

     init(json: JSON) {
         self.id = json.id.int ?? 0 //json["id"] as! Int
         self.name = json.name.string ?? "" //json["first_name"] as! String
         self.description = json.description //json["last_name"] as! String
     }
 }


struct groupsID: Codable {
    let id: Int
}

enum ApplicationError: Error {
    case noGroups
    case noID
    case postsCouldNotBeParsed
}

// MARK: - Groups
class Groups: Codable {
    let response: GroupsResponse

}

// MARK: - Response
class GroupsResponse: Codable {
    let count: Int
    let items: [Group]
    
    init(count: Int, items: [Group]) {
        self.count = count
        self.items = items
    }
}
class Group: Object, Codable {
    @objc dynamic var isMember, id: Int
    @objc dynamic var photo100: String
    @objc dynamic var isAdvertiser, isAdmin: Int
    @objc dynamic var photo50, photo200: String
    @objc dynamic var type, screenName: String
    @objc dynamic var name: String
    @objc dynamic var isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}
