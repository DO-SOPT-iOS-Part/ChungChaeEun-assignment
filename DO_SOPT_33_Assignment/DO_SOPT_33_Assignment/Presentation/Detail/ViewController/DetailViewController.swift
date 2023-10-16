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
    
    let backgroundImageView = UIImageView()
    let localLabel = UILabel()
    let tempLabel = UILabel()
    let weatherLabel = UILabel()
    let maxMinTempLabel = UILabel()
    
    let cardView = UIView()
    let descriptionLabel = UILabel()
    let separateLineView = UIView()
    
    let weatherScrollView = UIScrollView()
    let nowWeatherView = TimeWeatherView(time: "Now", state: .cloudyNight, temp: "21")
    let afterOneHourWeatherView = TimeWeatherView(time: "10시", state: .rain, temp: "21")
    let afterTwoHourWeatherView = TimeWeatherView(time: "11시", state: .heavyRain, temp: "19")
    let afterThreeHourWeatherView = TimeWeatherView(time: "12시", state: .thunder, temp: "19")
    let afterFourHourWeatherView = TimeWeatherView(time: "13시", state: .rainyDay, temp: "19")
    let afterFiveHourWeatherView = TimeWeatherView(time: "14시", state: .rainyDay, temp: "20")
    let afterSixHourWeatherView = TimeWeatherView(time: "15시", state: .rain, temp: "22")
    let afterSevenHourWeatherView = TimeWeatherView(time: "16시", state: .rain, temp: "21")
    let afterEightHourWeatherView = TimeWeatherView(time: "17시", state: .rainyDay, temp: "21")
    let afterNineHourWeatherView = TimeWeatherView(time: "18시", state: .cloudyNight, temp: "19")
    
    let tabBarView = UIView()
    let mapButton = UIButton()
    let listButton = UIButton()
    

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
        
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "imgBackground")
        }
        
        localLabel.do {
            $0.text = "강서구"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 36)
            $0.textColor = .white
        }
        
        tempLabel.do {
            $0.text = "21°"
            $0.font = UIFont(name: "SFProDisplay-Thin", size: 102)
            $0.textColor = .white
        }
        
        weatherLabel.do {
            $0.text = "흐림"
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 24)
            $0.textColor = .white
        }
        
        maxMinTempLabel.do {
            $0.text = "최고:29°  최저:15°"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 20)
            $0.textColor = .white
        }
        
        cardView.do {
            $0.backgroundColor = UIColor(white: 1, alpha: 0.006)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.25)
        }
        
        descriptionLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
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
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView,
                              localLabel,
                              tempLabel,
                              weatherLabel,
                              maxMinTempLabel,
                              cardView)
        
        cardView.addSubViews(descriptionLabel,
                             separateLineView,
                             weatherScrollView)
        
        weatherScrollView.addSubViews(nowWeatherView,
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
        
        localLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(34)
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
        
        nowWeatherView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        afterOneHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(nowWeatherView.snp.trailing).offset(22)
        }
        
        afterTwoHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterOneHourWeatherView.snp.trailing).offset(22)
        }
        
        afterThreeHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterTwoHourWeatherView.snp.trailing).offset(22)
        }
        
        afterFourHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterThreeHourWeatherView.snp.trailing).offset(22)
        }
        
        afterFiveHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterFourHourWeatherView.snp.trailing).offset(22)
        }
        
        afterSixHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterFiveHourWeatherView.snp.trailing).offset(22)
        }
        
        afterSevenHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterSixHourWeatherView.snp.trailing).offset(22)
        }
        
        afterEightHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterSevenHourWeatherView.snp.trailing).offset(22)
        }
        
        afterNineHourWeatherView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(afterEightHourWeatherView.snp.trailing).offset(22)
            $0.trailing.equalToSuperview()
        }
    }
}
