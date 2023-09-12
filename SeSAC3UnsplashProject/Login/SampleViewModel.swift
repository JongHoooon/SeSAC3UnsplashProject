//
//  SampleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import Foundation

final class SampleViewModel {
    var list = [
        User(name: "Hue", age: 21),
        User(name: "Jack", age: 23),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    var numberOfRowsInsection: Int {
        return list.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
