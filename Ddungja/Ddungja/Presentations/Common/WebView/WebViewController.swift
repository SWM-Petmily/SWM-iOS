//
//  WebViewController.swift
//  Ddungja
//
//  Created by 오승기 on 2023/09/07.
//

import Foundation
import WebKit

final class WebviewController: UIViewController, WKNavigationDelegate {
    lazy var webview: WKWebView = {
        let webview = WKWebView()
        webview.translatesAutoresizingMaskIntoConstraints = false
        
        return webview
    }()
    private lazy var progressbar: UIProgressView = {
        let progressbar = UIProgressView()
        progressbar.translatesAutoresizingMaskIntoConstraints = false
        progressbar.progress = 0.1
        return progressbar
    }()
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        addSubviews()
        webview.frame = view.frame
        setContraints()
        setProgressBarPosition()
        
        webview.scrollView.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "estimatedProgress":
            if webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, animations: { () in
                    self.progressbar.alpha = 0.0
                }, completion: { finished in
                    self.progressbar.setProgress(0.0, animated: false)
                })
            } else {
                progressbar.isHidden = false
                progressbar.alpha = 1.0
                progressbar.setProgress(Float(webview.estimatedProgress), animated: true)
            }

        case "contentOffset":
            setProgressBarPosition()

        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.isHidden = true
    }
    
    private func addSubviews() {
        view.addSubview(webview)
        view.addSubview(activityIndicator)
        webview.addSubview(progressbar)
    }
    
    private func setContraints() {
        view.addConstraints([
            webview.topAnchor.constraint(equalTo: view.topAnchor),
            webview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        view.addConstraints([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setProgressBarPosition() {
        webview.removeConstraints(webview.constraints)
        webview.addConstraints([
            progressbar.topAnchor.constraint(equalTo: webview.topAnchor, constant: webview.scrollView.contentOffset.y * -1),
            progressbar.leadingAnchor.constraint(equalTo: webview.leadingAnchor),
            progressbar.trailingAnchor.constraint(equalTo: webview.trailingAnchor),
        ])
    }
    
    deinit {
        self.webview.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webview.scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
}
