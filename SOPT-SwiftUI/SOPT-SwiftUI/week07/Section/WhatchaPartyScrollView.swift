//
//  WhatchaPartyScrollView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct WhatchaPartyScrollView: View {
    private struct PartyInfo: Identifiable {
        let id: Int
        let imageName: String
        let startText: String
        let tagText: String
    }

    private static let partyInfos = [
        PartyInfo(id: 1, imageName: "horizontal_poster1", startText: "오늘 21:13에 시작", tagText: "# 크라임씬"),
        PartyInfo(id: 2, imageName: "horizontal_poster2", startText: "오늘 22:22에 시작", tagText: "# 폭싹 속았수다"),
        PartyInfo(id: 3, imageName: "horizontal_poster3", startText: "내일 07:29에 시작", tagText: "# 왕과 사는 남자"),
        PartyInfo(id: 4, imageName: "horizontal_poster4", startText: "2일 뒤 14:52에 시작", tagText: "# 파묘")
    ]

    var body: some View {
        VStack(spacing: 0) {
            SectionTitleView(
                title: "왓챠 파티",
                showsMoreText: true
            )
            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Self.partyInfos) { info in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(info.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 196, height: 139)
                                .clipped()
                                .overlay(alignment: .topTrailing) {
                                    Image(.notificationBtn)
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .padding(.top, 7)
                                        .padding(.trailing, 5)
                                }

                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color("appGray700"))
                                    .frame(width: 196, height: 46)

                                VStack(alignment: .leading, spacing: 6) {
                                    Text(info.startText)
                                        .font(.body1)
                                        .foregroundStyle(.appPink)

                                    Text(info.tagText)
                                        .font(.subHead3)
                                        .foregroundStyle(.appWhite)
                                }
                                .padding(.horizontal, 8)
                            }
                        }
                    }
                }
                .padding(.horizontal, 17)
            }
            .padding(.top, 15)
            .padding(.bottom, 50)
        }
    }
}
