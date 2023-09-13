//
//  LottoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by JongHoon on 2023/09/13.
//

import UIKit

final class LottoViewController: UIViewController {
    
    private let viewModel = LottoViewModel()
    
    @IBOutlet private var firstNumberLabel: UILabel!
    @IBOutlet private var secondNumberLabel: UILabel!
    @IBOutlet private var thirdNumberLabel: UILabel!
    @IBOutlet private var fourthNumberLabel: UILabel!
    @IBOutlet private var fifthNumberLabel: UILabel!
    @IBOutlet private var sixthNumberLabel: UILabel!
    @IBOutlet private var seventhNumberLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

private extension LottoViewController {
    func bind() {
        
        // MARK: - Input
        viewModel.viewDidLoad()
        
        // MARK: - Output
        viewModel.number1.bind { [weak self] value in
            self?.firstNumberLabel.text = "\(value)"
        }
        viewModel.number2.bind { [weak self] value in
            self?.secondNumberLabel.text = "\(value)"
        }
        viewModel.number3.bind { [weak self] value in
            self?.thirdNumberLabel.text = "\(value)"
        }
        viewModel.number4.bind { [weak self] value in
            self?.fourthNumberLabel.text = "\(value)"
        }
        viewModel.number5.bind { [weak self] value in
            self?.fifthNumberLabel.text = "\(value)"
        }
        viewModel.number6.bind { [weak self] value in
            self?.sixthNumberLabel.text = "\(value)"
        }
        viewModel.number7.bind { [weak self] value in
            self?.seventhNumberLabel.text = "\(value)"
        }
        viewModel.lottoMoneyText.bind { [weak self] value in
            self?.moneyLabel.text = value
        }
    }
}
