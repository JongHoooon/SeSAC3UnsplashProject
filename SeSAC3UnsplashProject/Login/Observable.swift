//
//  Observable.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import Foundation

class Observable<T> {
    
    private var listener: ((_ value: T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (_ value: T) -> Void) {
        print(#function)
        closure(value)
        listener = closure
    }
}
