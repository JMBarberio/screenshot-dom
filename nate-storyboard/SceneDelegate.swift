//
//  SceneDelegate.swift
//  nate-storyboard
//
//  Created by Joe Barberio on 3/29/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Called when opening a new scene
        func scene(
            _ scene: UIScene,
            willConnectTo session: UISceneSession,
            options connectionOptions: UIScene.ConnectionOptions
        ) {
            guard let _ = (scene as? UIWindowScene) else { return }
            if let url = connectionOptions.urlContexts.first?.url {
                handleIncomingURL(url)
            }
        }

        // Called on existing scenes
        func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
            if let url = URLContexts.first?.url {
                handleIncomingURL(url)
            }
        }

        func handleIncomingURL(_ url: URL) {
            if let scheme = url.scheme,
                scheme.caseInsensitiveCompare("ShareExtension101") == .orderedSame,
                let page = url.host {

                var parameters: [String: String] = [:]
                URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                    parameters[$0.name] = $0.value
                }
                
                for parameter in parameters where parameter.key.caseInsensitiveCompare("url") == .orderedSame {
                        UserDefaults().set(parameter.value, forKey: "incomingURL")
                    }

                print("redirect(to: \(page), with: \(parameters))")
            }
        }


}

