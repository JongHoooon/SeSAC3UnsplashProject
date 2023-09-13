//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/12.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let sample = Observable(value: "ooo") 
//        sample.bind { nick in
//            print(nick, nick)
//        }
//        sample.value = "고래밥"
//        sample.value = "고래밥"
//        sample.value = "고래밥fff"
        
        loginButton.addTarget(
            self,
            action: #selector(loginButtonClicked),
            for: .touchUpInside
        )
        idTextField.addTarget(
            self,
            action: #selector(idTextFieldChanged),
            for: .editingChanged
        )
        pwTextField.addTarget(
            self,
            action: #selector(pwTextFieldChanged),
            for: .editingChanged
        )
        
        viewModel.id.bind { text in
            print("bind \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }
    }
    
    @objc func idTextFieldChanged() {
        print("====")
        viewModel.id.value = idTextField.text ?? ""
        viewModel.checkValidation()
    }
    
    @objc func pwTextFieldChanged() {
        print("====")
        viewModel.pw.value = pwTextField.text ?? ""
        viewModel.checkValidation()
    }
    
    @objc func loginButtonClicked() {
        viewModel.signIn {
            print("로그인 성공했기 떄문에 얼럿 띄우기")
        }
    }
}
