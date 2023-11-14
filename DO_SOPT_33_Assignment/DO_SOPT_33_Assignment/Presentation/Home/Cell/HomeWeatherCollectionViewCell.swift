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
    
    func bindData(data: WeatherResponseDTO) {
        weatherButton.myPlaceLabel.text = data.name
        weatherButton.localLabel.text = convertTime(timezone: data.timezone)
        weatherButton.weatherLabel.text = data.weather[0].description
        weatherButton.tempLabel.text = String(Int(data.main.temp)) + "˚"
        weatherButton.maxTempLabel.text = "최고:" + String(Int(data.main.tempMax)) + "˚"
        weatherButton.minTempLabel.text = "최저:" + String(Int(data.main.tempMin)) + "˚"
//        weatherButton.indexNumber = data.indexNumber
    }
}
