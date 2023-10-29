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
    
    static let weatherDummy: [Weather] =
    [Weather(local: "강서구",
             weather: "흐림",
             
             currentTemp: 21, maxTemp: 29, minTemp: 15,
             description: "8:00~9:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
             timeZoneWeather: [TimeZoneWeather(time: "Now", state: .cloudyNight, temp: 21),
                               TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                               TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                               TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                               TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                               TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                               TimeZoneWeather(time: "15시", state: .rain, temp: 22),
                               TimeZoneWeather(time: "16시", state: .rain, temp: 21),
                               TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                               TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 0),
     Weather(local: "양천구",
             weather: "비",
             currentTemp: 19, maxTemp: 25, minTemp: 18,
             description: "오전부터 계속해서 비가 내리는 상태가 예상되며, 돌풍의 풍속은 최대 4m/s 입니다.",
             timeZoneWeather: [TimeZoneWeather(time: "Now", state: .heavyRain, temp: 19),
                               TimeZoneWeather(time: "10시", state: .rain, temp: 18),
                               TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                               TimeZoneWeather(time: "12시", state: .heavyRain, temp: 22),
                               TimeZoneWeather(time: "13시", state: .rain, temp: 23),
                               TimeZoneWeather(time: "14시", state: .rain, temp: 25),
                               TimeZoneWeather(time: "15시", state: .rain, temp: 25),
                               TimeZoneWeather(time: "16시", state: .rain, temp: 24),
                               TimeZoneWeather(time: "17시", state: .rainyDay, temp: 24),
                               TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 22)], indexNumber: 1),
     Weather(local: "마포구",
             weather: "폭우",
             currentTemp: 13, maxTemp: 29, minTemp: 13,
             description: "오후 12시까지 계속해서 폭우가 내릴 예정이며, 최저 기온은 13도입니다.",
             timeZoneWeather: [TimeZoneWeather(time: "Now", state: .heavyRain, temp: 13),
                               TimeZoneWeather(time: "10시", state: .thunder, temp: 14),
                               TimeZoneWeather(time: "11시", state: .heavyRain, temp: 14),
                               TimeZoneWeather(time: "12시", state: .rain, temp: 18),
                               TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                               TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                               TimeZoneWeather(time: "15시", state: .rainyDay, temp: 20),
                               TimeZoneWeather(time: "16시", state: .rainyDay, temp: 19),
                               TimeZoneWeather(time: "17시", state: .cloudyNight, temp: 19),
                               TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 2),
     Weather(local: "영등포구",
             weather: "비",
             currentTemp: 21, maxTemp: 22, minTemp: 15,
             description: "하루종일 비가 내릴 예정이며, 돌풍의 풍속은 최대 4m/s 입니다.",
             timeZoneWeather: [TimeZoneWeather(time: "Now", state: .rain, temp: 21),
                               TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                               TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                               TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                               TimeZoneWeather(time: "13시", state: .rain, temp: 19),
                               TimeZoneWeather(time: "14시", state: .rain, temp: 20),
                               TimeZoneWeather(time: "15시", state: .rain, temp: 22),
                               TimeZoneWeather(time: "16시", state: .rain, temp: 21),
                               TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                               TimeZoneWeather(time: "18시", state: .rainyDay, temp: 19)], indexNumber: 3),
     Weather(local: "구로구",
             weather: "흐림",
             currentTemp: 21, maxTemp: 20, minTemp: 15,
             description: "8:00~9:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
             timeZoneWeather: [TimeZoneWeather(time: "Now", state: .cloudyNight, temp: 21),
                               TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                               TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                               TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                               TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                               TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                               TimeZoneWeather(time: "15시", state: .rain, temp: 20),
                               TimeZoneWeather(time: "16시", state: .rain, temp: 20),
                               TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                               TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 4)]

    
    var resultArray: [Int] = []
    
    let moreButton = UIButton()
    let weatherTitleLabel = UILabel()
    let searchBar = UISearchBar()
    
    let contentView = UIScrollView()
    
    let buttonStackView = UIStackView()
    
    lazy var weatherButton = WeatherListButton(local: HomeViewController.weatherDummy[0].local, weather: HomeViewController.weatherDummy[0].weather, currentTemp: HomeViewController.weatherDummy[0].currentTemp, maxTemp: HomeViewController.weatherDummy[0].maxTemp, minTemp: HomeViewController.weatherDummy[0].minTemp, indexNumber: 0)
    
    let secondWeatherButton = WeatherListButton(local: HomeViewController.weatherDummy[1].local, weather: HomeViewController.weatherDummy[1].weather, currentTemp: HomeViewController.weatherDummy[1].currentTemp, maxTemp: HomeViewController.weatherDummy[1].maxTemp, minTemp: HomeViewController.weatherDummy[1].minTemp, indexNumber: 1)
    
    let thirdWeatherButton = WeatherListButton(local: HomeViewController.weatherDummy[2].local, weather: HomeViewController.weatherDummy[2].weather, currentTemp: HomeViewController.weatherDummy[2].currentTemp, maxTemp: HomeViewController.weatherDummy[2].maxTemp, minTemp: HomeViewController.weatherDummy[2].minTemp, indexNumber: 2)
    
    let fourthWeatherButton = WeatherListButton(local: HomeViewController.weatherDummy[3].local, weather: HomeViewController.weatherDummy[3].weather, currentTemp: HomeViewController.weatherDummy[3].currentTemp, maxTemp: HomeViewController.weatherDummy[3].maxTemp, minTemp: HomeViewController.weatherDummy[3].minTemp, indexNumber: 3)
    
    let fifthWeatherButton = WeatherListButton(local: HomeViewController.weatherDummy[4].local, weather: HomeViewController.weatherDummy[4].weather, currentTemp: HomeViewController.weatherDummy[4].currentTemp, maxTemp: HomeViewController.weatherDummy[4].maxTemp, minTemp: HomeViewController.weatherDummy[4].minTemp, indexNumber: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        setButtonLayout()
        
        self.navigationController?.navigationBar.isHidden = true
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
            $0.searchTextField.textColor = .white
            $0.setImage(UIImage(named: "icSearch"), for: .search, state: .normal)
            
            // 위아래로 생기는 선 삭제
            $0.barTintColor = .clear
            
            $0.delegate = self
        }
        
        contentView.do {
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
        }
        
        buttonStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
        }
        
        [weatherButton, secondWeatherButton, thirdWeatherButton, fourthWeatherButton, fifthWeatherButton].forEach {
            $0.addTarget(self, action: #selector(weatherButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(moreButton,
                              weatherTitleLabel,
                              searchBar,
                              contentView)
        
        contentView.addSubViews(buttonStackView)
        
        [weatherButton, secondWeatherButton, thirdWeatherButton, fourthWeatherButton, fifthWeatherButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
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
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func weatherButtonTapped(sender: WeatherListButton) {
        let detailPageViewController = DetailPageViewController()
        
        for index in 0..<5 {
            let detailViewController = DetailViewController()
            detailViewController.indexNumber = index
            detailPageViewController.detailViewControllers.append(detailViewController)
        }
        
        let firstViewController = detailPageViewController.detailViewControllers[sender.indexNumber]
        detailPageViewController.pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
        detailPageViewController.detailViewControllers[sender.indexNumber].indexNumber = sender.indexNumber
        print(sender.indexNumber)
        self.navigationController?.pushViewController(detailPageViewController, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        
        self.resultArray = []
        
        HomeViewController.weatherDummy.forEach {
            if $0.local.contains(text) {
                resultArray.append($0.indexNumber)
            }
        }
        print(resultArray)
        searchLayout()
        
        if text.isEmpty {
            setButtonLayout()
        }
    }
}

extension HomeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func setButtonLayout() {
        [weatherButton, secondWeatherButton, thirdWeatherButton, fourthWeatherButton, fifthWeatherButton].forEach {
            $0.isHidden = false
        }
    }
    
    func searchLayout() {
        [weatherButton, secondWeatherButton, thirdWeatherButton, fourthWeatherButton, fifthWeatherButton].forEach {
            $0.isHidden = true
        }
        
        if resultArray.contains(0) {
            weatherButton.isHidden = false
        }
        
        if resultArray.contains(1) {
            secondWeatherButton.isHidden = false
        }
        
        if resultArray.contains(2) {
            thirdWeatherButton.isHidden = false
        }
        
        if resultArray.contains(3) {
            fourthWeatherButton.isHidden = false
        }
        
        if resultArray.contains(4) {
            fifthWeatherButton.isHidden = false
        }
    }
}
