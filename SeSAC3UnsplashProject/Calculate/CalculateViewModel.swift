//
//  CalculateViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import Foundation

final class CalculateViewModel {
    var firstNumber: CustomObservable<String?> = CustomObservable("10")
    var secondNumber: CustomObservable<String?> = CustomObservable("20")
    var resultText = CustomObservable("결과는 30입니다.")
    var tempText = CustomObservable("테스트를 위한 텍스트!!")
    
    func format(for number: Int) -> String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(for: number)!
    }
    
    func presentNumberFormat() {
        guard let first = firstNumber.value,
              let firstConvertNumber = Int(first)
        else {
            tempText.value = "숫자로 변활할 수 없는 문자입니다."
            return
        }
                            
        guard let second = secondNumber.value,
              let secondConvertNumber = Int(second)
        else {
            tempText.value = "숫자로 변활할 수 없는 문자입니다."
            return
        }
        tempText.value = format(for: firstConvertNumber + secondConvertNumber)
    }
    
    func calculate() {
        guard let first = firstNumber.value,
              let firstConvertNumber = Int(first)
        else {
            resultText.value = "첫번째 value에서 오류가 발생했습니다!!"
            return
        }
                            
        guard let second = secondNumber.value,
              let secondConvertNumber = Int(second)
        else {
            resultText.value = "두번째 value에서 오류가 발생했습니다!!"
            return
        }
        resultText.value = "결과는 \(firstConvertNumber + secondConvertNumber) 입니다."
    }
}

