//
//  SceneDelegate.swift
//  NikeTop100
//
//  Created by Ray Dolber on 3/22/20.
//  Copyright © 2020 Pixelhacker. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
        
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
		window?.rootViewController = UINavigationController(rootViewController: AlbumsController())
        window?.makeKeyAndVisible()
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}
