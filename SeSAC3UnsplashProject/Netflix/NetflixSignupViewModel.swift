//
//  NetflixSignupViewModel.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/09/12.
//

import Foundation

final class NetflixSignupViewModel {
    let infoText = Relay(value: "회원 정보를 입력해주세요!")
    let id = Relay(value: "")
    let password = Relay(value: "")
    let nickname = Relay(value: "")
    let location = Relay(value: "")
    let recommendation = Relay(value: "")
    let isSingUpButtonEnable = Relay(value: false)
    
    func checkValidation() {
        
        guard id.value.contains("@")
        else {
            infoText.accept("이메일에 @가 포함되어야 합니다.")
            isSingUpButtonEnable.accept(false)
            return
        }

        guard 6...10 ~= password.value.count
        else {
            infoText.accept("비밀번호는 6자 이상 10자리 이하만 가능합니다.")
            isSingUpButtonEnable.accept(false)
            return
        }
        
        guard 2 <= nickname.value.count
        else {
            infoText.accept("닉네임은 2자 이상만 가능합니다.")
            isSingUpButtonEnable.accept(false)
            return
        }
        
        guard 1 <= location.value.count
        else  {
            infoText.accept("위치 정보를 입력해주세요")
            isSingUpButtonEnable.accept(false)
            return
        }
        
        guard 6 == recommendation.value.count
        else {
            infoText.accept("추천 코드는 6자 입니다.")
            isSingUpButtonEnable.accept(false)
            return
        }
        
        infoText.accept("회원가입을 완료해 주세요!")
        isSingUpButtonEnable.accept(true)
    }
    
    func signup(completion: @escaping () -> Void) {
        print("회원 가입 성공!")
        completion()
    }
}
