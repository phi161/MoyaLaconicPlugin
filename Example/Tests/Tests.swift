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

    func testRequestDescription() {
        let mockRequest = MockRequest()
        XCTAssertEqual(plugin.requestDescription(request: mockRequest), "💭🔜")
    }
    
    func testSuccessResponseDescription() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(plugin.responseDescription(result: result), "💭🔙✅ 200")
    }

    func testFailureResponseDescription() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping("map-err"))
        XCTAssertEqual(plugin.responseDescription(result: result), "💭🔙❌ Failed to map Endpoint to a URLRequest.")
    }

}


struct MockRequest: RequestType {

    var request: URLRequest? {
        return nil
    }

    var sessionHeaders: [String : String] {
        return [:]
    }

    func authenticate(username: String, password: String, persistence: URLCredential.Persistence) -> MockRequest {
        return self
    }

    func authenticate(with credential: URLCredential) -> MockRequest {
        return self
    }

    func cURLDescription(calling handler: @escaping (String) -> Void) -> MockRequest {
        return self
    }

}
