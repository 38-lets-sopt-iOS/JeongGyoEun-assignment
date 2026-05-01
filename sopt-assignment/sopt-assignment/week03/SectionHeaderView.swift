//
//  SectionHeaderView.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/1/26.
//

import UIKit
import Then
import SnapKit

class SectionHeaderView: UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    
    let sectionTitleLabel = UILabel().then {
        $0.textColor = .appWhite
        $0.font = .head3
    }
    
    let sectionSubTitleLabel = UILabel().then {
        $0.textColor = .appWhite
        $0.font = .subhead1
    }
    
    let sectionTitleIcon = UIImageView().then {
        $0.image = .watgorism
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(sectionTitleLabel, sectionSubTitleLabel, sectionTitleIcon)
        
        sectionTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        sectionTitleIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(title: String, subTitle: String, showIcon: Bool) {
        sectionTitleLabel.text = title
        sectionSubTitleLabel.text = subTitle
        sectionTitleIcon.isHidden = !showIcon
        
        sectionSubTitleLabel.snp.remakeConstraints {
            if showIcon {
                $0.top.equalTo(sectionTitleIcon.snp.bottom).offset(8.5)
            } else {
                $0.top.equalTo(sectionTitleLabel.snp.bottom).offset(3)
            }
            $0.leading.equalToSuperview().inset(24)
        }
    }
}
