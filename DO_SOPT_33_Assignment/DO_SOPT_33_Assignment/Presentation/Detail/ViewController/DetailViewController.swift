//
//  DetailViewController.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    var indexNumber: Int = 0
    
    let verticalScrollView = UIScrollView()
    
    let backgroundImageView = UIImageView()
    let localLabel = UILabel()
    let tempLabel = UILabel()
    let weatherLabel = UILabel()
    let maxMinTempLabel = UILabel()
    
    let cardView = UIView()
    let descriptionLabel = UILabel()
    let separateLineView = UIView()
    
    let weatherScrollView = UIScrollView()
    let weatherStackView = UIStackView()
    
    lazy var nowWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[0].time, state: weatherDummy[indexNumber].timeZoneWeather[0].state, temp: weatherDummy[indexNumber].timeZoneWeather[0].temp)
    
    lazy var afterOneHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[1].time, state: weatherDummy[indexNumber].timeZoneWeather[1].state, temp: weatherDummy[indexNumber].timeZoneWeather[1].temp)
    
    lazy var afterTwoHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[2].time, state: weatherDummy[indexNumber].timeZoneWeather[2].state, temp: weatherDummy[indexNumber].timeZoneWeather[2].temp)
    
    lazy var afterThreeHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[3].time, state: weatherDummy[indexNumber].timeZoneWeather[3].state, temp: weatherDummy[indexNumber].timeZoneWeather[3].temp)
    
    lazy var afterFourHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[4].time, state: weatherDummy[indexNumber].timeZoneWeather[4].state, temp: weatherDummy[indexNumber].timeZoneWeather[4].temp)
    
    lazy var afterFiveHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[5].time, state: weatherDummy[indexNumber].timeZoneWeather[5].state, temp: weatherDummy[indexNumber].timeZoneWeather[5].temp)
    
    lazy var afterSixHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[6].time, state: weatherDummy[indexNumber].timeZoneWeather[6].state, temp: weatherDummy[indexNumber].timeZoneWeather[6].temp)
    
    lazy var afterSevenHourWeatherView = TimeWeatherView(time:  weatherDummy[indexNumber].timeZoneWeather[7].time, state: weatherDummy[indexNumber].timeZoneWeather[7].state, temp: weatherDummy[indexNumber].timeZoneWeather[7].temp)
    
    lazy var afterEightHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[8].time, state: weatherDummy[indexNumber].timeZoneWeather[8].state, temp: weatherDummy[indexNumber].timeZoneWeather[8].temp)
    
    lazy var afterNineHourWeatherView = TimeWeatherView(time: weatherDummy[indexNumber].timeZoneWeather[9].time, state: weatherDummy[indexNumber].timeZoneWeather[9].state, temp: weatherDummy[indexNumber].timeZoneWeather[9].temp)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        verticalScrollView.do {
            $0.alwaysBounceVertical = true
        }
        
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "imgBackground")
        }
        
        localLabel.do {
            $0.text = weatherDummy[indexNumber].local
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 36)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.text = String(weatherDummy[indexNumber].currentTemp) + "˚"
            $0.font = UIFont(name: "SFProDisplay-Thin", size: 102)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.text = weatherDummy[indexNumber].weather
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 24)
            $0.textColor = .white
        }
        
        maxMinTempLabel.do {
            $0.text = "최고:" + String(weatherDummy[indexNumber].maxTemp) + "°  최저:" + String(weatherDummy[indexNumber].minTemp) + "°"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 20)
            $0.textColor = .white
        }
        
        cardView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.006)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        descriptionLabel.do {
            $0.text = weatherDummy[indexNumber].description
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 18)
            $0.textColor = .white
        }
        
        separateLineView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.25)
        }
        
        weatherScrollView.do {
            $0.showsHorizontalScrollIndicator = false
        }
        
        weatherStackView.do {
            $0.axis = .horizontal
            $0.spacing = 22
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView,
                              verticalScrollView)
        
        verticalScrollView.addSubViews(localLabel,
                                      tempLabel,
                                      weatherLabel,
                                      maxMinTempLabel,
                                      cardView)
        
        cardView.addSubViews(descriptionLabel,
                             separateLineView,
                             weatherScrollView)
        
        weatherScrollView.addSubViews(weatherStackView)
        weatherStackView.addArrangedSubviews(nowWeatherView,
                                      afterOneHourWeatherView,
                                      afterTwoHourWeatherView,
                                      afterThreeHourWeatherView,
                                      afterFourHourWeatherView,
                                      afterFiveHourWeatherView,
                                      afterSixHourWeatherView,
                                      afterSevenHourWeatherView,
                                      afterEightHourWeatherView,
                                      afterNineHourWeatherView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        verticalScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        localLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.centerX.equalToSuperview()
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
        
        cardView.snp.makeConstraints {
            $0.top.equalTo(maxMinTempLabel.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        separateLineView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(0.2)
        }
        
        weatherScrollView.snp.makeConstraints {
            $0.top.equalTo(separateLineView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        weatherStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
