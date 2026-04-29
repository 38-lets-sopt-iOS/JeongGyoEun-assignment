//
//  UIView+.swift
//  sopt-assignment
//
//  Created by 정교은 on 4/29/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
