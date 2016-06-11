import Foundation

protocol Client {
    
    func fetchTop(withCompletion completionHandler:([String: AnyObject]) -> (), errorHandler:(message: String) -> ())
}
