//
//  TrendView.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 29/10/25.
//

import UIKit

class TrendView: UIView {
    lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    lazy var trendImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        addSubview(subtitle)
        addSubview(trendImageView)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -5),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -10),
            subtitle.trailingAnchor.constraint(equalTo: trendImageView.leadingAnchor, constant: -10),
            
            trendImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trendImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            trendImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            trendImageView.widthAnchor.constraint(equalTo: heightAnchor, constant: -20)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
