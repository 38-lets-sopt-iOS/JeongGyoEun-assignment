//
//  PasswordViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/24/26.
//

import UIKit
import SnapKit

final class PasswordViewController: UIViewController {
    private var userNickname: String?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = .appWhite
        label.font = .head2
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var passwordDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        label.font = .body1
        label.textColor = .appGray200
        label.numberOfLines = 2
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        
        let leftPaddingView = UIView()
        leftPaddingView.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(47)
        }
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        textField.isSecureTextEntry = true
        textField.textColor = .appWhite
        textField.font = .body2
        textField.backgroundColor = .appGray600
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호 입력",
            attributes: [
                .foregroundColor: UIColor.appGray200,
                .font: UIFont.body2
            ]
        )
        return textField
    }()
    
    private let rightContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .appGray300
        button.isHidden = true
        return button
    }()
    
    private let eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "eyeOff"), for: .normal)
        button.setImage(UIImage(named: "eyeOn"), for: .selected)
        button.isHidden = true
        return button
    }()
    
    private let validationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "enableOff")
        return imageView
    }()
    
    private let validationLabel: UILabel = {
        let label = UILabel()
        label.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        label.textColor = .appGray100
        label.font = .body2
        return label
    }()
    
    private let nicknameSettingButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.body2,
            .foregroundColor: UIColor.appGray300,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: "닉네임 설정", attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(.appGray200, for: .normal)
        button.titleLabel?.font = .subhead2
        button.backgroundColor = .appGray400
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlack
        setUI()
        setLayout()
        setRightViewLayout()
    }
    
    private func setUI() {
        [titleLabel, passwordDescriptionLabel, passwordTextField,
         validationImageView, validationLabel, nicknameSettingButton, nextButton].forEach {
            view.addSubview($0)}
        
        rightContainerView.addSubview(clearButton)
        rightContainerView.addSubview(eyeButton)
        passwordTextField.rightView = rightContainerView
        passwordTextField.rightViewMode = .always
        
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap), for: .touchUpInside)
        
        nicknameSettingButton.addTarget(self, action: #selector(nicknameSettingButtonDidTap), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(pushToWelcomeVC), for: .touchUpInside)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.equalToSuperview().offset(31)
        }
        
        passwordDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(31)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordDescriptionLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        validationImageView.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.leading.equalTo(passwordTextField.snp.leading)
            $0.width.height.equalTo(13)
        }
        
        validationLabel.snp.makeConstraints {
            $0.centerY.equalTo(validationImageView)
            $0.leading.equalTo(validationImageView.snp.trailing).offset(6)
        }
        
        nicknameSettingButton.snp.makeConstraints {
            $0.top.equalTo(validationLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }
    
    private func setRightViewLayout() {
        rightContainerView.snp.makeConstraints {
            $0.width.equalTo(66)
            $0.height.equalTo(47)
        }
        
        eyeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(24)
        }
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(eyeButton.snp.leading).offset(-1)
            $0.width.height.equalTo(24)
        }
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        // 영문, 숫자, 특수문자 포함 10글자 이상 정규식
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{10,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: password)
    }
    
    private func updatePasswordState() {
        let text = passwordTextField.text ?? ""
        let hasText = !text.isEmpty
        let isValid = isValidPassword(text)
        
        clearButton.isHidden = !hasText
        eyeButton.isHidden = !hasText
        
        if isValid {
            validationImageView.image = UIImage(named: "enableOn")
            validationLabel.textColor = .appGreen
            nextButton.isEnabled = true
            nextButton.backgroundColor = .appPink
            nextButton.setTitleColor(.appWhite, for: .normal)
        } else {
            validationImageView.image = UIImage(named: "enableOff")
            validationLabel.textColor = .appGray100
            nextButton.isEnabled = false
            nextButton.backgroundColor = .appGray400
            nextButton.setTitleColor(.appGray200, for: .normal)
        }
    }
    
    @objc private func passwordTextFieldDidChange() {
        updatePasswordState()
    }
    
    @objc private func clearButtonDidTap() {
        passwordTextField.text = ""
        updatePasswordState()
    }
    
    @objc private func eyeButtonDidTap() {
        eyeButton.isSelected.toggle()
        passwordTextField.isSecureTextEntry = !eyeButton.isSelected
    }
    
    @objc private func nicknameSettingButtonDidTap() {
        let bottomSheetVC = NicknameBottomSheetViewController()
        if let sheet = bottomSheetVC.sheetPresentationController {
            if #available(iOS 16.0, *) { // iOS 16 이상
                let customDetent = UISheetPresentationController.Detent.custom { context in
                    return context.maximumDetentValue * 0.5
                }
                sheet.detents = [customDetent]
            } else { // iOS 15 이하
                sheet.detents = [.medium()]
            }
            sheet.prefersGrabberVisible = true
        }
        bottomSheetVC.onNicknameConfigured = { [weak self] nickname in
            self?.userNickname = nickname
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.body2 ?? UIFont.systemFont(ofSize: 14),
                .foregroundColor: UIColor.appWhite,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            let attributedTitle = NSAttributedString(string: nickname, attributes: attributes)
            self?.nicknameSettingButton.setAttributedTitle(attributedTitle, for: .normal)
        }
        present(bottomSheetVC, animated: true)
    }
    
    @objc private func pushToWelcomeVC() {
        let welcomeController = WelcomeViewController()
        welcomeController.nickname = self.userNickname
        self.navigationController?.pushViewController(welcomeController, animated: true)
    }
}
