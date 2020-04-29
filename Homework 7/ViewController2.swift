//
//  ViewController2.swift
//  Homework 7
//
//  Created by Elias Mobrin on 4/29/20.
//  Copyright © 2020 Elias Mobrin. All rights reserved.
//

import UIKit
import WebKit
import MessageUI

class ViewController2: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    
    @IBAction func sendText(_ sender: Any) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
      
        composeVC.recipients = ["+46707660200"]
        composeVC.body = "Hello. This message is being sent from my app"
        
        if MFMessageComposeViewController.canSendText() {
             self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
    
     

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        
        let myURL = URL(string:"https://www.liverpoolfc.com/fans/fan-experience/visiting-anfield")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
