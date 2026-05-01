//
//  WatchaPartyViewCell.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/1/26.
//

import UIKit
import SnapKit
import Then

class WatchaPartyViewCell: UICollectionViewCell {
    static let identifier = "WatchaPartyViewCell"
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let bottomBoxView = UIView().then {
        $0.backgroundColor = .appGray600
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.clipsToBounds = true
    }
    
    private let labelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 6
        $0.alignment = .leading
    }
    
    private let timeLabel = UILabel().then {
        $0.textColor = .appPink
        $0.font = .body1
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .subhead3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(bottomBoxView)
        bottomBoxView.addSubview(labelStackView)
        
        labelStackView.addArrangedSubview(timeLabel)
        labelStackView.addArrangedSubview(titleLabel)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomBoxView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.leading.equalToSuperview().inset(8)
        }
    }
    
    func dataBind(poster: UIImage?, timeText: String, titleText: String) {
        posterImageView.image = poster
        timeLabel.text = timeText
        titleLabel.text = titleText
    }
}
