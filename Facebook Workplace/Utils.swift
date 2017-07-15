//
//  Utils.swift
//  Facebook Workplace
//
//  Created by Konstantinos Kontos on 15/07/2017.
//  Copyright © 2017 Handmade Apps Ltd. All rights reserved.
//

import Foundation

// https://work-79944376.facebook.com/photo/download/?fbid=114762062492678&ext=1500358780&hash=AeSX8pIof0lvhVg6
// https://lookaside.fbsbx.com/file/Copyrightsworld-API.pdf?token=AWzTQia0_KMlbQWprvarM3fXWvrzN6tbbFv0fNQz4EtvkhxlrK9w_rAUKiY5YWu6jWk4MeKPMsc9trdUuLnTGjivoIngiyxgINLSVSID1P1fB18FtYo1Y8hAKr8aYIhhXgpK0GsR9kmR6QzvrXckjnCzpicZ9xJOswBnrO6TyTy5FCp3jYwY65vnEaPXLOwq4GHcdUbOrxrTgGg6Gs7KO73R


func saveToDownloadsFolder(fromSourceURL sourceURL: URL, withDelegate delegate: NSURLDownloadDelegate?) {
    let downloadRequest = URLRequest(url: sourceURL)
    
    if delegate != nil {
        _ = NSURLDownload(request: downloadRequest, delegate: delegate!)
    } else {
        _ = NSURLDownload(request: downloadRequest, delegate: nil)
    }
    
}
