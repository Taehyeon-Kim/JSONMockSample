# JSONMockSample

1️⃣ 서버 배포가 완료되기 전.  
2️⃣ API 명세서만(json 형태만) 나왔는데 데이터 연결을 하고 싶을 때.

어차피 우리가 사용하는 데이터의 형식은 json이기 때문에!  
Mock 데이터를 사용해서 미리 데이터를 어떻게 배치해야 할 지 고민해볼 수 있다.

### Mock 데이터
<img width="246" alt="스크린샷 2022-05-01 오후 11 55 55" src="https://user-images.githubusercontent.com/61109660/166151641-83492dd4-e14b-4102-9efd-f330ca6efa56.png">
<img width="1319" alt="스크린샷 2022-05-01 오후 11 56 06" src="https://user-images.githubusercontent.com/61109660/166151644-6ddddd38-d7a5-4f2d-8f1c-591abb1579ba.png">



### MockParser.swift

```swift
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
```

### DataModel

모델은 흔히 우리가 원래 만들던 것처럼 하면 된다.  
하나만 예시로 들자면,

```swift
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

/// 다음 코드는 샘플 데이터로 사용하기 위해 타입 프로퍼티 형태로 선언해놓은 것이다.
extension PersonModel {
    static let sampleData = MockParser.load([PersonModel].self, from: "PersonMock")
}
```

### ViewController.swift
`데이터 사용 예시`

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let scheduleData = Schedule.sampleData else { return }
        guard let personData = PersonModel.sampleData else { return }
        
        print("1️⃣", scheduleData)
        print("2️⃣", personData)
    }
}

```
