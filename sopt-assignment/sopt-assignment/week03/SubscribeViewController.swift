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
        UIImage.poster1,
        UIImage.poster2,
        UIImage.poster3,
        UIImage.poster4,
        UIImage.poster1,
    ]
    
    private let horizontalPosterList: [UIImage?] = [
        UIImage.horizontalPoster1,
        UIImage.horizontalPoster2,
        UIImage.horizontalPoster3,
        UIImage.horizontalPoster4,
        UIImage.horizontalPoster1,
    ]
    
    private let basicPosterList: [UIImage?] = [
        UIImage.poster4,
        UIImage.poster3,
        UIImage.poster2,
        UIImage.poster1,
        UIImage.poster4,
        UIImage.poster3,
        UIImage.poster2,
        UIImage.poster1,
        UIImage.poster4,
        UIImage.poster3,
    ]
    
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
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
        rootView.collectionView.register(BasicPosterViewCell.self, forCellWithReuseIdentifier: BasicPosterViewCell.identifier)
        rootView.collectionView.register(WatchaPartyViewCell.self, forCellWithReuseIdentifier: WatchaPartyViewCell.identifier)
    }
}

extension SubscibeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return mainPosterList.count
        } else if section == 1{
            return horizontalPosterList.count
        }
        else if section == 4{
            return 3
        }
        else { return basicPosterList.count }  }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(mainPosterList[indexPath.row])
            return cell
        }
        
        else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalPosterViewCell.identifier, for: indexPath) as? HorizontalPosterViewCell else {
                return UICollectionViewCell()
            }
            cell.dataBind(horizontalPosterList[indexPath.row])
            return cell
        }
        
        else if indexPath.section == 4 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WatchaPartyViewCell.identifier, for: indexPath) as? WatchaPartyViewCell else {
                return UICollectionViewCell()
            }
            
            if indexPath.row == 0 {
                cell.dataBind(poster: .horizontalPoster1,
                              timeText: "오늘 21:13에 시작",
                              titleText: "# 왕과 사는 남자")
            } else if indexPath.row == 1 {
                cell.dataBind(poster: .horizontalPoster2,
                              timeText: "오늘 22:22 시작",
                              titleText: "# 파묘")
            } else if indexPath.row == 2 {
                cell.dataBind(poster: .horizontalPoster3,
                              timeText: "오늘 00:23 시작",
                              titleText: "# 살목지")
            }
            return cell
            
        }
        
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasicPosterViewCell.identifier, for: indexPath) as? BasicPosterViewCell else {
                return UICollectionViewCell()
            }
            if indexPath.row < basicPosterList.count {
                cell.dataBind(basicPosterList[indexPath.row])
            }
            return cell
        }
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
                header.configure(title: "방금 막 도착한 신상 컨텐츠", subTitle: "예능부터 드라마까지!", showIcon: false)
            }
            else if indexPath.section == 2 {
                header.configure(title: "", subTitle: "예능부터 드라마까지!", showIcon: true)
            }
            else if indexPath.section == 3 {
                header.configure(title: "공개 예정 콘텐츠", subTitle: "", showIcon: false)
            }
            else if indexPath.section == 4 {
                header.configure(title: "왓챠 파티", subTitle: "", showIcon: false)
            }
            else {
                header.isHidden = true
            }
            
            return header
        }
        return UICollectionReusableView()
    }
}


