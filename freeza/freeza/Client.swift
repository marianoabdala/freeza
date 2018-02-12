import Foundation

protocol Client {
    
    func fetchTop(after afterTag: String?, completionHandler: @escaping ([String: AnyObject]) -> (), errorHandler: @escaping (_ message: String) -> ())
}
