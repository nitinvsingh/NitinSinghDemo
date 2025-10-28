//
//  HoldingCellView.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 29/10/25.
//

import UIKit

class HoldingCellView: UITableViewCell {
    
    private let symbolValue = UILabel(frame: .zero)
    private let quantityLabel = ItemValueView(frame: .zero)
    private let ltpLabel = ItemValueView(frame: .zero)
    private let pnlLabel = UILabel(frame: .zero)
    
    var symbol: String = "" {
        didSet {
            symbolValue.text = symbol.uppercased()
        }
    }
    var quantity: Int = 0 {
        didSet {
            quantityLabel.itemNameLabel.text = "\(quantity)"
        }
    }
    var lastTradedPrice: Double = 0.0 {
        didSet {
            ltpLabel.itemNameLabel.text = "₹\(round(lastTradedPrice * 100) / 100.0)"
        }
    }
    var pnlTotal: Double = 0.0 {
        didSet {
            pnlLabel.text = "₹\(round(pnlTotal * 100) / 100.0)"
            pnlLabel.textColor = pnlTotal > 0 ? .systemGreen : .systemRed
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        symbolValue.translatesAutoresizingMaskIntoConstraints = false
        symbolValue.font = UIFont.preferredFont(forTextStyle: .title2)
        
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.itemNameLabel.text = "\(quantity)"
        quantityLabel.itemNameLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        quantityLabel.itemValueLabel.text = "units"
        quantityLabel.itemValueLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        ltpLabel.translatesAutoresizingMaskIntoConstraints = false
        ltpLabel.itemNameLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        ltpLabel.itemNameLabel.textColor = .systemOrange
        ltpLabel.itemValueLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        ltpLabel.itemValueLabel.text = "/ unit"
        
        pnlLabel.translatesAutoresizingMaskIntoConstraints = false
        pnlLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        pnlLabel.text = "₹\(pnlTotal)"
        
        
        
        contentView.addSubview(symbolValue)
        contentView.addSubview(ltpLabel)
        contentView.addSubview(quantityLabel)
        contentView.addSubview(pnlLabel)
        NSLayoutConstraint.activate([
            symbolValue.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            symbolValue.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            ltpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ltpLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            pnlLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            pnlLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            quantityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            quantityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            symbolValue.bottomAnchor.constraint(equalTo: ltpLabel.topAnchor, constant: -5),
            pnlLabel.bottomAnchor.constraint(equalTo: quantityLabel.topAnchor, constant: -5)
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
