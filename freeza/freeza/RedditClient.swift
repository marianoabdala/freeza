import Foundation

class RedditClient: Client {
    
    private let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())

    /**
     Fetches the top links from Reddit.
     
     - parameter completionHandler: Returns dictionary. Returning in main thread is not guaranteed.
     - parameter errorHandler:      Returns error message.
     */
    func fetchTop(withCompletion completionHandler:([String: AnyObject]) -> (), errorHandler:(message: String) -> ()) {
        
        let requestURLString = "https://www.reddit.com/top.json?limit=50"
        
        guard let requestURL = NSURL(string: requestURLString) else {
            
            errorHandler(message: "An error occurred formatting the fetch URL: \(requestURLString)")
            return
        }
        
        let request = NSURLRequest(URL: requestURL)
        
        self.fetch(request, completionHandler: completionHandler, errorHandler: errorHandler)
    }
    
    private func fetch(request: NSURLRequest, completionHandler:([String: AnyObject]) -> (), errorHandler:(message: String) -> ()) {
        
        let dataTask = defaultSession.dataTaskWithRequest(request) { (data, response, error) in
            
            guard let _ = response else {
                
                errorHandler(message: "Please check your internet connection. Server may be down.")
                return
            }
            
            guard let httpResponse = response as? NSHTTPURLResponse else {
                
                errorHandler(message: "Invalid server response type.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            guard statusCode == 200 else {
                
                errorHandler(message: "Invalid response code: \(statusCode)")
                return
            }
            
            guard let data = data else {
                
                errorHandler(message: "Invalid response Data (empty).")
                return
            }
            
            do {
                
                guard let dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String: AnyObject] else {
                    
                    errorHandler(message: "An error occurrred parsing the response.")
                    return
                }
                
                completionHandler(dictionary)
                
            } catch {
                
                errorHandler(message: "An error occurrred parsing the response.")
            }
            
        }
        
        dataTask.resume()
    }
}
