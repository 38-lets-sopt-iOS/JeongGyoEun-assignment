//
//  SubscribeViewController.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/29/26.
//
import UIKit

class SubscibeViewController: UIViewController {
    
    private let rootView = SubscribeView()
    
    private let mainPosterList: [UIImage?] = [
        UIImage(named: "poster1"),
        UIImage(named: "poster2"),
        UIImage(named: "poster3"),
        UIImage(named: "poster4"),
        UIImage(named: "poster1")
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
    }
}

extension SubscibeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPosterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPosterViewCell.identifier, for: indexPath) as? MainPosterViewCell else {
            return UICollectionViewCell()
        }
        
        cell.dataBind(mainPosterList[indexPath.row])
        return cell
    }
}

extension SubscibeViewController: UICollectionViewDelegate {
}
