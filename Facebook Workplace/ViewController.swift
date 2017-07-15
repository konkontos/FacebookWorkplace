//
//  ViewController.swift
//  Facebook Workplace
//
//  Created by Konstantinos Kontos on 03/07/2017.
//  Copyright © 2017 Handmade Apps Ltd. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate, WKUIDelegate, NSURLDownloadDelegate {

    @IBOutlet var webView: WKWebView!
    
    var workplaceSite: String {
        return Bundle.main.infoDictionary!["WorkplaceSite"] as! String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        NSLog(NSStringFromClass(ViewController.classForCoder()).components(separatedBy: ".").last!)
        
        // Do any additional setup after loading the view.
        
        if #available(OSX 10.11, *) {
            webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4"
        } else {
            // Fallback on earlier versions
        }
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
//        NSApplication.shared().keyWindow?.initialFirstResponder = webView
        
        let loadRequest = URLRequest(url: URL(string: workplaceSite)!)
//        loadRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        webView.load(loadRequest)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    // MARK: - NSURLDownloadDelegate
    
    func downloadDidBegin(_ download: NSURLDownload) {
        NSLog("")
    }
    
    
    func downloadDidFinish(_ download: NSURLDownload) {
        NSLog("")
    }
    
    
    func download(_ download: NSURLDownload, didFailWithError error: Error) {
        NSLog("")
    }
    
    func download(_ download: NSURLDownload, decideDestinationWithSuggestedFilename filename: String) {
        let downloadFolder = NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true)[0]
        
        let downloadFilename = (downloadFolder as NSString).appendingPathComponent(filename)
        
        download.setDestination(downloadFilename, allowOverwrite: false)
    }
    
    // MARK: - Navigation Delegate
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        
        if let webURL = webView.url {
            
            // Capture file and photo downloads
            if webURL.absoluteString.contains("/file/") || webURL.absoluteString.contains("/photo/download/") {
                webView.stopLoading()
                
                saveToDownloadsFolder(fromSourceURL: webURL, withDelegate: self)
            }
            
        }
        
        
    }
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // navigationAction.request.url
        // navigationAction.sourceFrame.request.url (https://work-79944376.facebook.com/?sk=nf)
        // navigationAction.navigationType (linkActivated = 0)
        
        if navigationAction.navigationType == .linkActivated, let targetURL = navigationAction.request.url{
            
            if targetURL.absoluteString.contains(workplaceSite) {
                webView.load(navigationAction.request)
            } else {
                NSWorkspace.shared().open(targetURL)
            }
            
        }
        
        return nil
    }

    
    // MARK: - UI Delegate
    
    @available(OSX 10.12, *)
    func webView(_ webView: WKWebView, runOpenPanelWith parameters: WKOpenPanelParameters, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping ([URL]?) -> Void) {
        
        let uploadPanel = NSOpenPanel()
        uploadPanel.allowsMultipleSelection = parameters.allowsMultipleSelection
        
        uploadPanel.begin { (result: Int) in
            
            if result == NSFileHandlingPanelOKButton {
                completionHandler(uploadPanel.urls)
            } else {
                completionHandler([])
            }
            
        }
        
    }
    
    
/*
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        NSLog("")
    }
*/
    
    
}

