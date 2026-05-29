//
//  CustomTabBarView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI
import UIKit

struct CustomTabBarView: View {
    init() {
        let tabBarFont = UIFont(name: "Pretendard-Regular", size: 12) ?? .systemFont(ofSize: 12)
        let selectedColor = UIColor.white
        let unselectedColor = UIColor(named: "appGray500") ?? .gray

        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.selected.iconColor = selectedColor
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: selectedColor,
            .font: tabBarFont
        ]
        itemAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)

        itemAppearance.normal.iconColor = unselectedColor
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: unselectedColor,
            .font: tabBarFont
        ]
        itemAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 2)

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "appBlack") ?? .black
        appearance.stackedItemPositioning = .centered
        appearance.stackedItemWidth = 50
        appearance.stackedItemSpacing = 22
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = unselectedColor
    }

    var body: some View {
        TabView {
            SubscriptionView()
                .tabItem {
                    Image("Subscribe")
                        .renderingMode(.template)
                    Text("구독")
                }
            PurchaseView()
                .tabItem {
                    Image("Category")
                        .renderingMode(.template)
                    Text("개별 구매")
                }
            WebtoonView()
                .tabItem {
                    Image("Wallet")
                        .renderingMode(.template)
                    Text("웹툰")
                }
            SearchView()
                .tabItem {
                    Image("Search")
                        .renderingMode(.template)
                    Text("찾기")
                }
            LibraryView()
                .tabItem {
                    Image("Folder")
                        .renderingMode(.template)
                    Text("보관함")
                }
        }
    }
}
