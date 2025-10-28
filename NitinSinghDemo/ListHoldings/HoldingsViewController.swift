//
//  HoldingsViewController.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import UIKit

class HoldingsViewController: UIViewController {
    
    private let viewModel: HoldingsViewModel
    private var holdings: [Holding] = []
    private var isFirstAppearance = true
    
    private lazy var activityIndicator: ActivityIndicator = {
        let indicator = ActivityIndicator(frame: .zero)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .systemYellow
        return indicator
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HoldingCellView.self, forCellReuseIdentifier: "holdingCell")
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        return tableView
    }()
    
    private lazy var portfolioButton: UIBarButtonItem = {
        let image = UIImage(systemName: "sum")
        let btn = UIBarButtonItem(image: image, style: .prominent, target: self, action: #selector(portfolioBtnTapped))
        return btn
    }()
    
    private lazy var refreshButton: UIBarButtonItem = {
        
        let image = UIImage(systemName: "arrow.clockwise")
        let btn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(refreshHoldings))
        return btn
    }()
    
    private lazy var rightBarButtonGroup: UIBarButtonItemGroup = {
        let group = UIBarButtonItemGroup(barButtonItems: [portfolioButton, refreshButton], representativeItem:  nil)
        return group
    }()
    
    init(viewModel: HoldingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.fill(container: view)
        navigationItem.title = "Holdings"
        navigationItem.largeTitle = "Holdings"
        navigationItem.largeTitleDisplayMode = .inline
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isFirstAppearance {
            getHoldings()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if isFirstAppearance {
            navigationItem.setRightBarButtonItems([portfolioButton, refreshButton], animated: true)
            isFirstAppearance = false
        }
    }
    
    func getHoldings() {
        toggleActivityIndicator(on: true)
        Task {
            do {
                let holdings = try await viewModel.getHoldings()
                toggleActivityIndicator(on: false)
                showHoldings(holdings)
            } catch {
                print("Failed with error: \(error)")
            }
        }
    }
    
    @MainActor
    private func showHoldings(_ holdings: [Holding]) {
        self.holdings = holdings
        tableView.reloadData()
    }
    
    private func toggleActivityIndicator(on: Bool) {
        if on {
            view.addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        } else {
            activityIndicator.removeFromSuperview()
        }
    }
    
    @objc
    func portfolioBtnTapped() {
        
    }
    
    @objc
    func refreshHoldings() {
        getHoldings()
    }
    
}

extension HoldingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holdings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holdingCell", for: indexPath) as? HoldingCellView ?? HoldingCellView(style: .default, reuseIdentifier: "holdingCell")
        let holding = holdings[indexPath.row]
        cell.symbol = holding.symbol
        cell.quantity = Int(holding.quantity)
        cell.lastTradedPrice = holding.lastTradedPrice
        cell.pnlTotal = holding.pnlTotal
        return cell
    }
}
