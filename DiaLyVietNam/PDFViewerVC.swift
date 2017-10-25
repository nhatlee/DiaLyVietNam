//
//  PDFViewerVC.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

class PDFViewerVC: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var pdfFileName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let pathExtention = pdfFileName?.fileName()
        self.navigationItem.title = pathExtention
        if let path = pdfFileName{
            webview.loadRequest(URLRequest(url: URL(fileURLWithPath: path)))
            webview.scalesPageToFit = true
        } else {
            print("File path not exist")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    
    func fileName() -> String {
        
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent {
            return fileNameWithoutExtension
        } else {
            return ""
        }
    }
    
    func fileExtension() -> String {
        
        if let fileExtension = NSURL(fileURLWithPath: self).pathExtension {
            return fileExtension
        } else {
            return ""
        }
    }
}
