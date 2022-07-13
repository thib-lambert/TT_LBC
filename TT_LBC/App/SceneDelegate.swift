//
//  SceneDelegate.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	// MARK: - Variables
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		self.window = UIWindow(windowScene: windowScene)
		self.window?.rootViewController = UIViewController()
		self.window?.rootViewController?.view.backgroundColor = .green
		self.window?.makeKeyAndVisible()
	}
}
