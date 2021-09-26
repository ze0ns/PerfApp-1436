// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let newsFeed = try? newJSONDecoder().decode(NewsFeed.self, from: jsonData)

import Foundation

// MARK: - NewsFeed
class NewsFeed: Codable {
    let response: Response

    init(response: Response) {
        self.response = response
    }
}

// MARK: - Response
class Response: Codable {
    let items: [Item]
    let groups: [GroupNews]
    let profiles: [Profile]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups, profiles
        case nextFrom = "next_from"
    }

    init(items: [Item], groups: [GroupNews], profiles: [Profile], nextFrom: String) {
        self.items = items
        self.groups = groups
        self.profiles = profiles
        self.nextFrom = nextFrom
    }
}

// MARK: - Group
class GroupNews: Codable {
    let isMember, id: Int?
    let photo100: String?
    let isAdvertiser, isAdmin: Int?
    let photo50, photo200: String?
    let type, screenName, name: String?
    let isClosed: Int?

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

    init(isMember: Int, id: Int, photo100: String, isAdvertiser: Int, isAdmin: Int, photo50: String, photo200: String, type: String, screenName: String, name: String, isClosed: Int) {
        self.isMember = isMember
        self.id = id
        self.photo100 = photo100
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

// MARK: - Item
class Item: Codable {
    let donut: Donut?
    let comments: Comments?
    let canSetCategory, isFavorite: Bool?
    let shortTextRate: Double?
    let likes: Likes?
    let reposts: Reposts?
    let type, postType: String?
    let carouselOffset, date, sourceID: Int?
    let text: String?
    let canDoubtCategory: Bool?
    let attachments: [Attachment]?
    let markedAsAds, postID: Int?
    let postSource: PostSource?
    let views: Views?

    enum CodingKeys: String, CodingKey {
        case donut, comments
        case canSetCategory = "can_set_category"
        case isFavorite = "is_favorite"
        case shortTextRate = "short_text_rate"
        case likes, reposts, type
        case postType = "post_type"
        case carouselOffset = "carousel_offset"
        case date
        case sourceID = "source_id"
        case text
        case canDoubtCategory = "can_doubt_category"
        case attachments
        case markedAsAds = "marked_as_ads"
        case postID = "post_id"
        case postSource = "post_source"
        case views
    }

    init(donut: Donut, comments: Comments, canSetCategory: Bool, isFavorite: Bool, shortTextRate: Double, likes: Likes, reposts: Reposts, type: String, postType: String, carouselOffset: Int, date: Int, sourceID: Int, text: String, canDoubtCategory: Bool, attachments: [Attachment], markedAsAds: Int, postID: Int, postSource: PostSource, views: Views) {
        self.donut = donut
        self.comments = comments
        self.canSetCategory = canSetCategory
        self.isFavorite = isFavorite
        self.shortTextRate = shortTextRate
        self.likes = likes
        self.reposts = reposts
        self.type = type
        self.postType = postType
        self.carouselOffset = carouselOffset
        self.date = date
        self.sourceID = sourceID
        self.text = text
        self.canDoubtCategory = canDoubtCategory
        self.attachments = attachments
        self.markedAsAds = markedAsAds
        self.postID = postID
        self.postSource = postSource
        self.views = views
    }
}

// MARK: - Attachment
class Attachment: Codable {
    let type: String
    let photo: PhotoNews?
    let audio: Audio?

    init(type: String, photo: PhotoNews?, audio: Audio?) {
        self.type = type
        self.photo = photo
        self.audio = audio
    }
}

// MARK: - Audio
class Audio: Codable {
    let id, albumID: Int?
    let storiesAllowed, storiesCoverAllowed: Bool?
    let mainArtists: [MainArtist]?
    let trackCode: String?
    let url: String?
    let title: String?
    let ownerID, date: Int?
    let shortVideosAllowed: Bool?
    let duration: Int?
    let artist: String?
    let isExplicit, isFocusTrack: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case storiesAllowed = "stories_allowed"
        case storiesCoverAllowed = "stories_cover_allowed"
        case mainArtists = "main_artists"
        case trackCode = "track_code"
        case url, title
        case ownerID = "owner_id"
        case date
        case shortVideosAllowed = "short_videos_allowed"
        case duration, artist
        case isExplicit = "is_explicit"
        case isFocusTrack = "is_focus_track"
    }

    init(id: Int, albumID: Int, storiesAllowed: Bool, storiesCoverAllowed: Bool, mainArtists: [MainArtist], trackCode: String, url: String, title: String, ownerID: Int, date: Int, shortVideosAllowed: Bool, duration: Int, artist: String, isExplicit: Bool, isFocusTrack: Bool) {
        self.id = id
        self.albumID = albumID
        self.storiesAllowed = storiesAllowed
        self.storiesCoverAllowed = storiesCoverAllowed
        self.mainArtists = mainArtists
        self.trackCode = trackCode
        self.url = url
        self.title = title
        self.ownerID = ownerID
        self.date = date
        self.shortVideosAllowed = shortVideosAllowed
        self.duration = duration
        self.artist = artist
        self.isExplicit = isExplicit
        self.isFocusTrack = isFocusTrack
    }
}

// MARK: - MainArtist
class MainArtist: Codable {
    let name, id, domain: String?

