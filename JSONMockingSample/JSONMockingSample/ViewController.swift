//
//  ViewController.swift
//  JSONMockingSample
//
//  Created by taehy.k on 2022/05/01.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("1️⃣", Schedule.sampleData)
        print("2️⃣", PersonModel.sampleData)
        print("3️⃣", CommentList.sampleData)
        

        // MARK: - cf) Encode

        let dataModel = PersonModel(name: "sample", addressInfo: .init(contry: "contry", city: "city"), image: "03")
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dataModel),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
        }
    }
}

