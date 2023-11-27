//
//  DetailLocalView.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class DetailLocalView: UICollectionReusableView {
    
    static let identifier = "DetailLocalView"
    
    let localLabel = UILabel()
    let tempLabel = UILabel()
    let weatherLabel = UILabel()
    let maxMinTempLabel = UILabel()

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
        localLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 36)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Thin", size: 102)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 24)
            $0.textColor = .white
        }
        
        maxMinTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 20)
            $0.textColor = .white
        }
    }
    
    func setLayout() {
        self.addSubViews(localLabel,
                         tempLabel,
                         weatherLabel,
                         maxMinTempLabel)
        
        self.snp.makeConstraints {
            $0.height.equalTo(212)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        localLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(localLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            $0.top.equalTo(tempLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        maxMinTempLabel.snp.makeConstraints {
            $0.top.equalTo(weatherLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configLocalView(data: WeatherResponseDTO) {
        localLabel.text = data.name
        tempLabel.text = String(Int(data.main.temp)) + "˚"
        weatherLabel.text = data.weather[0].main
        maxMinTempLabel.text = "최고:" + String(Int(data.main.tempMax)) + "°  최저:" + String(Int(data.main.tempMin)) + "°"
    }
}
