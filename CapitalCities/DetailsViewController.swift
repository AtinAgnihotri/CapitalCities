//
//  DetailsViewController.swift
//  CapitalCities
//
//  Created by Atin Agnihotri on 02/08/21.
//
import WebKit
import UIKit

class DetailsViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var city: String!
    var progressView: UIProgressView!
    var progressBarButtonItem: UIBarButtonItem!
    
    override func loadView() {
        createView()
        setupNavigationBar()
    }
    
    func createView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func setupNavigationBar() {
        title = city
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: progressView)
        
        // Add KVO to Web View loading
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWikiPageOnCity()
    }
    
    func loadWikiPageOnCity() {
        let url = URL(string: "https://en.wikipedia.org/wiki/" + city)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
            if webView.estimatedProgress == 1 {
                toggleToolBarButtonItems(showProgressBar: false)
            } else {
                toggleToolBarButtonItems(showProgressBar: true)
            }
        }
    }
    
    func toggleToolBarButtonItems(showProgressBar: Bool) {
        if showProgressBar {
            progressView.isHidden = false
        } else {
            progressView.isHidden = true
        }
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
