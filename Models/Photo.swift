import Foundation
import RealmSwift
import Realm

// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let response: Photos

    init(response: Photos) {
        self.response = response
    }
}

// MARK: - Response
class Photos: Codable {
    let count: Int
    let items: [Photo]

    init(count: Int, items: [Photo]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
struct Photo:  Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [PhotosSize]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?
    
    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
    }

}

// MARK: - Size
class PhotosSize: Codable {
    let width, height: Int
    let url: String
    let type: String

}

struct PhotoArray {
    let id = 0
    let urlLink = ""
}

