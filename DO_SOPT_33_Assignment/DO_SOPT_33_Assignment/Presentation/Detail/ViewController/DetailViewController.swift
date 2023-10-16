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
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView,
                              localLabel,
                              tempLabel,
                              weatherLabel,
                              maxMinTempLabel)
        
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
        
        
        
    }
}
