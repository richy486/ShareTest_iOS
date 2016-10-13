//
//  ViewController.swift
//  ShareTest
//
//  Created by Richard Adem on 10/13/16.
//  Copyright © 2016 Richard Adem. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var textTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imageSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchUpIn_shareButton(_ sender: AnyObject) {
        
//        let composer = SLComposeViewController()
        
        var shareContent:[Any] = []
        
        if let text = textTextField.text, text.characters.count > 0 {
            shareContent.append(text)
        }
        
        if let urlString = urlTextField.text, urlString.characters.count > 0 {
            
            if urlString.contains("http://") || urlString.contains("https://"){
                if let nsURL = NSURL(string: urlString) {
                    shareContent.append(nsURL)
                }
            } else {
                if let nsURL = NSURL(string: "http://\(urlString)") {
                    shareContent.append(nsURL)
                }
                
            }
        
            
        }
        
        if imageSwitch.isOn {
            if let image = UIImage(named: "mario.JPG") {
                shareContent.append(image)
            }
        }
        
        if shareContent.count > 0 {
        
            let activityViewController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
            present(activityViewController, animated: true) {
                // ...
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Not sharing anything", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        
    }

    @IBAction func touchUpIn_fillButton(_ sender: AnyObject) {
        textTextField.text = "Mario!"
        urlTextField.text = "http://www.nintendo.com/"
        imageSwitch.isOn = true
    }
    @IBAction func touchUpIn_clearButton(_ sender: AnyObject) {
        textTextField.text = ""
        urlTextField.text = ""
        imageSwitch.isOn = false
    }
}

