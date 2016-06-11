import XCTest
@testable import freeza

class AgeFormatterTests: XCTestCase {

    func testAgeFormatter() {
        
        let presentTime = NSDate()
        XCTAssertEqual(presentTime.age(sinceDate: presentTime), "Now")
        
        let futureTime = NSDate(timeInterval: 10, sinceDate: presentTime)
        XCTAssertEqual(futureTime.age(sinceDate: presentTime), "The future")

        let aSecondAgoTime = NSDate(timeInterval: -1, sinceDate: presentTime)
        XCTAssertEqual(aSecondAgoTime.age(sinceDate: presentTime), "A second ago")

        let twoSecondsAgoTime = NSDate(timeInterval: -2, sinceDate: presentTime)
        XCTAssertEqual(twoSecondsAgoTime.age(sinceDate: presentTime), "2 seconds ago")

        let fiftyNineSecondsAgoTime = NSDate(timeInterval: -59, sinceDate: presentTime)
        XCTAssertEqual(fiftyNineSecondsAgoTime.age(sinceDate: presentTime), "59 seconds ago")

        let aMinuteAgoTime = NSDate(timeInterval: -60, sinceDate: presentTime)
        XCTAssertEqual(aMinuteAgoTime.age(sinceDate: presentTime), "A minute ago")

        let aMinuteAndHalfAgoTime = NSDate(timeInterval: -90, sinceDate: presentTime)
        XCTAssertEqual(aMinuteAndHalfAgoTime.age(sinceDate: presentTime), "A minute ago")

        let twoMinutesAgoTime = NSDate(timeInterval: -60 * 2, sinceDate: presentTime)
        XCTAssertEqual(twoMinutesAgoTime.age(sinceDate: presentTime), "2 minutes ago")

        let fiftyNineMinutesAgoTime = NSDate(timeInterval: -60 * 59, sinceDate: presentTime)
        XCTAssertEqual(fiftyNineMinutesAgoTime.age(sinceDate: presentTime), "59 minutes ago")
        
        let anHourAgo = NSDate(timeInterval: -60 * 60, sinceDate: presentTime)
        XCTAssertEqual(anHourAgo.age(sinceDate: presentTime), "An hour ago")
        
        let anHourAndHalfAgo = NSDate(timeInterval: -90 * 60, sinceDate: presentTime)
        XCTAssertEqual(anHourAndHalfAgo.age(sinceDate: presentTime), "An hour ago")

        let twoHoursAgo = NSDate(timeInterval: -2 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(twoHoursAgo.age(sinceDate: presentTime), "2 hours ago")
        
        let twentyThreeHoursAgo = NSDate(timeInterval: -23 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(twentyThreeHoursAgo.age(sinceDate: presentTime), "23 hours ago")
        
        let aDayAgo = NSDate(timeInterval: -24 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(aDayAgo.age(sinceDate: presentTime), "A day ago")

        let aDayAndHalfAgo = NSDate(timeInterval: -36 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(aDayAndHalfAgo.age(sinceDate: presentTime), "A day ago")

        let fiveDaysAndHalfAgo = NSDate(timeInterval: -5 * 24 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(fiveDaysAndHalfAgo.age(sinceDate: presentTime), "5 days ago")

        let sixDaysAgo = NSDate(timeInterval: -6 * 24 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(sixDaysAgo.age(sinceDate: presentTime), "A long time ago")

        let tenDaysAgo = NSDate(timeInterval: -10 * 24 * 60 * 60, sinceDate: presentTime)
        XCTAssertEqual(tenDaysAgo.age(sinceDate: presentTime), "A long time ago")
    }
}
