//
//  NetflixSignupViewController.swift
//  SeSAC3Week6
//
//  Created by JongHoon on 2023/08/25.
//

import UIKit

final class NetflixSignupViewController: UIViewController {
    
    private let viewModel = NetflixSignupViewModel()
    
    // MARK: - UI
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16.0)
        label.text = "정보 라벨"
        return label
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16.0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    private let idTextField = SignupTextField(placeholder: "이메일 주소 또는 전화번호")
    private let passwordTextField = SignupTextField(placeholder: "비밀번호")
    private let nicknameTextField = SignupTextField(placeholder: "닉네임")
    private let locationTextField = SignupTextField(placeholder: "위치")
    private let recommendtaionTextField = SignupTextField(placeholder: "추천 코드 입력")
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .bold)
        button.layer.cornerRadius = 4.0
        return button
    }()
    
    private let moreInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        return label
    }()
    
    private let moreInfoSwitch: UISwitch = {
        let moreInfoSwitch = UISwitch()
        moreInfoSwitch.onTintColor = .systemOrange
        moreInfoSwitch.isOn = true
        return moreInfoSwitch
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureLayout()
        addAction()
        
        idTextField.addTarget(
            self,
            action: #selector(idInput),
            for: .editingChanged
        )
        passwordTextField.addTarget(
            self,
            action: #selector(passwordInput),
            for: .editingChanged
        )
        nicknameTextField.addTarget(
            self,
            action: #selector(nicknameInput),
            for: .editingChanged
        )
        locationTextField.addTarget(
            self,
            action: #selector(locationInput),
            for: .editingChanged
        )
        recommendtaionTextField.addTarget(
            self,
            action: #selector(recommendationInput),
            for: .editingChanged
        )
        
        viewModel.infoText
            .bind { [weak self] text in
                self?.infoLabel.text = text
            }
        
        viewModel.isSingUpButtonEnable
            .bind { [weak self] isEnable in
                self?.signupButton.isEnabled = isEnable
                switch isEnable {
                case true:
                    self?.signupButton.backgroundColor = .white
                    
                case false:
                    self?.signupButton.backgroundColor = .gray
                }
            }
    }
}

// MARK: - Private
private extension NetflixSignupViewController {
    
    @objc
    func idInput() {
        viewModel.id.accept(idTextField.text ?? "")
        viewModel.checkValidation()
    }
    @objc
    func passwordInput() {
        viewModel.password.accept(passwordTextField.text ?? "")
        viewModel.checkValidation()
    }
    @objc
    func nicknameInput() {
        viewModel.nickname.accept(nicknameTextField.text ?? "")
        viewModel.checkValidation()
     }
    @objc
    func locationInput() {
        viewModel.location.accept(locationTextField.text ?? "")
        viewModel.checkValidation()
    }
    @objc
    func recommendationInput() {
        viewModel.recommendation.accept(recommendtaionTextField.text ?? "")
        viewModel.checkValidation()
    }

    func addAction() {
        signupButton.addTarget(
            self,
            action: #selector(signupButtonTapped),
            for: .touchUpInside
        )
    }
    
    func configureNavigationBar() {
        navigationItem.title = "BRICKFLICK"
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 28.0, weight: .black),
            .foregroundColor: UIColor.systemOrange
        ]
    }
    
    func configureLayout() {
        
        [
            idTextField,
            passwordTextField,
            nicknameTextField,
            locationTextField,
            recommendtaionTextField,
            signupButton
        ].forEach {
            textFieldStackView.addArrangedSubview($0)
        }
        
        [
            infoLabel,
            textFieldStackView,
            moreInfoLabel,
            moreInfoSwitch
        ].forEach { view.addSubview($0) }
        
        infoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(textFieldStackView.snp.top).offset(-32.0)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(32.0)
        }
        signupButton.snp.makeConstraints {
            $0.height.equalTo(44.0)
        }
        
        moreInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(textFieldStackView)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(20.0)
        }
        moreInfoSwitch.snp.makeConstraints {
            $0.trailing.equalTo(textFieldStackView)
            $0.centerY.equalTo(moreInfoLabel)
        }
    }
    
    @objc
    func signupButtonTapped() {

    }
}
