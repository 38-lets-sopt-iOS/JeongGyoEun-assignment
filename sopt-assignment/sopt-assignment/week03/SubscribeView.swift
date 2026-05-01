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
    
    let bannerImageView = UIImageView().then {
        $0.image = .ticket
    }
    
    let bannerHeadLabel = UILabel().then {
        $0.text = "매주 500편 이상 신작 업데이트!"
        $0.textColor = .appWhite
        $0.font = .subhead2
    }
    
    let bannerSubHeadLabel = UILabel().then {
        $0.text = "지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요"
        $0.textColor = .appWhite
        $0.font = .body2
    }
    
    let subscribeButton = UIButton().then {
        $0.setTitle("구독 시작하기", for: .normal)
        $0.setTitleColor(.appWhite, for: .normal)
        $0.titleLabel?.font = .body2
        $0.layer.borderWidth = 0
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
        floatingBannerView.addSubviews(bannerImageView, bannerHeadLabel, bannerSubHeadLabel, subscribeButton)
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
            $0.bottom.equalToSuperview().inset(113)
            $0.height.equalTo(86)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bannerHeadLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(50)
        }
        
        bannerSubHeadLabel.snp.makeConstraints {
            $0.top.equalTo(bannerHeadLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(50)
        }
        
        subscribeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(50)
            $0.width.equalTo(66)
            $0.height.equalTo(14)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(273), heightDimension: .absolute(399))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 12
                section.contentInsets = NSDirectionalEdgeInsets(top: 28, leading: 0, bottom: 45, trailing: 0)
                return section
            } else if sectionIndex == 1 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(321), heightDimension: .absolute(180))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 12
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(62))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                return section
                
            } else if sectionIndex == 2 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(103), heightDimension: .absolute(153))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 13
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(62))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
            else if sectionIndex == 4 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(196), heightDimension: .absolute(185))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 12
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0)
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(39))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
            else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(103), heightDimension: .absolute(153))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 13
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 0)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(39))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
        }
    }
}
