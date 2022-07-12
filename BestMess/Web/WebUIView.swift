//
//  WebUIView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import SwiftUI
import WebKit

struct WebUIView: UIViewRepresentable {
    
    //var url: URL
    var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

