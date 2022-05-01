//
//  PersonModel.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/01.
//

import Foundation

// MARK: - WelcomeElement
struct PersonModel: Codable {
    let name: String
    let addressInfo: AddressInfo
    let image: String

    enum CodingKeys: String, CodingKey {
        case name
        case addressInfo = "address_info"
        case image
    }
}

// MARK: - AddressInfo
struct AddressInfo: Codable {
    let contry, city: String
}

extension PersonModel {
    static let sampleData = MockParser.load([PersonModel].self, from: "PersonMock")
}
