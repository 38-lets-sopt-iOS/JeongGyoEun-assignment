//
//  CustomTabBarView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        TabView {
            tabContent(SubscriptionView(), icon: "Subscribe", title: "구독")
            tabContent(PurchaseView(), icon: "Category", title: "개별 구매")
            tabContent(WebtoonView(), icon: "Wallet", title: "웹툰")
            tabContent(SearchView(), icon: "Search", title: "찾기")
            tabContent(LibraryView(), icon: "Folder", title: "보관함")
        }
        .tint(.white)
        .background(Color("appBlack").ignoresSafeArea())
    }

    private func tabContent<Content: View>(
        _ content: Content,
        icon: String,
        title: String
    ) -> some View {
        content
            .toolbarBackground(Color("appBlack"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Image(icon)
                    .renderingMode(.template)
                Text(title)
            }
    }
}
