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
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "email@address.com"
        textField.textColor = .appGray300
        textField.font = .body2
        textField.backgroundColor = .appGray600
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.appGray200, for: .normal)
        button.titleLabel?.font = .subhead2
        button.backgroundColor = .appGray400
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI(){
        [titleLabel, descriptionLabel, emailTextField, nextButton].forEach{self.view.addSubview($0)}
        
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
}
