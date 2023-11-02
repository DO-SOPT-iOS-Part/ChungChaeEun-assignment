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
    var minTempArray: [Int] = []
    var maxTempArray: [Int] = []
    var minMinTemp: Int = 0
    var maxMaxTemp: Int = 0
    
    let verticalScrollView = UIScrollView()
    
    let backgroundImageView = UIImageView()
    let localLabel = UILabel()
    let tempLabel = UILabel()
    let weatherLabel = UILabel()
    let maxMinTempLabel = UILabel()
    
    let cardView = UIView()
    let descriptionLabel = UILabel()
    let separateLineView = UIView()
    
    lazy var weatherTimeCollectionView = UICollectionView(frame: .zero,
                                                          collectionViewLayout: weatherTimeFlowLayout)
    let weatherTimeFlowLayout = UICollectionViewFlowLayout()
    
    let tenDaysCardView = UIView()
    let tenDaysImageView = UIImageView()
    let tenDaysTitleLabel = UILabel()
    
    lazy var tenDaysTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
        setCollectionViewConfig()
        setTableViewConfig()
    }
    
    private func setCollectionViewConfig() {
        self.weatherTimeCollectionView.register(DetailTimeCollectionViewCell.self,
                                                forCellWithReuseIdentifier: DetailTimeCollectionViewCell.identifier)
        self.weatherTimeCollectionView.delegate = self
        self.weatherTimeCollectionView.dataSource = self
    }
    
    private func setTableViewConfig() {
        self.tenDaysTableView.register(TenDaysTableViewCell.self, forCellReuseIdentifier: TenDaysTableViewCell.identifier)
        self.tenDaysTableView.delegate = self
        self.tenDaysTableView.dataSource = self
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
        
        weatherTimeCollectionView.do {
            $0.backgroundColor = .clear
        }
        
        weatherTimeFlowLayout.do {
            $0.itemSize = CGSize(width: 44 , height: 122)
            $0.minimumLineSpacing = 22
            $0.scrollDirection = .horizontal
        }
        
        tenDaysCardView.do {
            $0.backgroundColor = UIColor(hexCode: "2D3340", alpha: 0.2)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        tenDaysImageView.do {
            $0.image = UIImage(systemName: "calendar")
            $0.tintColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tenDaysTitleLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 15)
            $0.textColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tenDaysTableView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.separatorColor = UIColor(white: 1, alpha: 0.3)
            $0.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView,
                              verticalScrollView)
        
        verticalScrollView.addSubViews(localLabel,
                                       tempLabel,
                                       weatherLabel,
                                       maxMinTempLabel,
                                       cardView,
                                       tenDaysCardView)
        
        cardView.addSubViews(descriptionLabel,
                             separateLineView,
                             weatherTimeCollectionView)
        
        tenDaysCardView.addSubViews(tenDaysImageView,
                                   tenDaysTitleLabel,
                                    tenDaysTableView)
        
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
        
        weatherTimeCollectionView.snp.makeConstraints {
            $0.top.equalTo(separateLineView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        tenDaysCardView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(588)
            $0.bottom.equalToSuperview().inset(86)
        }
        
        tenDaysImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(15)
        }
        
        tenDaysTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(tenDaysImageView)
            $0.leading.equalTo(tenDaysImageView.snp.trailing).offset(5)
        }
        
        tenDaysTableView.snp.makeConstraints {
            $0.top.equalTo(tenDaysTitleLabel.snp.bottom).offset(6)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func caculateMinMax(data: [TenDaysWeather]) {
        data.forEach {
            minTempArray.append($0.minTemp)
            maxTempArray.append($0.maxTemp)
        }
        
        minMinTemp = minTempArray.min() ?? 0
        maxMaxTemp = maxTempArray.max() ?? 0
    }
}

extension DetailViewController: UICollectionViewDelegate { }

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherDummy[self.indexNumber].timeZoneWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTimeCollectionViewCell.identifier, for: indexPath) as? DetailTimeCollectionViewCell else {return UICollectionViewCell()}
        cell.bindData(data: weatherDummy[self.indexNumber], row: indexPath.row)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate { }

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDaysTableViewCell.identifier, for: indexPath) as? TenDaysTableViewCell else {return UITableViewCell()}
        self.caculateMinMax(data: tenDaysWeatherDummy)
        cell.minMinTemp = minMinTemp
        cell.maxMaxTemp = maxMaxTemp
        cell.bindData(data: tenDaysWeatherDummy[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
