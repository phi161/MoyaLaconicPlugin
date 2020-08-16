import XCTest
@testable import MoyaLaconicPlugin
import Moya

class Tests: XCTestCase {

    let successResponse = Response(statusCode: 200, data: "".data(using: .utf8)!)

    let defaultPlugin = LaconicPlugin()
    let customPlugin = LaconicPlugin(pluginIdentifier: "*️⃣", requestIdentifier: "➡️", responseIdentifier: "⬅️", successIdentifier: "🆗", failureIdentifier: "🆖")

    func testLaconicTargetRequestDescriptionWithDefaultPlugin() {
        let mockRequest = MockRequest()
        XCTAssertEqual(defaultPlugin.requestDescription(request: mockRequest, laconic: MockTarget()), "💭🅰️🔜🅱️")
    }

    func testLaconicTargetSuccessResponseDescriptionWithDefaultPlugin() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(defaultPlugin.responseDescription(result: result, laconic: MockTarget()), "💭🅰️🔙✅🅱️ (HTTP 200)")
    }

    func testLaconicTargetFailureResponseDescriptionWithDefaultPlugin() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping(""))
        XCTAssertEqual(defaultPlugin.responseDescription(result: result, laconic: MockTarget()), "💭🅰️🔙❌🅱️ Failed to map Endpoint to a URLRequest.")
    }

    func testNonLaconicTargetRequestDescriptionWithDefaultPlugin() {
        let mockRequest = MockRequest()
        XCTAssertEqual(defaultPlugin.requestDescription(request: mockRequest, laconic: nil), "💭🔜")
    }

    func testNonLaconicTargetSuccessResponseDescriptionWithDefaultPlugin() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(defaultPlugin.responseDescription(result: result, laconic: nil), "💭🔙✅ (HTTP 200)")
    }

    func testNonLaconicTargetFailureResponseDescriptionWithDefaultPlugin() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping(""))
        XCTAssertEqual(defaultPlugin.responseDescription(result: result, laconic: nil), "💭🔙❌ Failed to map Endpoint to a URLRequest.")
    }

    func testLaconicTargetRequestDescriptionWithCustomPlugin() {
        let mockRequest = MockRequest()
        XCTAssertEqual(customPlugin.requestDescription(request: mockRequest, laconic: MockTarget()), "*️⃣🅰️➡️🅱️")
    }

    func testLaconicTargetSuccessResponseDescriptionWithCustomPlugin() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(customPlugin.responseDescription(result: result, laconic: MockTarget()), "*️⃣🅰️⬅️🆗🅱️ (HTTP 200)")
    }

    func testLaconicTargetFailureResponseDescriptionWithCustomPlugin() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping(""))
        XCTAssertEqual(customPlugin.responseDescription(result: result, laconic: MockTarget()), "*️⃣🅰️⬅️🆖🅱️ Failed to map Endpoint to a URLRequest.")
    }

    func testNonLaconicTargetRequestDescriptionWithCustomPlugin() {
        let mockRequest = MockRequest()
        XCTAssertEqual(customPlugin.requestDescription(request: mockRequest, laconic: nil), "*️⃣➡️")
    }

    func testNonLaconicTargetSuccessResponseDescriptionWithCustomPlugin() {
        let result: Result<Response, MoyaError> = .success(successResponse)
        XCTAssertEqual(customPlugin.responseDescription(result: result, laconic: nil), "*️⃣⬅️🆗 (HTTP 200)")
    }

    func testNonLaconicTargetFailureResponseDescriptionWithCustomPlugin() {
        let result: Result<Response, MoyaError> = .failure(.requestMapping(""))
        XCTAssertEqual(customPlugin.responseDescription(result: result, laconic: nil), "*️⃣⬅️🆖 Failed to map Endpoint to a URLRequest.")
    }
}


struct MockTarget: Laconic {
    var primaryIdentifier = "🅰️"
    var secondaryIdentifier = "🅱️"
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
