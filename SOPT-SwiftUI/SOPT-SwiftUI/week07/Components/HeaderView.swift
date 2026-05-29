//
//  HeaderView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct HeaderView: View {
    let isCollapsed: Bool

    init(isCollapsed: Bool = false) {
        self.isCollapsed = isCollapsed
    }

    var body: some View {
        ZStack {
            Text("구독")
                .font(isCollapsed ? .head2 : .head1)
                .foregroundStyle(.appWhite)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.top, isCollapsed ? 30 : 57)
                .padding(.leading, 28)
            
            HStack(spacing: 20) {
                Image(.video)
                    .resizable()
                    .frame(width: 24, height: 24)
                Image(.notification)
                    .resizable()
                    .frame(width: 24, height: 24)
                Image(.profile)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .foregroundStyle(.appWhite)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing, 30)
            .padding(.top, 18)

            Rectangle()
                .fill(Color("appGray600"))
                .frame(height: 1)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(height: isCollapsed ? 65 : 108)
        .background(Color("appBlack"))
        .animation(.easeInOut(duration: 0.2), value: isCollapsed)
    }
}
