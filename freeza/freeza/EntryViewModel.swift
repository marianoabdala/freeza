import Foundation
import UIKit

class EntryViewModel {
    
    var hasError = false
    var errorMessage: String? = nil

    let title: String
    let author: String
    
    var age: String {
        
        get {
            
            guard let creation = self.creation else {
                
                return "---"
            }
            
            return creation.age()
        }
    }
    
    var thumbnail: UIImage
    let commentsCount: String
    let imageURL: NSURL?
    
    private let creation: NSDate?
    private let thumbnailURL: NSURL?
    private var thumbnailFetched = false

    init(withModel model: EntryModel) {
        
        func markAsMissingRequiredField() {
            
            self.hasError = true
            self.errorMessage = "Missing required field"
        }

        self.title = model.title ?? "Untitled"
        self.author = model.author ?? "Anonymous"
        self.thumbnailURL = model.thumbnailURL
        self.thumbnail = UIImage(named: "thumbnail-placeholder")!
        self.commentsCount = " \(model.commentsCount ?? 0) " // Leave space for the rounded corner. I know, not cool, but does the trick.
        self.creation = model.creation
        self.imageURL = model.imageURL

        if model.title == nil ||
            model.author == nil ||
            model.creation == nil ||
            model.commentsCount == nil {
            
            markAsMissingRequiredField()
        }
    }
    
    func loadThumbnail(withCompletion completion: () -> ()) {

        guard let url = self.thumbnailURL where self.thumbnailFetched == false else {
            
            return
        }
        
        let downloadThumbnailTask = NSURLSession.sharedSession().downloadTaskWithURL(url) { [weak self] (url, urlResponse, error) in

            guard let strongSelf = self,
                url = url,
                data = NSData(contentsOfURL: url),
                image = UIImage(data: data) else {
                
                return
            }

            strongSelf.thumbnail = image
            strongSelf.thumbnailFetched = true
            
            dispatch_async(dispatch_get_main_queue()) {
                
                completion()
            }
        }
            
        downloadThumbnailTask.resume()
    }
}
