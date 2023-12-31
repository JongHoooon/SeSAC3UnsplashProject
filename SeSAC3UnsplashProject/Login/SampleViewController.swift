//
//  SampleViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import UIKit

class User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()     // unique name, age가 같더라도 문제가 생기지 않게 해줌
    let name: String
    let age: Int
    var introduce: String {
        return "\(name), \(age) 살"
    }
    
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
}

final class SampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel = SampleViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var number1 = 10
        var number2 = 3
        
        print(number1 - number2)
        
        number1 = 3
        number2 = 1
        
        /*-------------------------*/
        
        let number3 = Observable(10)
        let number4 = Observable(3)
        
        number3.bind { number in
            print("Observable", number3.value - number4.value)
        }
        
        number3.value = 100
        number3.value = 500
        number3.value = 50
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SampleViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfRowsInsection
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: "sampleCell",
//            for: indexPath
//        )
//        let data = viewModel.cellForRowAt(at: indexPath)
//        cell.textLabel?.text = data.introduce
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "테스트"                              // text label
        content.secondaryText = "안녕하세요 \(indexPath.row)" // detail text label
        cell.contentConfiguration = content                // Protocol as Type
        return cell
    }
}

extension SampleViewController: UITableViewDelegate {
    
}
