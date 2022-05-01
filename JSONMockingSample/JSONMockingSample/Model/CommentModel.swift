//
//  CommentModel.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/02.
//

import Foundation

struct CommentList: Codable {
    let value: [[String : Comment]]
}

struct Comment: Codable {
    let comment: String
    let createdAt: Int
    let userID: Int
    let matchID, nickname: String
    
    enum CodingKeys: String, CodingKey {
        case comment
        case createdAt
        case userID = "user_id"
        case matchID = "match_id"
        case nickname
    }
}

extension CommentList {
    static let sampleData = MockParser.load(CommentList.self, from: "CommentMock")
}

