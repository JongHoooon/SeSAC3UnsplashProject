//
//  NumberViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/18.
//

import UIKit

final class NumberViewController: UIViewController {
    
    private let viewModel = NumberViewModel()
    
    @IBOutlet private var numberTextField: UITextField!
    @IBOutlet private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        numberTextField.addTarget(
            self,
            action: #selector(numberTextFieldChanged),
            for: .editingChanged
        )
    }
    
    @objc
    func numberTextFieldChanged() {
        viewModel.number.value = numberTextField.text
        viewModel.convertNumber()
    }
}

private extension NumberViewController {
    func bindData() {
        viewModel.number.bind { [weak self] value in
            self?.numberTextField.text = value
        }
        viewModel.result.bind { [weak self] value in
            self?.resultLabel.text = value
        }
    }
}
