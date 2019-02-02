



import Foundation

typealias JsonPlaceHolder = [JsonPlaceHolderElement]

struct JsonPlaceHolderElement: Codable {
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
