//
//  Font+.swift
//  SOPT-SwiftUI
//
//  Created by 정교은 on 5/29/26.
//

import SwiftUI

extension Font {
    static func pretendard(size fontSize: CGFloat, weight: Font.Weight) -> Font {
        let familyName = "Pretendard"
        let weightMap: [(Font.Weight, String)] = [
            (.black, "Black"),
            (.bold, "Bold"),
            (.heavy, "ExtraBold"),
            (.ultraLight, "ExtraLight"),
            (.light, "Light"),
            (.medium, "Medium"),
            (.regular, "Regular"),
            (.semibold, "SemiBold"),
            (.thin, "Thin"),
        ]
        let weightString = weightMap.first { $0.0 == weight }?.1 ?? "Regular"
        return Font.custom("\(familyName)-\(weightString)", size: fontSize)
    }

    static let head1 = Font.pretendard(size: 30, weight: .semibold)
    static let head2 = Font.pretendard(size: 23, weight: .semibold)
    static let head3 = Font.pretendard(size: 20, weight: .semibold)
    static let subHead1 = Font.pretendard(size: 18, weight: .semibold)
    static let subHead2 = Font.pretendard(size: 15, weight: .semibold)
    static let subHead3 = Font.pretendard(size: 12, weight: .semibold)
    static let medium = Font.pretendard(size: 18, weight: .medium)
    static let body1 = Font.pretendard(size: 12, weight: .medium)
    static let body2 = Font.pretendard(size: 12, weight: .regular)
    static let cap1 = Font.pretendard(size: 12, weight: .light)
}
