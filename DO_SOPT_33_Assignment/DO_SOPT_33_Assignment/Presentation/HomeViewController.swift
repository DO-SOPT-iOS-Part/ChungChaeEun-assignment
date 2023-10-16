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
    }
    
    private func setLayout() {
        self.view.addSubViews(moreButton,
                              weatherTitleLabel,
                              searchBar)
        
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
    }
}
