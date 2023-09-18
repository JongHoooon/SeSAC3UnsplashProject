//
//  NumberViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/18.
//

import Foundation

final class NumberViewModel {
    
    var number = Observable<String?>("1000")
    var result = Observable("1,327,000") // result label
    
    func convertNumber() {
        guard let text = number.value
        else {
            result.value = "값을 입력해주세요"
            return
        }
        
        guard let textToNumber = Int(text)
        else {
            result.value = "100만원 이하의 숫자를 입력해주세요."
            return
        }
        
        guard textToNumber > 0, textToNumber <= 1000000
        else {
            result.value = "환전 범주는 100만원 이하입니다."
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let decimalNumber = numberFormatter.string(for: textToNumber * 1327) ?? ""
        
        result.value = "환전 금액은 \(decimalNumber)입니다."
    }
}
