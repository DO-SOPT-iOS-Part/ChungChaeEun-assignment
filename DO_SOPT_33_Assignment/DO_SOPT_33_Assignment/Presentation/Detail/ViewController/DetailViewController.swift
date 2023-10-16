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
    }
    
    private func setLayout() {
        self.view.addSubViews(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
