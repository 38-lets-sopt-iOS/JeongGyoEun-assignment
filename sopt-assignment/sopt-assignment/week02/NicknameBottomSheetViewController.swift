//
//  NicknameBottomSheetViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/24/26.
//
import UIKit
import SnapKit

final class NicknameBottomSheetViewController: UIViewController {
    
    var onNicknameConfigured: ((String) -> Void)?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .appWhite
        label.font = .subhead1
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        
        let leftPaddingView = UIView()
        leftPaddingView.snp.makeConstraints {
            $0.width.equalTo(15)
            $0.height.equalTo(47)
        }
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        textField.textColor = .appWhite
        textField.font = .body2
        textField.backgroundColor = .appGray600
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.clearButtonMode = .whileEditing
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [
                .foregroundColor: UIColor.appGray200,
                .font: UIFont.body2
            ]
        )
        return textField
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.appGray200, for: .normal)
        button.titleLabel?.font = .subhead1
        button.backgroundColor = .appGray600
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appGray400?.withAlphaComponent(0.2)
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [titleLabel, nicknameTextField, completeButton].forEach {
            view.addSubview($0)
        }
        
        nicknameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(42)
            $0.leading.equalToSuperview().offset(24)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        completeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }
    
    @objc private func textFieldDidChange() {
        let hasText = !(nicknameTextField.text?.isEmpty ?? true)
        
        if hasText {
            completeButton.isEnabled = true
            completeButton.backgroundColor = .appPink
            completeButton.setTitleColor(.appWhite, for: .normal)
        } else {
            completeButton.isEnabled = false
            completeButton.backgroundColor = .appGray400
            completeButton.setTitleColor(.appGray200, for: .normal)
        }
    }
    
    @objc private func completeButtonDidTap() {
        guard let nickname = nicknameTextField.text else { return }
        onNicknameConfigured?(nickname)
        dismiss(animated: true, completion: nil)
    }
}
