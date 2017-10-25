//
//  ExerciseVC.swift
//  DiaLyVietNam
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import WebKit

class ExerciseVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webKit: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webKit.delegate = self
        if let path = Bundle.main.path(forResource: "Index", ofType: "html") {
            print(URL(fileURLWithPath: path))
            webKit.loadRequest(URLRequest(url: URL(fileURLWithPath: path)))
        }
        // Do any additional setup after loading the view.
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        print(error.localizedDescription)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
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
