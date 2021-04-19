import XCTest
@testable import InfoKit

final class InfoKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(InfoKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
