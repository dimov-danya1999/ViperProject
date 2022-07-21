//
//  SceneDelegate.swift
//  ViperProjcet
//
//  Created by mac on 12.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: FirstAssembly.assembleModule())
        window.makeKeyAndVisible()
        self.window = window
        
    }
}

