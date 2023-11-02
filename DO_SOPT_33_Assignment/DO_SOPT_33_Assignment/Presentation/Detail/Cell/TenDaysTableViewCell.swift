//
//  TenDaysTableViewCell.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/1/23.
//

import UIKit

import SnapKit
import Then

class TenDaysTableViewCell: UITableViewCell {
    
    static let identifier: String = "TenDaysTableViewCell"
    
    var minMinTemp: Int = 0
    var maxMaxTemp: Int = 0
    
    var gradientStartValue: Double = 0.0
    var gradientEndValue: Double = 1.0
    
    let dayTitleLabel = UILabel()
    let iconStackView = UIStackView()
    let iconImageView = UIImageView()
    let iconHumidityLabel = UILabel()
    
    let tempStackView = UIStackView()
    let minTempLabel = UILabel()
    let tempGradientView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 4))
    let maxTempLabel = UILabel()
    
    let gradientColors: [CGColor] = [
        .init(red: 150/255, green: 208/255, blue: 168/255, alpha: 1),
        .init(red: 181/255, green: 207/255, blue: 121/255, alpha: 1),
        .init(red: 248/255, green: 215/255, blue: 74/255, alpha: 1),
        .init(red: 239/255, green: 136/255, blue: 53/255, alpha: 1)
    ]
    let tempGradientLayer = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        self.backgroundColor = .clear
        
        dayTitleLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = .white
        }
        
        iconStackView.do {
            $0.axis = .vertical
            $0.spacing = 0.85
        }
        
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .systemBackground
        }
        
        iconHumidityLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Semibold", size: 15)
            $0.textColor = .init(red: 129.0 / 255.0,
                                 green: 207.0 / 255.0,
                                 blue: 250 / 255.0,
                                 alpha: 1.0)
        }
        
        tempStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .center
        }
        
        minTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = UIColor(white: 1, alpha: 0.3)
        }
        
        tempGradientView.do {
            $0.backgroundColor = UIColor(hexCode: "000000", alpha: 0.15)
            $0.layer.cornerRadius = 2
            $0.clipsToBounds = true
        }
        
        tempGradientLayer.do {
            $0.frame = tempGradientView.bounds
            $0.colors = gradientColors
            $0.startPoint = CGPoint(x: 0.0, y: 0.5)
            $0.endPoint = CGPoint(x: 1.0, y: 0.5)
            $0.locations = [0.0, 0.4, 0.6, 1.0]
            $0.cornerRadius = 2
        }
        
        maxTempLabel.do {
            $0.font = UIFont(name: "SFProDisplay-Medium", size: 22)
            $0.textColor = .white
        }
    }
    
    private func setLayout() {
        self.addSubViews(dayTitleLabel,
                         iconStackView,
                         tempStackView)
        
        tempStackView.addArrangedSubviews(minTempLabel,
                                          tempGradientView,
                                          maxTempLabel)
        
        tempGradientView.layer.addSublayer(tempGradientLayer)
        
        iconStackView.addArrangedSubviews(iconImageView,
                                          iconHumidityLabel)
        
        dayTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        iconStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalTo(self.snp.leading).offset(100)
        }
        
        tempStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        tempGradientView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(23)
            $0.width.equalTo(100)
        }
    }
    
    func bindData(data: TenDaysWeather) {
        self.dayTitleLabel.text = data.date
        setWeatherImage(state: data.weather)
        
        if data.humidity != 0 {
            self.iconHumidityLabel.text = String(data.humidity) + "%"
        }
        
        self.minTempLabel.text = String(data.minTemp) + "˚"
        self.maxTempLabel.text =  String(data.maxTemp) + "˚"
        setGradientView(data: data)
    }
    
    private func setWeatherImage(state: WeatherState) {
        switch state {
        case .cloudyNight:
            self.iconImageView.image = UIImage(named: "cloud.moon.fill")
            
        case .heavyRain:
            self.iconImageView.image = UIImage(systemName: "cloud.heavyrain.fill")
            
        case .rain:
            self.iconImageView.image = UIImage(systemName: "cloud.drizzle.fill")
            
        case .rainyDay:
            self.iconImageView.image = UIImage(systemName: "cloud.sun.rain.fill", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [.white, .systemYellow, .systemCyan]))
            self.iconImageView.tintColor = .white
            
        case .thunder:
            self.iconImageView.image = UIImage(systemName: "cloud.bolt.fill")
            
        case .sun:
            self.iconImageView.image = UIImage(systemName: "sun.max.fill")
            self.iconImageView.tintColor = .systemYellow
            
        case .cloudyDay:
            self.iconImageView.image = UIImage(systemName: "cloud.sun.fill", withConfiguration: UIImage.SymbolConfiguration(paletteColors: [.white, .systemYellow]))
        }
    }

    private func setGradientView(data: TenDaysWeather) {
        let fullRange = Double(maxMaxTemp - minMinTemp)
        let startOffset = Double(data.minTemp - minMinTemp) / fullRange
        let endOffset = 1.0 - Double(data.maxTemp - minMinTemp) / fullRange
        
        tempGradientLayer.frame = CGRect(x: tempGradientView.bounds.minX + tempGradientView.bounds.width * CGFloat(startOffset),
                                         y: tempGradientView.bounds.minY,
                                         width: tempGradientView.bounds.width * CGFloat(1 - startOffset - endOffset),
                                         height: tempGradientView.bounds.height)
    }
}
