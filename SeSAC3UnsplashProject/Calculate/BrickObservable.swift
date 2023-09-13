//
//  BrickObservable.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import Foundation

class Person {
    
    var luckyNumber: Int?
    var listener: (() -> Void)?
    var name: String {
        didSet {
            listener?()
            print("사용자의 이름이 \(name)로 변경되었습니다. 당신이 뽑은 행운의 숫자는 \(luckyNumber ?? 0)입니다.")
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    func introduce(number: Int, sample: @escaping () -> Void) {
        print("저는 \(name)이고 행운의 숫자는 \(number)입니다.")
        sample()
        luckyNumber = number
        listener = sample
    }
}
