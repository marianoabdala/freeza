import Foundation

struct EntryModel {

    let title: String?
    let author: String?
    let creation: Date?
    let thumbnailURL: URL?
    let commentsCount: Int?
    let url: URL?
    
    init(withDictionary dictionary: [String: AnyObject]) {
        
        func dateFromDictionary(withAttributeName attribute: String) -> Date? {
            
            guard let rawDate = dictionary[attribute] as? Double else {
                
                return nil
            }
            
            return Date(timeIntervalSince1970: rawDate)
        }
        
        func urlFromDictionary(withAttributeName attribute: String) -> URL? {
            
            guard let rawURL = dictionary[attribute] as? String else {
                
                return nil
            }
            
            return URL(string: rawURL)
        }
        
        self.title = dictionary["title"] as? String
        self.author = dictionary["author"] as? String
        self.creation = dateFromDictionary(withAttributeName: "created_utc")
        self.thumbnailURL = urlFromDictionary(withAttributeName: "thumbnail")
        self.commentsCount = dictionary["num_comments"] as? Int
        self.url = urlFromDictionary(withAttributeName: "url")
    }
}
