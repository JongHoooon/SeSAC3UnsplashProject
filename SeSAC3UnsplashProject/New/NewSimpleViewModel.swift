//
//  NewSimpleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/18.
//

import Foundation

final class NewSimpleViewModel {
    let list: Observable<[User]> = Observable([])
    let list2 = [
        User(name: "Hue", age: 21),
        User(name: "Hue", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]
    
    func append() {
        list.value = [
            User(name: "Hue", age: 21),
            User(name: "Hue", age: 21),
            User(name: "Bran", age: 20),
            User(name: "Kokojong", age: 20)
        ]
    }
    
    func remove() {
        list.value = []
    }
    
    func removeUser(index: Int) {
        list.value.remove(at: index)
    }
    
    func insertUser(name: String) {
        let user = User(name: name, age: Int.random(in: 10...29))
        list.value.insert(user, at: Int.random(in: 0...2))
    }
}
