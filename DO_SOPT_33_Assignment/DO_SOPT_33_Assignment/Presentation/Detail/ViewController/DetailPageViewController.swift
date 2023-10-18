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
    //    let firstDetailViewController = DetailViewController()
    lazy var detailViewControllers: [DetailViewController] = []
    
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
    }
    
    func setLayout() {
        view.addSubViews(pageViewController.view)
        
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension DetailPageViewController: UIPageViewControllerDataSource {
    // UIPageViewControllerDataSource 메서드
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
