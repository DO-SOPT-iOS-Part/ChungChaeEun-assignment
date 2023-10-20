//
//  UIStackView+.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/21/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
