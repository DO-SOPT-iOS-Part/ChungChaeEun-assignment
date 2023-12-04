//
//  HomeViewModel.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 12/4/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func updateData()
}

final class HomeViewModel: NSObject {
    
    weak var homeSearchBarDelegate: HomeViewModelDelegate?

    var resultArray: [WeatherResponseDTO] = []
    var mainWeathersData: [WeatherResponseDTO] = []
    
    func loadWeatherData() async -> Bool {
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
            
            self.mainWeathersData = weatherDataArray
            self.resultArray = self.mainWeathersData
            return true
        }
    }
}

extension HomeViewModel: UISearchBarDelegate {
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
        
        homeSearchBarDelegate?.updateData()
    }
}


extension HomeViewModel: UICollectionViewDataSource {
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

extension HomeViewModel: WeatherButtonDelegate {
    func weatherButtonTapped(sender: WeatherListButton) -> UIViewController {
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
        
        return detailPageViewController
    }
}
