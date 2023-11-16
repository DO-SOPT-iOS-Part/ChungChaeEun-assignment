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
    
    func bindData(data: WeatherDetailResponseDTO, row: Int) {
        timeWeatherView.timeLabel.text = setTime(row: row)
        timeWeatherView.tempLabel.text = String(Int(data.list[row].main.temp)) + "˚"
        setViewState(state: data.list[row].weather[0].main, row: row)
    }
    
    func setTime(row: Int) -> String {
        let time = convert3HTime(timezone: row)
        if row == 0 {
            return "Now"
        } else {
            return time[row]
        }
    }
    
    func setViewState(state: MainEnum, row: Int) {
        switch state {
        case .clear:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "sun.min.fill")
        case .clouds:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "cloud.fill")
        case .rain:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
        case .snow:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "cloud.snow.fill")
        case .drizzle:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "cloud.drizzle.fill")
        case .thunderstorm:
            timeWeatherView.weatherImageView.image = UIImage(systemName: "cloud.bolt.fill")
        }
    }
}
