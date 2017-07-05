//
//  ViewController.swift
//  Facebook Workplace
//
//  Created by Konstantinos Kontos on 03/07/2017.
//  Copyright © 2017 Handmade Apps Ltd. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(OSX 10.11, *) {
            webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4"
        } else {
            // Fallback on earlier versions
        }
        
        webView.load(URLRequest(url: URL(string: "http://work.facebook.com")!))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

