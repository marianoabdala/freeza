import Foundation
import UIKit

class URLViewController: UIViewController {
    
    var url: URL?
    
    @IBOutlet private weak var webView: UIWebView!
    
    fileprivate let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.activityIndicatorView)
        self.activityIndicatorView.startAnimating()

        if let url = url {
        
            self.webView.loadRequest(URLRequest(url: url))
        }
    }
}

extension URLViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {

        self.activityIndicatorView.stopAnimating()
    }
}
