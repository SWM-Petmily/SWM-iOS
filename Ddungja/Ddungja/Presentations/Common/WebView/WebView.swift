//
//  WebView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/09/05.
//

import SwiftUI
import WebKit

struct WebView: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: Context) -> WebviewController {
        guard let url = URL(string: url) else {
            return WebviewController()
        }
        let webviewController = WebviewController()
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        webviewController.webview.load(request)
        return webviewController
    }
    
    func updateUIViewController(_ webView: WebviewController, context: Context) {

    }
}
