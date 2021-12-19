//
//  VKLoginWebView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 14.12.2021.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    @ObservedObject var session = Session.instance
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    struct AuthScope: OptionSet {
            let rawValue: Int
    
            static let friend    = AuthScope(rawValue: 1 << 1)
            static let photos  = AuthScope(rawValue: 1 << 2)
            static let wall   = AuthScope(rawValue: 1 << 13)
            static let offline   = AuthScope(rawValue: 1 << 16)
            static let groups   = AuthScope(rawValue: 1 << 18)
            static let all: AuthScope = [.friend, .photos, .wall, .offline, .groups]
        }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: session.cliendId),
            URLQueryItem(name: "scope", value: "\(AuthScope.all.rawValue)"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: session.version)
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    @ObservedObject var session = Session.instance
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
                  decisionHandler(.allow)
                  return
              }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
                
        else {
            decisionHandler(.allow)
            return
        }
        
        session.token = token
        session.userId = userIdString
        session.isAuthorized = true
        
        decisionHandler(.cancel)
    }
}