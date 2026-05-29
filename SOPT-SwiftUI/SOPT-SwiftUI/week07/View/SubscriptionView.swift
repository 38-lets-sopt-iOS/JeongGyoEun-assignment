//
//  SubscriptionView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct SubscriptionView: View {
    @State private var scrollOffset: CGFloat = 0

    private var isHeaderCollapsed: Bool {
        scrollOffset > 50
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HeaderView(isCollapsed: isHeaderCollapsed)

                ScrollView {
                    LazyVStack(spacing: 0) {
                        MainPosterScrollView()
                        NewContentsScrollView()
                        WhatgorismScrollView()
                        PreviewScrollView()
                        WhatchaPartyScrollView()
                    }
                    .background(Color("appBlack"))
                }
                .scrollContentBackground(.hidden)
                .onScrollGeometryChange(for: CGFloat.self) { geometry in
                    geometry.contentOffset.y
                } action: { _, newOffset in
                    scrollOffset = newOffset
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color("appBlack"))
            }

            FloatingView()
                .padding(.horizontal, 12)
                .padding(.bottom, 14)
        }
        .background(Color("appBlack").ignoresSafeArea())
    }
}
