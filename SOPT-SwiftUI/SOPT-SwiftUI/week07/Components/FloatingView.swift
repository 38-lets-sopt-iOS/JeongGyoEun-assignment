//
//  FloatingView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//


import SwiftUI

struct FloatingView: View {
    var body: some View {
        ZStack {
            Rectangle()
            Color(.appPink)
                .cornerRadius(10)
            
            HStack(alignment: .top) {
                Image(.ticket)
                
                VStack (alignment: .leading, spacing: 0) {
                    Text("매주 500편 이상 신작 업데이트!")
                        .foregroundStyle(.appWhite)
                        .font(.subHead2)
                        .padding(.bottom, 3)
                    
                    Text("지금 구독을 시작하고 다양한 콘텐츠를 무제한 감상해보세요")
                        .foregroundStyle(.appWhite)
                        .font(.body2)
                        .padding(.bottom, 13)
                    
                    Text("구독 시작하기")
                        .foregroundStyle(.appWhite)
                        .font(.body2)
                }
                .padding(.top, 3)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 11)
            .padding(.leading, 16)
        }
        .frame(height: 86)
    }
}
