//
//  SceneDelegate.swift
//  NitinSinghDemo
//
//  Created by Nitin Kumar Singh on 27/10/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        scene.delegate = self
        window = UIWindow(windowScene: scene)
        let apiEndpoint = URL(string: "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/")!
        let viewModel = HoldingsViewModel(loader: RemoteHoldingsLoader(url: apiEndpoint))
        window?.rootViewController = UINavigationController(rootViewController: HoldingsViewController(viewModel: viewModel))
        window?.makeKeyAndVisible()
    }
    
}

