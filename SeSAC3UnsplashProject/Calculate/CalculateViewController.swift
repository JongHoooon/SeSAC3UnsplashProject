//
//  CalculateViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    private let viewModel = CalculateViewModel()
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    @objc func firstTextFieldChanged() {
        viewModel.firstNumber.value = firstTextField.text ?? ""
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    @objc func secondTextFieldChanged() {
        viewModel.secondNumber.value = secondTextField.text ?? ""
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(
            self,
            action: #selector(firstTextFieldChanged),
            for: .editingChanged
        )
        secondTextField.addTarget(
            self,
            action: #selector(secondTextFieldChanged),
            for: .editingChanged
        )
        
//        let person = CustomObservable("새싹이")
//        person.value = "카스타드"
//        person.value = "칙촉"
//        person.introduce { [weak self] name in
//            self?.resultLabel.text = name
//            self?.view.backgroundColor = [
//                UIColor.orange,
//                UIColor.lightGray,
//                UIColor.magenta
//            ].randomElement()!
//        }
//
//        DispatchQueue.main.asyncAfter(
//            deadline: .now() + 1,
//            execute: {
//                person.value = "바나나"
//                print("===1초뒤?====")
//        })
//
//        DispatchQueue.main.asyncAfter(
//            deadline: .now() + 3,
//            execute: {
//                person.value = "수박"
//                print("===3초뒤?====")
//        })
//
//        firstTextField.text = viewModel.firstNumber.value
//        secondTextField.text = viewModel.secondNumber.value
        
        viewModel.firstNumber.bind { [weak self] number in
            self?.firstTextField.text = number
            print("first number chnaged \(number ?? "")")
        }
        
        viewModel.secondNumber.bind { [weak self] number in
            self?.secondTextField.text = number
            print("second number changed \(number ?? "")")
        }
        
        viewModel.resultText.bind { [weak self] text in
            self?.resultLabel.text = text
        }
        
        viewModel.tempText.bind { [weak self] text in
            self?.tempLabel.text = text
        }
    }
}
