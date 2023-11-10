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
    
    let backgroundImageView = UIImageView()
    
    lazy var detailCollectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: detailFlowLayout)
    let detailFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
        setDelegate()
        configCollectionView()
    }
    
    private func setDelegate() {
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    private func configCollectionView() {
        self.detailCollectionView.register(DetailLocalView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailLocalView.identifier)
        
        self.detailCollectionView.register(TimeCardView.self, forCellWithReuseIdentifier: TimeCardView.identifier)
        
        self.detailCollectionView.register(TenDaysCardView.self, forCellWithReuseIdentifier: TenDaysCardView.identifier)
    }
    
    private func setStyle() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        backgroundImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: "imgBackground")
        }
        
        detailCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
        }
        
        detailFlowLayout.do {
            $0.scrollDirection = .vertical
            $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        }
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView,
                              detailCollectionView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        detailCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(78)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(82)
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == detailCollectionView {
            return 2
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == detailCollectionView {
            return 1
        } else {
            return weatherDummy.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == detailCollectionView {
            switch indexPath.section {
            case 0:
                CGSize(width: UIScreen.main.bounds.width - 40, height: 212)

            case 1:
                CGSize(width: UIScreen.main.bounds.width - 40, height: 588)

            default:
                CGSize.zero
            }
        } else {
            CGSize(width: 44, height: 122)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == detailCollectionView {
            switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCardView.identifier, for: indexPath) as? TimeCardView else { return UICollectionViewCell() }
                cell.configTimeCardView(indexNumber: indexNumber)
                cell.weatherTimeCollectionView.delegate = self
                cell.weatherTimeCollectionView.dataSource = self
                return cell
            case 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TenDaysCardView.identifier, for: indexPath) as? TenDaysCardView else { return UICollectionViewCell() }
                self.caculateMinMax(data: tenDaysWeatherDummy)
                
                cell.tenDaysTableView.delegate = self
                cell.tenDaysTableView.dataSource = self
                return cell
            default:
                return UICollectionViewCell()
            }
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailTimeCollectionViewCell.identifier, for: indexPath) as? DetailTimeCollectionViewCell else { return UICollectionViewCell() }
            cell.bindData(data: weatherDummy[self.indexNumber], row: indexPath.row)
            return cell
        }
    }
}


extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch indexPath.section {
        case 0:
            if kind == UICollectionView.elementKindSectionHeader {
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailLocalView.identifier, for: indexPath) as! DetailLocalView
                headerView.configLocalView(indexNumber: indexNumber)
                return headerView
            } else {
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == detailCollectionView {
            switch section {
            case 0:
                return CGSize(width: UIScreen.main.bounds.width, height: 260)
            default:
                return CGSize.zero
            }
        } else {
            return CGSize.zero
        }
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView == detailCollectionView {
//            return 20
//        } else {
//            return 22
//        }
//    }
}

extension DetailViewController: UITableViewDelegate { }
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDaysTableViewCell.identifier, for: indexPath) as? TenDaysTableViewCell else { return UITableViewCell() }
        cell.bindData(data: tenDaysWeatherDummy[indexPath.row])
        cell.selectionStyle = .none
        cell.minMinTemp = minMinTemp
        cell.maxMaxTemp = maxMaxTemp
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
