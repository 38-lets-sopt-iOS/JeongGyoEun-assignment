//
//  Untitled.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/29/26.
//

import UIKit

class WatchaTabbar : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        setTabBarAppearance()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = 99
        tabBarFrame.origin.y = view.frame.size.height - 99
        tabBar.frame = tabBarFrame
    }
    
    private func setTabbar(){
        let subscibeViewController = SubscibeViewController()
        let purchaseViewController = PurchaseViewController()
        let webtoonViewController = WebtoonViewController()
        let searchViewController = SearchViewController()
        let archiveViewController = ArchiveViewController()
        
        subscibeViewController.tabBarItem = UITabBarItem(title: "구독", image: .subscribe, tag: 1)
        purchaseViewController.tabBarItem = UITabBarItem(title: "개별 구매", image: .category, tag: 2)
        webtoonViewController.tabBarItem = UITabBarItem(title: "웹툰", image: .wallet, tag: 3)
        searchViewController.tabBarItem = UITabBarItem(title: "찾기", image: .search, tag: 4)
        archiveViewController.tabBarItem = UITabBarItem(title: "보관함", image: .folder, tag: 5)
        
        setViewControllers([
            subscibeViewController,
            purchaseViewController,
            webtoonViewController,
            searchViewController,
            archiveViewController
        ], animated: false)
    }
    
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .appBlack
        appearance.shadowColor = .appGray700
        
        let itemAppearance = UITabBarItemAppearance()
        
        itemAppearance.normal.iconColor = .appGray400
        itemAppearance.normal.titleTextAttributes = [.font: UIFont.body2, .foregroundColor: UIColor.appGray400]
        
        
        itemAppearance.selected.iconColor = .appWhite
        itemAppearance.selected.titleTextAttributes = [.font: UIFont.body2, .foregroundColor: UIColor.appWhite]
        
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
