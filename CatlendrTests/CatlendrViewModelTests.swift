import XCTest
import Combine
@testable import Catlendr

class CatlendrViewModelTests: XCTestCase {
    var viewModel: CatlendrViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CatlendrViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchAnimalImagesSuccess() async {
        let expectation = XCTestExpectation(description: "Fetch animals completes")
        await viewModel.fetchAnimalImages(for: .cat)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
        }
        await fulfillment(of: [expectation])
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.calendarDays.count, Date().datesForCurrentWeek().count)
    }
}
