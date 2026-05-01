//
//  BasicPosterViewCell.swift
//  sopt-assignment
//
//  Created by 정교은 on 5/1/26.
//

import UIKit
import SnapKit
import Then

class BasicPosterViewCell: UICollectionViewCell {
    static let identifier = "BasicPosterCell"
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
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
