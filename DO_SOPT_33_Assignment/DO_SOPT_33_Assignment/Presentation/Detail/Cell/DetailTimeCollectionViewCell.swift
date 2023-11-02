//
//  DetailTimeCollectionViewCell.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/1/23.
//

import UIKit

import SnapKit

class DetailTimeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "DetailTimeCollectionViewCell"
    var timeWeatherView = TimeWeatherView()

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
        self.addSubViews(timeWeatherView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(122)
            $0.width.equalTo(44)
        }
        
        timeWeatherView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindData(data: Weather, row: Int) {
        timeWeatherView.timeLabel.text = data.timeZoneWeather[row].time
        timeWeatherView.tempLabel.text = String(data.timeZoneWeather[row].temp)
        setViewState(state: data.timeZoneWeather[row].state)
    }
    
    func setViewState(state: WeatherState) {
        switch state {
        case .cloudyNight:
            timeWeatherView.weatherImageView.image = UIImage(named: "icCloudyNight")
        case .heavyRain:
            timeWeatherView.weatherImageView.image = UIImage(named: "icHeavyRain")
        case .rain:
            timeWeatherView.weatherImageView.image = UIImage(named: "icRain")
        case .rainyDay:
            timeWeatherView.weatherImageView.image = UIImage(named: "icRainyDay")
        case .thunder:
            timeWeatherView.weatherImageView.image = UIImage(named: "icThunder")
        default:
            return
        }
    }
}
