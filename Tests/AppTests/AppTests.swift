@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testGetItems() throws {
        
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)
        
        try app.test(.GET, "/items", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.headers.contentType, .json)
        })
    }
}
