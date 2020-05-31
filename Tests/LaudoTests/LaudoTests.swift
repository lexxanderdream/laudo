import XCTest
@testable import Laudo

final class LaudoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Laudo().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
