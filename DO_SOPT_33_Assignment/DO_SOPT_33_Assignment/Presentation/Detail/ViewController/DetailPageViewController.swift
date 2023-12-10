//
//  DetailPageViewController.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/17/23.
//

import UIKit

import SnapKit
import Then

class DetailPageViewController: UIViewController {
    
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    lazy var detailViewControllers: [DetailViewController] = []
    
    let tabBarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 82))
    let mapButton = UIButton()
    lazy var listButton = UIButton()
    let tabBarStackView = UIStackView()
    let compassButton = UIButton()
    let dotButton = UIButton()
    
    let numberOfDetailViews = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        setStyle()
        setLayout()
    }
    
    func setStyle() {
        pageViewController.do {
            $0.dataSource = self
        }
        
        tabBarView.do {
            $0.backgroundColor = UIColor(red: 42 / 255, green: 48 / 255, blue: 64 / 255, alpha: 1)
        }
        
        mapButton.do {
            $0.setImage(UIImage(named: "icMap"), for: .normal)
        }
        
        listButton.do {
            $0.setImage(UIImage(named: "icList"), for: .normal)
            $0.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        }
        
        tabBarStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        compassButton.do {
            $0.setImage(UIImage(named: "icCompass"), for: .normal)
        }
        
        dotButton.do {
            $0.setImage(UIImage(named: "icDot"), for: .normal)
        }
    }
    
    func setLayout() {
        view.addSubViews(pageViewController.view)
        pageViewController.view.addSubViews(tabBarView)
        
        tabBarView.addSubViews(mapButton,
                               listButton,
                               tabBarStackView)
        
        tabBarStackView.addArrangedSubview(compassButton)
        tabBarStackView.addArrangedSubview(dotButton)
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tabBarView.snp.makeConstraints {
            $0.width.bottom.equalToSuperview()
            $0.height.equalTo(82)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(10)
        }
        
        listButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        tabBarStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func listButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension DetailPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentIndex = detailViewControllers.firstIndex(of: viewController as! DetailViewController), currentIndex > 0 {
            return detailViewControllers[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentIndex = detailViewControllers.firstIndex(of: viewController as! DetailViewController), currentIndex < detailViewControllers.count - 1 {
            return detailViewControllers[currentIndex + 1]
        }
        return nil
    }
}
