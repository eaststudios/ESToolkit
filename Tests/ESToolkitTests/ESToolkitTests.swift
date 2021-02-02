import XCTest
@testable import ESToolkit

final class ESToolkitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ESToolkit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
