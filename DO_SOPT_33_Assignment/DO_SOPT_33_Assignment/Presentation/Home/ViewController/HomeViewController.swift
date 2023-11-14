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
    
    var resultArray: [WeatherResponseDTO] = []
    var mainWeathersData: [WeatherResponseDTO] = []
    
    let moreButton = UIButton()
    let weatherTitleLabel = UILabel()
    let searchBar = UISearchBar()
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: homeFlowLayout)
    private let homeFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
    
    private func setCollectionViewConfig() {
        self.homeCollectionView.register(HomeWeatherCollectionViewCell.self,
                                         forCellWithReuseIdentifier: HomeWeatherCollectionViewCell.identifier)
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
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
            
            $0.delegate = self
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

extension HomeViewController: WeatherButtonDelegate {
    
    func weatherButtonTapped(sender: WeatherListButton) {
        let detailPageViewController = DetailPageViewController()
        
        for index in 0..<resultArray.count {
            let detailViewController = DetailViewController()
            detailViewController.indexNumber = index
            detailViewController.detailWeatherData = resultArray[index]
            detailPageViewController.detailViewControllers.append(detailViewController)
        }
        
        let firstViewController = detailPageViewController.detailViewControllers[sender.indexNumber]
        detailPageViewController.pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
        detailPageViewController.detailViewControllers[sender.indexNumber].indexNumber = sender.indexNumber
        self.navigationController?.pushViewController(detailPageViewController, animated: true)
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        
        self.resultArray = []
        
        mainWeathersData.forEach {
            // 대소문자 구별은 안됨..
            if $0.name.contains(text) {
                resultArray.append($0)
            }
        }
        
        print(resultArray)
        
        if text.isEmpty {
            self.resultArray = mainWeathersData
        }
        
        self.homeCollectionView.reloadData()
    }
}

extension HomeViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeWeatherCollectionViewCell.identifier, for: indexPath) as? HomeWeatherCollectionViewCell else { return UICollectionViewCell() }
        cell.weatherButton.weatherButtonDelegate = self
        cell.bindData(data: resultArray[indexPath.row])
        cell.weatherButton.indexNumber = indexPath.row
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate { }

extension HomeViewController {
    private func loadWeatherData() {
        Task {
            do {
                let cities = ["seoul", "daegu", "busan", "daejeon", "mokpo"]
                
                self.mainWeathersData = []
                var weatherDataArray: [WeatherResponseDTO] = []
                
                for cityName in cities {
                    do {
                        if let receivedData = try await WeatherService.shared.GetWeatherData(cityName: cityName) {
                            weatherDataArray.append(receivedData)
                        }
                    } catch {
                        print("Failed to get weather data for \(cityName): \(error)")
                    }
                }

                DispatchQueue.main.async {
                    self.mainWeathersData = weatherDataArray
                    self.resultArray = self.mainWeathersData
                    self.homeCollectionView.reloadData()
                    print("💛💛💛💛💛💛💛")
                }
            } catch {
                print(error)
            }
        }
    }
}
