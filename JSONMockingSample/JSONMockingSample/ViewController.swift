//
//  ViewController.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    var scheduleData: Schedule?
    var personData: [PersonModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let scheduleData = Schedule.sampleData else { return }
        guard let personData = PersonModel.sampleData else { return }
        
        print("1️⃣", scheduleData)
        print("2️⃣", personData)
        

        // MARK: - cf) Encode

        let dataModel = PersonModel(name: "sample", addressInfo: .init(contry: "contry", city: "city"), image: "03")
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dataModel),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    }
}

