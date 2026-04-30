//
//  HorizontalPosterViewCell.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/1/26.
//

import UIKit
import SnapKit
import Then

class HorizontalPosterViewCell: UICollectionViewCell {
    static let identifier = "HorizontalPosterCell"
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .appBlack
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubviews(posterImageView)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func dataBind(_ image: UIImage?) {
        posterImageView.image = image
    }
}
