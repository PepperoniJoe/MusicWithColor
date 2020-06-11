//
//  SceneDelegate.swift
//  MusicWithColor
//
//  Created by Marcy Vernon on 5/28/20.
//  Copyright © 2020 Marcy Vernon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect   (_ scene : UIScene) {}
    func sceneDidBecomeActive (_ scene : UIScene) {}
    func sceneWillResignActive(_ scene : UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {
        NotificationCenter.default.post(name: .sceneWillEnterForeground, object: nil)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        NotificationCenter.default.post(name: .sceneDidEnterBackground, object: nil)
    }
}

