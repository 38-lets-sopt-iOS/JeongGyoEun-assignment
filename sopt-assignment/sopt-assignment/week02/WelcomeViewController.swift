//
//  WelcomeViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/24/26.
//

import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    var nickname: String?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "watchaLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        let userName = nickname ?? "고객"
        label.text = "\(userName)님\n가입을 환영합니다!"
        label.textColor = .appWhite
        label.font = .head2
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.appWhite, for: .normal)
        button.titleLabel?.font = .subhead2
        button.backgroundColor = .appPink
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlack
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [logoImageView, welcomeLabel, mainButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(85)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(319)
            $0.height.equalTo(167)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }
}
