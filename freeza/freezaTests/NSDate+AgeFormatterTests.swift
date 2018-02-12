import XCTest
@testable import freeza

class AgeFormatterTests: XCTestCase {

    func testAgeFormatter() {
        
        let presentTime = Date()
        XCTAssertEqual(presentTime.age(sinceDate: presentTime), "Now")
        
        let futureTime = Date(timeInterval: 10, since: presentTime)
        XCTAssertEqual(futureTime.age(sinceDate: presentTime), "The future")

        let aSecondAgoTime = Date(timeInterval: -1, since: presentTime)
        XCTAssertEqual(aSecondAgoTime.age(sinceDate: presentTime), "A second ago")

        let twoSecondsAgoTime = Date(timeInterval: -2, since: presentTime)
        XCTAssertEqual(twoSecondsAgoTime.age(sinceDate: presentTime), "2 seconds ago")

        let fiftyNineSecondsAgoTime = Date(timeInterval: -59, since: presentTime)
        XCTAssertEqual(fiftyNineSecondsAgoTime.age(sinceDate: presentTime), "59 seconds ago")

        let aMinuteAgoTime = Date(timeInterval: -60, since: presentTime)
        XCTAssertEqual(aMinuteAgoTime.age(sinceDate: presentTime), "A minute ago")

        let aMinuteAndHalfAgoTime = Date(timeInterval: -90, since: presentTime)
        XCTAssertEqual(aMinuteAndHalfAgoTime.age(sinceDate: presentTime), "A minute ago")

        let twoMinutesAgoTime = Date(timeInterval: -60 * 2, since: presentTime)
        XCTAssertEqual(twoMinutesAgoTime.age(sinceDate: presentTime), "2 minutes ago")

        let fiftyNineMinutesAgoTime = Date(timeInterval: -60 * 59, since: presentTime)
        XCTAssertEqual(fiftyNineMinutesAgoTime.age(sinceDate: presentTime), "59 minutes ago")
        
        let anHourAgo = Date(timeInterval: -60 * 60, since: presentTime)
        XCTAssertEqual(anHourAgo.age(sinceDate: presentTime), "An hour ago")
        
        let anHourAndHalfAgo = Date(timeInterval: -90 * 60, since: presentTime)
        XCTAssertEqual(anHourAndHalfAgo.age(sinceDate: presentTime), "An hour ago")

        let twoHoursAgo = Date(timeInterval: -2 * 60 * 60, since: presentTime)
        XCTAssertEqual(twoHoursAgo.age(sinceDate: presentTime), "2 hours ago")
        
        let twentyThreeHoursAgo = Date(timeInterval: -23 * 60 * 60, since: presentTime)
        XCTAssertEqual(twentyThreeHoursAgo.age(sinceDate: presentTime), "23 hours ago")
        
        let aDayAgo = Date(timeInterval: -24 * 60 * 60, since: presentTime)
        XCTAssertEqual(aDayAgo.age(sinceDate: presentTime), "A day ago")

        let aDayAndHalfAgo = Date(timeInterval: -36 * 60 * 60, since: presentTime)
        XCTAssertEqual(aDayAndHalfAgo.age(sinceDate: presentTime), "A day ago")

        let fiveDaysAndHalfAgo = Date(timeInterval: -5 * 24 * 60 * 60, since: presentTime)
        XCTAssertEqual(fiveDaysAndHalfAgo.age(sinceDate: presentTime), "5 days ago")

        let sixDaysAgo = Date(timeInterval: -6 * 24 * 60 * 60, since: presentTime)
        XCTAssertEqual(sixDaysAgo.age(sinceDate: presentTime), "A long time ago")

        let tenDaysAgo = Date(timeInterval: -10 * 24 * 60 * 60, since: presentTime)
        XCTAssertEqual(tenDaysAgo.age(sinceDate: presentTime), "A long time ago")
    }
}
