//
//  HomeViewController.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    let moreButton = UIButton()
    let weatherTitleLabel = UILabel()
    let searchBar = UISearchBar()
    
    let contentView = UIScrollView()
    
    let weatherButton = WeatherListButton()
    let secondWeatherButton = WeatherListButton()
    let thirdWeatherButton = WeatherListButton()
    let fourthWeatherButton = WeatherListButton()
    let fifthWeatherButton = WeatherListButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
        
        moreButton.do {
            $0.setImage(UIImage(named: "icMore"), for: .normal)
        }
        
        weatherTitleLabel.do {
            $0.text = "날씨"
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        }
        
        searchBar.do {
            $0.placeholder = "도시 또는 공항 검색"
            $0.searchTextField.font = UIFont(name: "SFProDisplay-Regular", size: 19)
            $0.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
            $0.tintColor = .white
            $0.searchTextField.tintColor = UIColor(white: 1, alpha: 0.5)
            $0.setImage(UIImage(named: "icSearch"), for: .search, state: .normal)
            
            // 위아래로 생기는 선 삭제
            $0.barTintColor = .clear
        }
        
        contentView.do {
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(moreButton,
                              weatherTitleLabel,
                              searchBar,
                              contentView)
        
        contentView.addSubViews(weatherButton,
                                secondWeatherButton,
                                thirdWeatherButton,
                                fourthWeatherButton,
                                fifthWeatherButton)
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        weatherTitleLabel.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).offset(1)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(weatherTitleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(40)
        }
        
        searchBar.searchTextField.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(40)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        weatherButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        secondWeatherButton.snp.makeConstraints {
            $0.top.equalTo(weatherButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        thirdWeatherButton.snp.makeConstraints {
            $0.top.equalTo(secondWeatherButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        fourthWeatherButton.snp.makeConstraints {
            $0.top.equalTo(thirdWeatherButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        fifthWeatherButton.snp.makeConstraints {
            $0.top.equalTo(fourthWeatherButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
