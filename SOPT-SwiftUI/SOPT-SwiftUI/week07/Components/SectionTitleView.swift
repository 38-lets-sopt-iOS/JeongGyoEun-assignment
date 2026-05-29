//
//  SectionTitleView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String?
    let subTitle: String?
    let showsMoreText: Bool

    init(
        title: String? = nil,
        subTitle: String? = nil,
        showsMoreText: Bool = false
    ) {
        self.title = title
        self.subTitle = subTitle
        self.showsMoreText = showsMoreText
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                if let title {
                    Text(title)
                        .font(.head3)
                        .foregroundStyle(.appWhite)
                }

                if let subTitle {
                    Text(subTitle)
                        .font(.subHead1)
                        .foregroundStyle(.subhead)
                        .padding(.top, 3)
                }
            }

            Spacer()

            if showsMoreText {
                Text("더보기")
                    .font(.cap1)
                    .foregroundStyle(.subhead)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
