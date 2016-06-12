import XCTest
@testable import freeza

class RedditEntryModelTest: XCTestCase {

    func testInit() {

        let title = "TEST_TITLE"
        let author = "TEST_AUTHOR"
        let creation = NSDate()
        let thumbnailURL = NSURL(string: "http://mysite.com/thumb.jpg")!
        let commentsCount = 200
        
        let dictionary: [String: AnyObject] = [
            "title": title,
            "author": author,
            "created_utc": creation.timeIntervalSince1970,
            "thumbnail": thumbnailURL.absoluteString,
            "num_comments": commentsCount
        ]
        
        let entryModel = EntryModel(withDictionary: dictionary)
        
        XCTAssertEqual(entryModel.title, title)
        XCTAssertEqual(entryModel.author, author)
        XCTAssertEqual(entryModel.creation?.timeIntervalSince1970, creation.timeIntervalSince1970)
        XCTAssertEqual(entryModel.thumbnailURL, thumbnailURL)
        XCTAssertEqual(entryModel.commentsCount, commentsCount)
    }
    
    func testInitWithNils() {
        
        let dictionary = [String: AnyObject]()
        let entryModel = EntryModel(withDictionary: dictionary)
        
        XCTAssertNil(entryModel.title)
        XCTAssertNil(entryModel.author)
        XCTAssertNil(entryModel.creation)
        XCTAssertNil(entryModel.thumbnailURL)
        XCTAssertNil(entryModel.commentsCount)
    }
}
