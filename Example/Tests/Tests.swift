import XCTest
@testable import MoyaLaconicPlugin
import Moya

class Tests: XCTestCase {

    let successResponse = Response(statusCode: 200, data: "".data(using: .utf8)!)

    let plugin: LaconicPlugin = {
        let plugin = LaconicPlugin()
        return plugin
    }()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuccessResponse() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(plugin.responseDescription(result: result), "💭🔙✅ 200")
    }

    func testFailureResponse() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping("map-err"))
        XCTAssertEqual(plugin.responseDescription(result: result), "💭🔙❌ Failed to map Endpoint to a URLRequest.")
    }

}

