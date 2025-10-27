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
        window?.rootViewController = UINavigationController(rootViewController: HoldingsViewController())
        window?.makeKeyAndVisible()
    }
    
}

