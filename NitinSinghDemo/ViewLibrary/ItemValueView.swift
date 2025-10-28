//
//  ItemValueView.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 29/10/25.
//

import UIKit

class ItemValueView: UIView {
    let itemNameLabel: UILabel
    let itemValueLabel: UILabel
    
    override init(frame: CGRect) {
        itemNameLabel = UILabel(frame: .zero)
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        itemValueLabel = UILabel(frame: .zero)
        itemValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        addSubview(itemNameLabel)
        addSubview(itemValueLabel)
        
        NSLayoutConstraint.activate([
            itemNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            itemNameLabel.topAnchor.constraint(equalTo: topAnchor),
            itemNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            itemValueLabel.topAnchor.constraint(equalTo: topAnchor),
            itemValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: itemValueLabel.leadingAnchor, constant: -3)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
