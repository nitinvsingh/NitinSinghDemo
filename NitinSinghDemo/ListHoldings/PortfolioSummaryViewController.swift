//
//  PortfolioSummaryViewController.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 29/10/25.
//

import UIKit

class PortfolioSummaryViewController: UIViewController {
    
    private let summary: PortfolioSummary
    
    private lazy var currentValueView: TrendView = {
        let trendView = TrendView(frame: .zero)
        trendView.translatesAutoresizingMaskIntoConstraints = false
        trendView.title.text = "TOTAL VALUE"
        trendView.subtitle.text = "₹\(round(summary.currentValue) * 100 / 100.0)"
        let imageName = summary.currentValue < summary.totalInvestment ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis"
        trendView.trendImageView.image = UIImage(systemName: imageName)
        let tintColor = summary.currentValue < summary.totalInvestment ? UIColor.systemRed : .systemGreen
        trendView.trendImageView.tintColor = tintColor
        trendView.layer.cornerRadius = 15.0
        trendView.backgroundColor = .systemGray3
        return trendView
    }()
    
    private lazy var totalInvestmentView: TrendView = {
        let trendView = TrendView(frame: .zero)
        trendView.translatesAutoresizingMaskIntoConstraints = false
        trendView.title.text = "INVESTMENT"
        trendView.subtitle.text = "₹\(round(summary.totalInvestment) * 100 / 100.0)"
        let imageName = "chart.line.flattrend.xyaxis"
        trendView.trendImageView.image = UIImage(systemName: imageName)
        trendView.layer.cornerRadius = 15.0
        trendView.backgroundColor = .systemGray3
        return trendView
    }()
    
    private lazy var pnlToday: TrendView = {
        let trendView = TrendView(frame: .zero)
        trendView.translatesAutoresizingMaskIntoConstraints = false
        trendView.title.text = "PROFIT TODAY"
        trendView.subtitle.text = "₹\(round(summary.pnlToday) * 100 / 100.0)"
        let imageName = summary.pnlToday < 0 ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis"
        trendView.trendImageView.image = UIImage(systemName: imageName)
        let tintColor = summary.pnlToday < 0 ? UIColor.systemRed : .systemGreen
        trendView.trendImageView.tintColor = tintColor
        trendView.layer.cornerRadius = 15.0
        trendView.backgroundColor = .systemGray3
        return trendView
    }()
    
    private lazy var pnlTotal: TrendView = {
        let trendView = TrendView(frame: .zero)
        trendView.translatesAutoresizingMaskIntoConstraints = false
        trendView.title.text = "PROFIT OVERALL"
        trendView.subtitle.text = "₹\(round(summary.pnlTotal) * 100 / 100.0)"
        let imageName = summary.pnlTotal < 0 ? "chart.line.downtrend.xyaxis" : "chart.line.uptrend.xyaxis"
        trendView.trendImageView.image = UIImage(systemName: imageName)
        let tintColor = summary.pnlTotal < 0 ? UIColor.systemRed : .systemGreen
        trendView.trendImageView.tintColor = tintColor
        trendView.layer.cornerRadius = 15.0
        trendView.backgroundColor = .systemGray3
        return trendView
    }()
    
    
    init(summary: PortfolioSummary) {
        self.summary = summary
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Portfolio"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissSelf))
        view.backgroundColor = .systemBackground
        view.addSubview(currentValueView)
        view.addSubview(totalInvestmentView)
        view.addSubview(pnlToday)
        view.addSubview(pnlTotal)
        
        NSLayoutConstraint.activate([
            currentValueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            totalInvestmentView.topAnchor.constraint(equalTo: currentValueView.bottomAnchor, constant: 10),
            pnlToday.topAnchor.constraint(equalTo: totalInvestmentView.bottomAnchor, constant: 10),
            pnlTotal.topAnchor.constraint(equalTo: pnlToday.bottomAnchor, constant: 10),
            pnlTotal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            currentValueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            currentValueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            totalInvestmentView.leadingAnchor.constraint(equalTo: currentValueView.leadingAnchor),
            totalInvestmentView.trailingAnchor.constraint(equalTo: currentValueView.trailingAnchor),
            pnlToday.leadingAnchor.constraint(equalTo: currentValueView.leadingAnchor),
            pnlToday.trailingAnchor.constraint(equalTo: currentValueView.trailingAnchor),
            pnlTotal.leadingAnchor.constraint(equalTo: currentValueView.leadingAnchor),
            pnlTotal.trailingAnchor.constraint(equalTo: currentValueView.trailingAnchor),
            
            totalInvestmentView.heightAnchor.constraint(equalTo: currentValueView.heightAnchor),
            pnlToday.heightAnchor.constraint(equalTo: currentValueView.heightAnchor),
            pnlTotal.heightAnchor.constraint(equalTo: currentValueView.heightAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc
    func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
}
