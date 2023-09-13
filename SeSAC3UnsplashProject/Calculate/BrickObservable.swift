//
//  BrickObservable.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import Foundation

class CustomObservable<T> {
    
    var listener: ((_ value: T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
            print("사용자의 이름이 \(value)로 변경되었습니다.")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func introduce(_ sample: @escaping (_ value: T) -> Void) {
        print("저는 \(value)입니다.")
        sample(value)
        listener = sample
    }
}