    init(name: String, id: String, domain: String) {
        self.name = name
        self.id = id
        self.domain = domain
    }
}

// MARK: - Photo
class PhotoNews: Codable {
    let albumID, id, date: Int?
    let text: String?
    let userID: Int?
    let sizes: [Size]?
    let hasTags: Bool?
    let ownerID: Int?
    let accessKey: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case accessKey = "access_key"
    }

    init(albumID: Int, id: Int, date: Int, text: String, userID: Int, sizes: [Size], hasTags: Bool, ownerID: Int, accessKey: String) {
        self.albumID = albumID
        self.id = id
        self.date = date
        self.text = text
        self.userID = userID
        self.sizes = sizes
        self.hasTags = hasTags
        self.ownerID = ownerID
        self.accessKey = accessKey
    }
}

// MARK: - Size
class Size: Codable {
    let width, height: Int?
    let url: String?
    let type: String?

    init(width: Int, height: Int, url: String, type: String) {
        self.width = width
        self.height = height
        self.url = url
        self.type = type
    }
}

// MARK: - Comments
class Comments: Codable {
    let count, canPost: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
    }

    init(count: Int, canPost: Int) {
        self.count = count
        self.canPost = canPost
    }
}

// MARK: - Donut
class Donut: Codable {
    let isDonut: Bool?

    enum CodingKeys: String, CodingKey {
        case isDonut = "is_donut"
    }

    init(isDonut: Bool) {
        self.isDonut = isDonut
    }
}

// MARK: - Likes
class Likes: Codable {
    let canLike, canPublish, count, userLikes: Int?

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case canPublish = "can_publish"
        case count
        case userLikes = "user_likes"
    }

    init(canLike: Int, canPublish: Int, count: Int, userLikes: Int) {
        self.canLike = canLike
        self.canPublish = canPublish
        self.count = count
        self.userLikes = userLikes
    }
}

// MARK: - PostSource
class PostSource: Codable {
    let type, platform: String?

    init(type: String, platform: String) {
        self.type = type
        self.platform = platform
    }
}

// MARK: - Reposts
class Reposts: Codable {
    let count, userReposted: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }

    init(count: Int, userReposted: Int) {
        self.count = count
        self.userReposted = userReposted
    }
}

// MARK: - Views
class Views: Codable {
    let count: Int?

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Profile
class Profile: Codable {
    let canAccessClosed: Bool?
    let screenName: String?
    let online, id: Int?
    let photo100: String?
    let lastName: String?
    let photo50: String?
    let onlineInfo: OnlineInfo?
    let sex: Int?
    let isClosed: Bool?
    let firstName: String?

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case screenName = "screen_name"
        case online, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case onlineInfo = "online_info"
        case sex
        case isClosed = "is_closed"
        case firstName = "first_name"
    }

    init(canAccessClosed: Bool, screenName: String, online: Int, id: Int, photo100: String, lastName: String, photo50: String, onlineInfo: OnlineInfo, sex: Int, isClosed: Bool, firstName: String) {
        self.canAccessClosed = canAccessClosed
        self.screenName = screenName
        self.online = online
        self.id = id
        self.photo100 = photo100
        self.lastName = lastName
        self.photo50 = photo50
        self.onlineInfo = onlineInfo
        self.sex = sex
        self.isClosed = isClosed
        self.firstName = firstName
    }
}

// MARK: - OnlineInfo
class OnlineInfo: Codable {
    let visible, isMobile, isOnline: Bool?

    enum CodingKeys: String, CodingKey {
        case visible
        case isMobile = "is_mobile"
        case isOnline = "is_online"
    }

    init(visible: Bool, isMobile: Bool, isOnline: Bool) {
        self.visible = visible
        self.isMobile = isMobile
        self.isOnline = isOnline
    }
}

