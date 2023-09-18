//
//  Relay.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/18.
//

import Foundation

class Relay<T> {
    
    private var listener: ((_ value: T) -> Void)?
    
    private var _value: T {
        didSet {
            listener?(_value)
        }
    }
    
    init(value: T) {
        self._value = value
    }
}

extension Relay {
    func bind(_ closure: @escaping (_ value: T) -> Void) {
        print(#function)
        closure(_value)
        listener = closure
    }
    
    func accept(_ value: T) {
        self._value = value
    }
    
    var value: T {
        return _value
    }
}
