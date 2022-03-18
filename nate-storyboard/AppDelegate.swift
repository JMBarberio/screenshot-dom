//
//  AppDelegate.swift
//  nate-storyboard
//
//  Created by Joe Barberio on 3/29/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
            if let scheme = url.scheme,
                scheme.caseInsensitiveCompare("nate-storyboard") == .orderedSame,
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

            return true
        }

}

