//
//  WelcomeView.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//


import SwiftUI

struct WelcomeView: View {
    @State private var isMainViewPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color("appBlack")
                    .ignoresSafeArea()

                VStack {
                    Image(.watchaLogo)
                        .resizable()
                        .frame(width: 319, height: 167)

                    Text("교은님\n가입을 환영합니다!")
                        .font(.head2)
                        .foregroundStyle(.appWhite)
                        .multilineTextAlignment(.center)
                        .padding(.top, 54)

                    Spacer()

                    Button {
                        isMainViewPresented = true
                    } label: {
                        Text("메인으로")
                            .font(.subHead2)
                            .foregroundStyle(.appWhite)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color("appPink"))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 22)
                }
            }
            .navigationDestination(isPresented: $isMainViewPresented) {
                MainView()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}
