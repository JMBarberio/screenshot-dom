//
//  ViewController.swift
//  nate-storyboard
//
//  Created by Joe Barberio on 3/29/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var finalImgView: UIImageView!
    @IBOutlet weak var contentSize: NSLayoutConstraint!
    var shareID = "group.nate_share"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "Unknown")
        imgView.image = image
        finalImgView.image = getData()
    }
    
    public static func getVC() -> ViewController? {
        if let vc = UIStoryboard (name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            return vc
        }
        return nil
    }
    
    @objc func getData() -> UIImage {
        print("top of get data")
        let ShareVC = ShareViewController()
        ShareVC.viewDidLoad()
        let screenshot = ShareVC.takeScreenshot()

        return screenshot
    }
    
}



