//
//  TimeWeatherView.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import UIKit

import SnapKit
import Then

enum WeatherState {
    case cloudyNight
    case heavyRain
    case rain
    case rainyDay
    case thunder
}

class TimeWeatherView: UIView {
    
    let timeLabel = UILabel()
    let weatherImageView = UIImageView()
    let tempLabel = UILabel()
    
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
        
        timeLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        }
        
        tempLabel.do {
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        }
    }
    
    func setLayout() {
        
        self.addSubViews(timeLabel,
                         weatherImageView,
                         tempLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(122)
            $0.width.equalTo(44)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(14)
            $0.width.height.equalTo(44)
            $0.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
}
