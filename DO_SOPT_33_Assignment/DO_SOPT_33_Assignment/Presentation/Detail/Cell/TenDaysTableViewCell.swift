//
//  TenDaysTableViewCell.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/1/23.
//

import UIKit

import SnapKit
import Then

class TenDaysTableViewCell: UITableViewCell {
    
    static let identifier: String = "TenDaysTableViewCell"

    let dayTitleLabel = UILabel()
    let iconStackView = UIStackView()
    let iconImageView = UIImageView()
    let iconHumidityLabel = UILabel()
    
    let minTempLabel = UILabel()
    let tempGradientView = UIImageView()
    let maxTempLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .clear
        
        dayTitleLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = .white
        }
        
        iconStackView.do {
            $0.axis = .vertical
            $0.spacing = 0.85
        }
        
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        iconHumidityLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
            $0.textColor = .init(red: 129.0 / 255.0,
                                 green: 207.0 / 255.0,
                                 blue: 250 / 255.0,
                                 alpha: 1.0)
        }
        
        minTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tempGradientView.do {
            $0.backgroundColor = .red
        }
        
        maxTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubViews(dayTitleLabel,
                         iconStackView,
                         minTempLabel,
                         tempGradientView,
                         maxTempLabel)
        
        iconStackView.addArrangedSubviews(iconImageView,
                                          iconHumidityLabel)
        
        dayTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        iconStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(87)
        }
        
        minTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconStackView.snp.trailing).offset(15)
        }
        
        tempGradientView.snp.makeConstraints {
            $0.leading.equalTo(minTempLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(maxTempLabel.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        maxTempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(17)
        }
    }
    
    func bindData() {
        self.dayTitleLabel.text = "오늘"
        self.iconImageView.image = UIImage(systemName: "cloud.fill")
        self.iconHumidityLabel.text = "80%"
        self.minTempLabel.text = "15˚"
        self.maxTempLabel.text = "23˚"
    }
}
