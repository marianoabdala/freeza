import Foundation
import UIKit

class URLViewController: UIViewController {
    
    var url: NSURL?
    
    @IBOutlet private weak var webView: UIWebView!
    
    private let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.activityIndicatorView)
        self.activityIndicatorView.startAnimating()

        if let url = url {
        
            self.webView.loadRequest(NSURLRequest(URL: url))
        }
    }
}

extension URLViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {

        self.activityIndicatorView.stopAnimating()
    }
}
