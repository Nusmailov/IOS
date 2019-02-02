//
//  JsonParsing.swift
//  JsonParsing
//
//  Created by Nurzhigit Smailov on 2/1/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

typealias Posts = [Post]

struct Post: Codable {
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
