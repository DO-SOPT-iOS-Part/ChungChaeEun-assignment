//
//  WeatherListButton.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import UIKit

import SnapKit
import Then

class WeatherListButton: UIButton {
    
    let myPlaceLabel = UILabel()
    let localLabel = UILabel()
    let weatherLabel = UILabel()
    let tempLabel = UILabel()
    let maxTempLabel = UILabel()
    let minTempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        self.setBackgroundImage(UIImage(named: "imgList"), for: .normal)
        
        myPlaceLabel.do {
            $0.text = "나의 위치"
            $0.font = UIFont(name: "SFProDisplay-Bold", size: 24)
            $0.textColor = .white
        }
        
        localLabel.do {
            $0.text = "강서구"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 17)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.text = "흐림"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 16)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.text = "21°"
            $0.font = UIFont(name: "SFProDisplay-Light", size: 52)
            $0.textColor = .white
        }
        
        maxTempLabel.do {
            $0.text = "최고:29°"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 15)
            $0.textColor = .white
        }
        
        minTempLabel.do {
            $0.text = "최저:15°"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 15)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubViews(myPlaceLabel,
                         localLabel,
                         weatherLabel,
                         tempLabel,
                         maxTempLabel,
                         minTempLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(117)
        }
        
        myPlaceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        localLabel.snp.makeConstraints {
            $0.top.equalTo(myPlaceLabel.snp.bottom).offset(2)
            $0.leading.equalTo(myPlaceLabel)
        }
        
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(myPlaceLabel)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        minTempLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        maxTempLabel.snp.makeConstraints {
            $0.bottom.equalTo(minTempLabel)
            $0.trailing.equalTo(minTempLabel.snp.leading).offset(-6)
        }
    }
}
