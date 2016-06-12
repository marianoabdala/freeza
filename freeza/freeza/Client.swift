import Foundation

protocol Client {
    
    func fetchTop(after afterTag: String?, completionHandler:([String: AnyObject]) -> (), errorHandler:(message: String) -> ())
}
