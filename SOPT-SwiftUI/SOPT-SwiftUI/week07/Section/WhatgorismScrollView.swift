//
//  WhatgorismScrollView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct WhatgorismScrollView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.watgorism)
                .resizable()
                .frame(width: 79, height: 25.5)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.bottom, 8.5)
            
            SectionTitleView(
                subTitle: "예능부터 드라마까지!",
                showsMoreText: true
            )
            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 13) {
                    ForEach(1...4, id: \.self) { index in
                        Image("poster\(index)")
                            .resizable()
                            .frame(width: 103, height: 153)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 18)
            }
            .padding(.top, 7)
            .padding(.bottom, 45)
        }
    }
}
