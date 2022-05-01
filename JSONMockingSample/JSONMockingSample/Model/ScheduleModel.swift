//
//  ScheduleModel.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/01.
//

import Foundation

struct Schedule: Codable {
    let periods : [ String: [Inner] ]
}

struct Inner: Codable {
    let firstName: String
    let lastName: String
}

extension Schedule {
    static let sampleData = MockParser.load(Schedule.self, from: "ScheduleMock")
}
