//
//  TenDaysCardView.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/7/23.
//

import UIKit

class TenDaysCardView: UICollectionViewCell {
    
    static let identifier: String = "TenDaysCardView"
    
    let tenDaysImageView = UIImageView()
    let tenDaysTitleLabel = UILabel()
    
    lazy var tenDaysTableView = UITableView()
    
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
        setTableViewConfig()
    }
    
    private func setTableViewConfig() {
        self.tenDaysTableView.register(TenDaysTableViewCell.self, forCellReuseIdentifier: TenDaysTableViewCell.identifier)
    }
    
    func setStyle() {
        
        self.do {
            $0.backgroundColor = UIColor(hexCode: "2D3340", alpha: 0.2)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        tenDaysImageView.do {
            $0.image = UIImage(systemName: "calendar")
            $0.tintColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tenDaysTitleLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 15)
            $0.textColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tenDaysTableView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.separatorColor = UIColor(white: 1, alpha: 0.3)
            $0.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
    
    func setLayout() {
        
        self.addSubViews(tenDaysImageView,
                         tenDaysTitleLabel,
                         tenDaysTableView)
        
        
        tenDaysImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(15)
        }
        
        tenDaysTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(tenDaysImageView)
            $0.leading.equalTo(tenDaysImageView.snp.trailing).offset(5)
        }
        
        tenDaysTableView.snp.makeConstraints {
            $0.top.equalTo(tenDaysTitleLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
