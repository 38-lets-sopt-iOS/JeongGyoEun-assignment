//
//  PreviewScrollView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct PreviewScrollView: View {
    var body: some View {
        VStack(spacing: 0) {
            SectionTitleView(
                title: "공개 예정 콘텐츠",
                showsMoreText: true
            )
            .padding(.horizontal, 22)
            
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
            .padding(.top, 15)
            .padding(.bottom, 45)
        }
    }
}
