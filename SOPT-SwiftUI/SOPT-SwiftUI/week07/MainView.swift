//
//  MainView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomTabBarView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("appBlack").ignoresSafeArea())
    }
}
