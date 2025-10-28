//
//  UIView+AutoLayout.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 29/10/25.
//

import UIKit

extension UIView {
    func fill(container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor),
            topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
