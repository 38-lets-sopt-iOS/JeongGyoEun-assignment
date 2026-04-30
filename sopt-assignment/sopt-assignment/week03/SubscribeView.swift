//
//  SubscribeView.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/1/26.
//

import UIKit
import SnapKit
import Then

class SubscribeView: UIView {
        
    let header = UIView().then {
        $0.backgroundColor = .appBlack
    }
    
    let titleLabel = UILabel().then {
        $0.text = "구독"
        $0.textColor = .appWhite
        $0.font = .head1
    }
    
    let videoIcon = UIImageView().then { $0.image = .video }
    let notificationIcon = UIImageView().then { $0.image = .notification }
    let profileIcon = UIImageView().then { $0.image = .profile }
    
    let floatingBannerView = UIView().then {
        $0.backgroundColor = .appPink
        $0.layer.cornerRadius = 10
    }

    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createCompositionalLayout()
    ).then {
        $0.backgroundColor = .appBlack
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 151, left: 0, bottom: 100, right: 0)
        $0.contentInsetAdjustmentBehavior = .never
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .appBlack
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setUI() {
        self.addSubviews(collectionView, header, floatingBannerView)
        header.addSubviews(titleLabel, videoIcon, notificationIcon, profileIcon)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        header.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(151)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(30)
        }
        
        profileIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(61)
        }
        
        notificationIcon.snp.makeConstraints {
            $0.trailing.equalTo(profileIcon.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(61)
        }
        
        videoIcon.snp.makeConstraints {
            $0.trailing.equalTo(notificationIcon.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(61)
        }
        
        floatingBannerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(79)
            $0.height.equalTo(86)
        }
    }
        
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(273), heightDimension: .absolute(399))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            section.interGroupSpacing = 13
            section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 20, bottom: 45, trailing: 20)
            return section
        }
    }
}
