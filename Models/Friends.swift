//
//  Frends.swift
//  client-server-1436
//
//  Created by zeons on 18.08.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendsResponse
class FriendsResponse: Codable {
    let response: Friends
}

// MARK: - Response
class Friends: Codable {
    let count: Int
    let items: [Friend]
    
    init(count: Int, items: [Friend]) {
        self.count = count
        self.items = items
    }
}


// MARK: - Item
class Friend: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var photo50: String
    @objc dynamic var firstName: String
 

    enum CodingKeys: String, CodingKey {
        case id
        case lastName = "last_name"
        case photo50 = "photo_50"
        case firstName = "first_name"
    }
}
