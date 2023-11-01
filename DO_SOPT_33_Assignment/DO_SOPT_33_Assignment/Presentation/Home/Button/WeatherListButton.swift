//
//  WeatherListButton.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import UIKit

import SnapKit
import Then

protocol WeatherButtonDelegate: AnyObject {
    func weatherButtonTapped(sender: WeatherListButton)
}

class WeatherListButton: UIButton {
    
    var indexNumber = 0
    weak var weatherButtonDelegate: WeatherButtonDelegate?
    
    let myPlaceLabel = UILabel()
    let localLabel = UILabel()
    let weatherLabel = UILabel()
    let tempLabel = UILabel()
    let maxTempLabel = UILabel()
    let minTempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setAddTarget()
    }
    
    init(local: String = "", weather: String, currentTemp: Int, maxTemp: Int, minTemp: Int, indexNumber: Int) {
        super.init(frame: CGRect())
        localLabel.text = local
        weatherLabel.text = weather
        tempLabel.text = String(currentTemp) + "˚"
        maxTempLabel.text = "최고:" + String(maxTemp) + "˚"
        minTempLabel.text = "최저:" + String(minTemp) + "˚"
        self.indexNumber = indexNumber
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setAddTarget() {
        self.addTarget(self, action: #selector(weatherButtonTapped), for: .touchUpInside)
    }
    
    func setStyle() {
        self.setBackgroundImage(UIImage(named: "imgList"), for: .normal)
        self.imageView?.contentMode = .scaleAspectFill
        
        myPlaceLabel.do {
            $0.text = "나의 위치"
            $0.font = UIFont(name: "SFProDisplay-Bold", size: 24)
            $0.textColor = .white
        }
        
        localLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 17)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 16)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Light", size: 52)
            $0.textColor = .white
        }
        
        maxTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 15)
            $0.textColor = .white
        }
        
        minTempLabel.do {
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
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
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
    
    @objc func weatherButtonTapped() {
        weatherButtonDelegate?.weatherButtonTapped(sender: self)
    }
}
