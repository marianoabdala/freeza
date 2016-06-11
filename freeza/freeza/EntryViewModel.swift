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
    
    let thumbnail: UIImage
    let commentsCount: String
    
    private let creation: NSDate?

    init(withModel model: EntryModel) {
        
        func markAsMissingRequiredField() {
            
            self.hasError = true
            self.errorMessage = "Missing required field"
        }

        self.title = model.title ?? "Untitled"
        self.author = model.author ?? "Anonymous"
        self.thumbnail = UIImage(named: "thumbnail-placeholder")!
        self.commentsCount = " \(model.commentsCount ?? 0) " // Leave space for the rounded corner. I know, not cool, but does the trick.
        self.creation = model.creation

        if model.title == nil ||
            model.author == nil ||
            model.creation == nil ||
            model.commentsCount == nil {
            
            markAsMissingRequiredField()
        }
    }
}
