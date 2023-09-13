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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        
    }
}
