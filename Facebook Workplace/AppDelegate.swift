//
//  AppDelegate.swift
//  Facebook Workplace
//
//  Created by Konstantinos Kontos on 03/07/2017.
//  Copyright © 2017 Handmade Apps Ltd. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        NSApp.windows[0].makeKeyAndOrderFront(nil)
        return true
    }
    
}

