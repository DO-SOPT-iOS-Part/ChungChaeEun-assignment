//
//  DetailViewFirstHeaderView.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/10/23.
//

import UIKit

import SnapKit
import Then

class DetailViewFirstHeaderView: UICollectionReusableView {

    static let identifier: String = "DetailViewFirstHeaderView"

    let detailLocalView = DetailLocalView()
    let timeCardView = TimeCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        
    }
    
    func setLayout() {
        self.addSubViews(detailLocalView,
                         timeCardView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(322)
        }
        
        detailLocalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        timeCardView.snp.makeConstraints {
            $0.centerX.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(detailLocalView.snp.bottom).offset(44)
        }
    }
}
