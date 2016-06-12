import XCTest
@testable import freeza

class ReditClientTests: XCTestCase {

    func testFetchTop() {
        
        let client = RedditClient()
        
        let expectation = expectationWithDescription("Wait for fetch to return.")
        
        client.fetchTop(after: nil, completionHandler: { (dictionary) in
            
                guard let kind = dictionary["kind"] as? String else {
                    
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(kind, "Listing")
                
                guard let data = dictionary["data"] as? [String: AnyObject] else {
                 
                    XCTFail()
                    return
                }
                
                guard let children = data["children"] as? [AnyObject] else {
                    
                    XCTFail()
                    return
                }
                
                XCTAssertEqual(children.count, 50)
                
                expectation.fulfill()
            
            }, errorHandler: { (message) in
                
                XCTFail()
        })
        
        waitForExpectationsWithTimeout(60, handler: nil)
    }
}
