// To parse the JSON, add this file to your project and do:
//
//   let postVK = try? newJSONDecoder().decode(PostVK.self, from: jsonData)

import Foundation

struct PostVK: Codable {
    let response: Response
}

struct Response: Codable {
    let count: Int
    let items: [Item]
    
}

struct Item: Codable {
    let id, fromID, ownerID, date: Int
    let markedAsAds: Int
    let postType: PostType
    let text: String
    let postSource: PostSource
    let comments: Comments
    let likes: Likes
    let reposts: Reposts
    let views: Views
    let attachments: [Attachment]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fromID = "from_id"
        case ownerID = "owner_id"
        case date
        case markedAsAds = "marked_as_ads"
        case postType = "post_type"
        case text
        case postSource = "post_source"
        case comments, likes, reposts, views, attachments
    }
}

struct Attachment: Codable {
    let type: AttachmentType
    let link: Link?
    let photo: AttachmentPhoto?
    let video: Video?
}

struct Link: Codable {
    let url: String
    let title: String
    let caption: String?
    let description: String
    let photo: LinkPhoto?
    let button: Button?
    let target: String?
}

struct Button: Codable {
    let title: String
    let action: Action
}

struct Action: Codable {
    let type: String
    let url: String
}

struct LinkPhoto: Codable {
    let id, albumID, ownerID: Int
    let sizes: [Size]
    let text: String
    let date: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case ownerID = "owner_id"
        case sizes, text, date
    }
}

struct Size: Codable {
    let type: String
    let url: String
    let width, height: Int
}

struct AttachmentPhoto: Codable {
    let id, albumID, ownerID, userID: Int
    let sizes: [Size]
    let text: String
    let date: Int
    let accessKey: String
    let postID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case albumID = "album_id"
        case ownerID = "owner_id"
        case userID = "user_id"
        case sizes, text, date
        case accessKey = "access_key"
        case postID = "post_id"
    }
}

enum AttachmentType: String, Codable {
    case link = "link"
    case photo = "photo"
    case video = "video"
}

struct Video: Codable {
    let id, ownerID: Int
    let title: String
    let duration: Int
    let description: String
    let date, comments, views, width: Int
    let height: Int
    let photo130, photo320, photo800: String
    let accessKey: String
    let firstFrame320, firstFrame160, firstFrame130, firstFrame800: String
    let canAdd: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case title, duration, description, date, comments, views, width, height
        case photo130 = "photo_130"
        case photo320 = "photo_320"
        case photo800 = "photo_800"
        case accessKey = "access_key"
        case firstFrame320 = "first_frame_320"
        case firstFrame160 = "first_frame_160"
        case firstFrame130 = "first_frame_130"
        case firstFrame800 = "first_frame_800"
        case canAdd = "can_add"
    }
}

struct Comments: Codable {
    let count, canPost: Int
    let groupsCanPost: Bool
    
    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
        case groupsCanPost = "groups_can_post"
    }
}

struct Likes: Codable {
    let count, userLikes, canLike, canPublish: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
}

struct PostSource: Codable {
    let type: PostSourceType
}

enum PostSourceType: String, Codable {
    case vk = "vk"
}

enum PostType: String, Codable {
    case post = "post"
}

struct Reposts: Codable {
    let count, userReposted: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

struct Views: Codable {
    let count: Int
}
