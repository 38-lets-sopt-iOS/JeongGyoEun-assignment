//
//  LoginViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/24/26.
//
import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = .appWhite
        label.font = .head2
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요"
        label.textColor = .appGray200
        label.font = .body1
        label.numberOfLines = 2
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 47))
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        textField.textColor = .appWhite
        textField.font = .body2
        textField.backgroundColor = .appGray600
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "email@address.com",
            attributes: [
                .foregroundColor: UIColor.appGray300,
                .font: UIFont.body2
            ]
        )
        return textField
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.tintColor = .appGray300
        button.isHidden = true
        return button
    }()
    
    private let validImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "checkOff")
        imageView.isHidden = true
        return imageView
    }()
    
    private let rightContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.appGray200, for: .normal)
        button.titleLabel?.font = .subhead2
        button.backgroundColor = .appGray400
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlack
        setUI()
        setLayout()
        setRightViewLayout()
        updateEmailState()
    }
    
    private func setUI() {
        [titleLabel, descriptionLabel, emailTextField, nextButton].forEach {
            view.addSubview($0)
        }
        
        rightContainerView.addSubview(clearButton)
        rightContainerView.addSubview(validImageView)
        emailTextField.rightView = rightContainerView
        
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.equalToSuperview().offset(31)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(30)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(26)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }
    
    private func setRightViewLayout() {
        rightContainerView.snp.makeConstraints {
                $0.width.equalTo(58)
                $0.height.equalTo(47)
            }

        validImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(24)
        }
        
        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(validImageView.snp.leading).offset(-4)
            $0.width.height.equalTo(24)
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    private func updateEmailState() {
        let text = emailTextField.text ?? ""
        let hasText = !text.isEmpty
        let isValid = isValidEmail(text)
        
        if !hasText {
            clearButton.isHidden = true
            validImageView.isHidden = true
            nextButton.isEnabled = false
            nextButton.backgroundColor = .appGray400
            nextButton.setTitleColor(.appGray200, for: .normal)
            return
        }
        
        clearButton.isHidden = false
        validImageView.isHidden = false
        
        if isValid {
            validImageView.image = UIImage(named: "checkOn")
            nextButton.isEnabled = true
            nextButton.backgroundColor = .appPink
            nextButton.setTitleColor(.appWhite, for: .normal)
        } else {
            validImageView.image = UIImage(named: "checkOff")
            nextButton.isEnabled = false
            nextButton.backgroundColor = .appGray400
            nextButton.setTitleColor(.appGray200, for: .normal)
        }
    }
    
    @objc
    private func emailTextFieldDidChange() {
        updateEmailState()
    }
    
    @objc
    private func clearButtonDidTap() {
        emailTextField.text = ""
        updateEmailState()
    }
    
    @objc
    private func nextButtonDidTap() {
        pushToPasswordVC()
    }
    
    private func pushToPasswordVC() {
        let passwordViewController = PasswordViewController()
        self.navigationController?.pushViewController(passwordViewController, animated: true)
    }
}
