//
//  HomeWeatherCollectionViewCell.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/1/23.
//

import UIKit

import SnapKit

class HomeWeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HomeWeatherCollectionViewCell"
    var weatherButton = WeatherListButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
    }
    
    private func setLayout() {
        self.addSubViews(weatherButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(117)
            $0.width.equalTo(UIScreen.main.bounds.width - 40)
        }
        
        weatherButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindData(data: Weather) {
        weatherButton.localLabel.text = data.local
        weatherButton.weatherLabel.text = data.weather
        weatherButton.tempLabel.text = String(data.currentTemp) + "˚"
        weatherButton.maxTempLabel.text = "최고:" + String(data.maxTemp) + "˚"
        weatherButton.minTempLabel.text = "최저:" + String(data.minTemp) + "˚"
        weatherButton.indexNumber = data.indexNumber
    }
}
