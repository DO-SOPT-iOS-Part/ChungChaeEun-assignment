//
//  TimeCardView.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class TimeCardView: UICollectionViewCell {
    
    static let identifier = "TimeCardView"
    let descriptionLabel = UILabel()
    let separateLineView = UIView()
    var indexNumber = 0
    
    lazy var weatherTimeCollectionView = UICollectionView(frame: .zero,
                                                          collectionViewLayout: weatherTimeFlowLayout)
    let weatherTimeFlowLayout = UICollectionViewFlowLayout()
    
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
        setCollectionViewConfig()
    }
    
    
    private func setCollectionViewConfig() {
        self.weatherTimeCollectionView.register(DetailTimeCollectionViewCell.self, forCellWithReuseIdentifier: DetailTimeCollectionViewCell.identifier)
    }
    
    func setStyle() {
        
        self.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.006)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        descriptionLabel.do {
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
            $0.textColor = .white
        }
        
        separateLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.25)
        }
        
        weatherTimeCollectionView.do {
            $0.backgroundColor = .clear
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
        
        weatherTimeFlowLayout.do {
            $0.itemSize = CGSize(width: 44 , height: 122)
            $0.minimumLineSpacing = 22
            $0.scrollDirection = .horizontal
        }
    }
    
    func setLayout() {
        
        self.addSubViews(descriptionLabel,
                         separateLineView,
                         weatherTimeCollectionView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(212)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        separateLineView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        weatherTimeCollectionView.snp.makeConstraints {
            $0.top.equalTo(separateLineView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    func configTimeCardView(indexNumber: Int) {
        self.indexNumber = indexNumber
        descriptionLabel.text = weatherDummy[indexNumber].description
    }
}
