import Foundation

class RedditClient: Client {
    
    private let defaultSession = URLSession(configuration: URLSessionConfiguration.default)

    /**
     Fetches the top links from Reddit.
     
     - parameter after:             Tag to be sent to the server to return the next page.
     - parameter completionHandler: Returns dictionary. Returning in main thread is not guaranteed.
     - parameter errorHandler:      Returns error message.
     */
    func fetchTop(after afterTag: String?, completionHandler: @escaping ([String: AnyObject]) -> (), errorHandler: @escaping (_ message: String) -> ()) {
        
        var requestURLString = "https://www.reddit.com/top.json?limit=50"
        
        if let afterTag = afterTag {
            
            requestURLString.append("&after=\(afterTag)")
        }
        
        guard let requestURL = URL(string: requestURLString) else {
            
            errorHandler("An error occurred formatting the fetch URL: \(requestURLString)")
            return
        }
        
        let request = URLRequest(url: requestURL)
        
        self.fetch(request: request, completionHandler: completionHandler, errorHandler: errorHandler)
    }
    
    private func fetch(request: URLRequest, completionHandler:@escaping ([String: AnyObject]) -> (), errorHandler: @escaping (_ message: String) -> ()) {
        
        let dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            
            guard let _ = response else {
                
                errorHandler("Please check your internet connection. Server may be down.")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                
                errorHandler("Invalid server response type.")
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            guard statusCode == 200 else {
                
                errorHandler("Invalid response code: \(statusCode)")
                return
            }
            
            guard let data = data else {
                
                errorHandler("Invalid response Data (empty).")
                return
            }
            
            do {
                
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: AnyObject] else {
                    
                    errorHandler("An error occurrred parsing the response.")
                    return
                }
                
                completionHandler(dictionary)
                
            } catch {
                
                errorHandler("An error occurrred parsing the response.")
            }
            
        }
        
        dataTask.resume()
    }
}
