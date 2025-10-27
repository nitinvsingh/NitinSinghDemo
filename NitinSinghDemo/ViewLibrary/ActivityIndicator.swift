//
//  ActivityIndicator.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import UIKit

class ActivityIndicator: UIView {
    private lazy var indicatorImageView: UIImageView =  {
        let fontConfig = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let weightConfig = UIImage.SymbolConfiguration(weight: .black)
        let baseConfig = weightConfig.applying(fontConfig)
        let image = UIImage(systemName: "indianrupeesign.ring.dashed", withConfiguration: baseConfig)
        let imageView = UIImageView(image: image)
        imageView.addSymbolEffect(.rotate.byLayer, options: .repeat(.continuous))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        indicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(indicatorImageView)
        NSLayoutConstraint.activate([
            indicatorImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
