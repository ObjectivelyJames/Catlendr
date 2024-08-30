import XCTest

final class CatlendrUITests: XCTestCase {

    override func setUpWithError() throws {  continueAfterFailure = false }

    override func tearDownWithError() throws { }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
