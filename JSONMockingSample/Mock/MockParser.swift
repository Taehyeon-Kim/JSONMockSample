//
//  MockParser.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/01.
//

import Foundation

final class MockParser {
    static func load<D: Codable>(_ type: D.Type, from resourceName: String) -> D? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            return nil
        }
        
        guard let jsonString = try? String(contentsOfFile: path) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        
        guard let data = data else { return nil }
        return try? decoder.decode(type, from: data)
    }
}
