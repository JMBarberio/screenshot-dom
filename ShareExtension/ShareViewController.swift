//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Joe Barberio on 3/29/21.
//

import UIKit
import Social
import CoreServices
import Foundation

class ShareViewController: SLComposeServiceViewController {
    
    var shareID = "group.nate_share"
    var screenshot: UIImage!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didSelectPost() {
        super.didSelectPost()
        self.dataAttachment()
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)

    }
    
    func dataAttachment() -> UIImage {
        
        let screenshot = takeScreenshot()
        let NS_screen = NSData(data: screenshot.pngData()!)
        //NS_screen as! NSExtensionItem
        self.saveDataToUserDefaults(suiteName: self.shareID, dataKey: "Image", dataValue: NS_screen)
        
        return screenshot
    }
 
    
    func saveDataToUserDefaults(suiteName: String, dataKey: String, dataValue: NSData) {
        if let preferences = UserDefaults(suiteName: suiteName) {
            preferences.removeObject(forKey: dataKey)
            preferences.set(dataValue, forKey: dataKey)
        }
    }
    
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: view.bounds.width, height: view.bounds.height),
            false,
            2
        )

        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        print(screenshot)
        return screenshot
    }
    
}
