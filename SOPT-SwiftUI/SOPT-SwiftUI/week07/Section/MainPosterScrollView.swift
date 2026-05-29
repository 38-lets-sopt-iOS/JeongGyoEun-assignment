//
//  MainPosterScrollView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

struct MainPosterScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(1...4, id: \.self) { index in
                    Image("poster\(index)")
                        .resizable()
                        .frame(width: 273, height: 403)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 51)
        }
        .padding(.top, 28)
        .padding(.bottom, 34)
    }
}
