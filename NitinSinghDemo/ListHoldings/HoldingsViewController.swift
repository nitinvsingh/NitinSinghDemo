//
//  HoldingsViewController.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import UIKit

class HoldingsViewController: UIViewController {
    
    private lazy var activityIndicator: ActivityIndicator = {
        let indicator = ActivityIndicator(frame: .zero)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = .systemYellow
        return indicator
    }()
    
    var showIndicator: Bool = false {
        didSet {
            if let _ = viewIfLoaded {
                toggleActivityIndicator()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Portfolio"
        view.backgroundColor = .systemBackground
        getPortfolio()
    }
    
    func getPortfolio() {
        showIndicator = true
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] _ in
            self?.showIndicator.toggle()
        }
    }
    
    private func toggleActivityIndicator() {
        if showIndicator {
            view.addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        } else {
            activityIndicator.removeFromSuperview()
        }
    }
    
}
