import XCTest
@testable import freeza

class RedditEntryModelTest: XCTestCase {

    func testInit() {

        let title = "TEST_TITLE"
        let author = "TEST_AUTHOR"
        let creation = NSDate()
        let thumbnail = NSURL(string: "http://mysite.com/thumb.jpg")!
        let commentsCount = 200
        
        let dictionary: [String: AnyObject] = [
            "title": title,
            "author": author,
            "creation": creation.timeIntervalSince1970,
            "thumbnail": thumbnail.absoluteString,
            "num_comments": commentsCount
        ]
        
        let entryModel = RedditEntryModel(withDictionary: dictionary)
        
        XCTAssertEqual(entryModel.title, title)
        XCTAssertEqual(entryModel.author, author)
        XCTAssertEqual(entryModel.creation?.timeIntervalSince1970, creation.timeIntervalSince1970)
        XCTAssertEqual(entryModel.thumbnail, thumbnail)
        XCTAssertEqual(entryModel.commentsCount, commentsCount)
    }
    
    func testInitWithNils() {
        
        let dictionary = [String: AnyObject]()
        let entryModel = RedditEntryModel(withDictionary: dictionary)
        
        XCTAssertNil(entryModel.title)
        XCTAssertNil(entryModel.author)
        XCTAssertNil(entryModel.creation)
        XCTAssertNil(entryModel.thumbnail)
        XCTAssertNil(entryModel.commentsCount)
    }
}
