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
    
    override func loadView() {
        createView()
    }
    
    func createView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
