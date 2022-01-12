//
//  ViewController.swift
//  Bonjourr Startpage
//
//  Created by Victor Azevedo on 12/01/2022.
//

import Cocoa
import SafariServices
import WebKit

let extensionBundleIdentifier = "com.bonjourr.Bonjourr-Startpage.Extension"

class ViewController: NSViewController, WKNavigationDelegate, WKScriptMessageHandler {

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.navigationDelegate = self

        self.webView.configuration.userContentController.add(self, name: "controller")

        self.webView.loadFileURL(Bundle.main.url(forResource: "Main", withExtension: "html")!, allowingReadAccessTo: Bundle.main.resourceURL!)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { (state, error) in
            guard let state = state, error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }

            DispatchQueue.main.async {
                webView.evaluateJavaScript("show(\(state.isEnabled))")
            }
        }
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
		
		if (message.body as! String == "close-window") {
			NSApplication.shared.terminate(nil)
		}

		else if (message.body as! String == "open-preferences") {
			SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
				DispatchQueue.main.async {
					NSApplication.shared.terminate(nil)
				}
			}
		}
		
		else {
			return;
		}
    }

}
