//
//  NewContentsScrollView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct NewContentsScrollView: View {
    var body: some View {
        VStack(spacing: 0) {
            SectionTitleView(
                title: "방금 막 도착한 신상 컨텐츠",
                subTitle: "예능부터 드라마까지!",
            )
            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(1...4, id: \.self) { index in
                        Image("horizontal_poster\(index)")
                            .resizable()
                            .frame(width: 321, height: 180)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 27)
            }
            .padding(.top, 15)
            .padding(.bottom, 45)
        }
    }
}
