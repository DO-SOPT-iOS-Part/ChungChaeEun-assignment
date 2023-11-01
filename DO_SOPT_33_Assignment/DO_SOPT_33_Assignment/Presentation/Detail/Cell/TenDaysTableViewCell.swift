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
    
    let tempStackView = UIStackView()
    let minTempLabel = UILabel()
    let tempGradientView = UIView()
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
            $0.tintColor = .systemBackground
        }
        
        iconHumidityLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
            $0.textColor = .init(red: 129.0 / 255.0,
                                 green: 207.0 / 255.0,
                                 blue: 250 / 255.0,
                                 alpha: 1.0)
        }
        
        tempStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .center
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
                         tempStackView)
        
        tempStackView.addArrangedSubviews(minTempLabel,
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
            $0.centerX.equalTo(self.snp.leading).offset(100)
        }
        
        tempStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        tempGradientView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(23)
            $0.width.equalTo(100)
        }
    }
    
    func bindData(data: TenDaysWeather) {
        self.dayTitleLabel.text = data.date
        setWeatherImage()
        if data.humidity != 0 {
            self.iconHumidityLabel.text = String(data.humidity) + "%"
        }
        
        self.minTempLabel.text = String(data.minTemp) + "˚"
        self.maxTempLabel.text =  String(data.maxTemp) + "˚"
    }
    
    private func setWeatherImage() {
        self.iconImageView.image = UIImage(systemName: "sun.max.fill")
        self.iconImageView.image?.withTintColor(.yellow)

    }
}
