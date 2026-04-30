//
//  SubscribeViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/29/26.
//
import UIKit

class SubscibeViewController: UIViewController, UICollectionViewDelegate {
    
    private let rootView = SubscribeView()
    
    private let mainPosterList: [UIImage?] = [
        UIImage(named: "poster1"),
        UIImage(named: "poster2"),
        UIImage(named: "poster3"),
        UIImage(named: "poster4"),
        UIImage(named: "poster1")
    ]
    
    private let horizontalPosterList: [UIImage?] = [
        UIImage.horizontalPoster1,
        UIImage.horizontalPoster2,
        UIImage.horizontalPoster3,
        UIImage.horizontalPoster4,
        UIImage.horizontalPoster1,
    ]
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
    }
    
    private func setDelegate() {
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    private func setRegister() {
        rootView.collectionView.register(MainPosterViewCell.self, forCellWithReuseIdentifier: MainPosterViewCell.identifier)
        rootView.collectionView.register(HorizontalPosterViewCell.self, forCellWithReuseIdentifier: HorizontalPosterViewCell.identifier)
        rootView.collectionView.register(SectionHeaderView.self,
                                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                         withReuseIdentifier: SectionHeaderView.identifier)
    }
}

extension SubscibeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return mainPosterList.count
        } else {
            return horizontalPosterList.count
        }    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.section == 0 {
            cell.dataBind(mainPosterList[indexPath.row])
        } else {
            cell.dataBind(horizontalPosterList[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath
            ) as? SectionHeaderView else {
                return UICollectionReusableView()
            }
            
            if indexPath.section == 1 {
                header.sectionTitleLabel.text = "방금 막 도착한 신상 컨텐츠"
                header.sectionSubTitleLabel.text = "예능부터 드라마까지!"
                header.isHidden = false
            } else if indexPath.section == 2 {
                header.sectionSubTitleLabel.text = "예능부터 드라마까지!"
                header.isHidden = false
            }
            else if indexPath.section == 3 {
                header.sectionTitleLabel.text = "공개 예정 콘텐츠"
                header.isHidden = false
            }
            else if indexPath.section == 4 {
                header.sectionTitleLabel.text = "왓챠 파티"
                header.isHidden = false
            }
            else {
                header.isHidden = true
            }
            return header
        }
        return UICollectionReusableView()
    }
    
    
}
