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
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: homeFlowLayout)
    private let homeFlowLayout = UICollectionViewFlowLayout()
    
    var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadWeatherData()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
        setCollectionViewConfig()
    }
    
    private func setDelegate() {
        homeViewModel.homeSearchBarDelegate = self
    }
    
    private func bindViewModel() {
        self.homeCollectionView.dataSource = homeViewModel
        self.searchBar.delegate = homeViewModel
    }
    
    private func setCollectionViewConfig() {
        self.homeCollectionView.register(HomeWeatherCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeWeatherCollectionViewCell.identifier)
        self.homeCollectionView.delegate = self
    }
    
    private func setStyle() {
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
        }
        
        homeCollectionView.do {
            $0.backgroundColor = .black
        }
        
        homeFlowLayout.do {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40) , height: 117)
            $0.minimumLineSpacing = 16
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(moreButton,
                              weatherTitleLabel,
                              searchBar,
                              homeCollectionView)
        
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
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(24)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func updateData() {
        self.homeCollectionView.reloadData()
    }
}

extension HomeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    private func loadWeatherData()  {
        Task {
            let success = await homeViewModel.loadWeatherData()
            if success {
                self.homeCollectionView.reloadData()
                print("💛💛💛💛💛💛💛")
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate { }

