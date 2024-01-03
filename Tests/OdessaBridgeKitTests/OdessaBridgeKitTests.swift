import XCTest
@testable import OdessaBridgeKit

@available(iOS 16.0, *)
final class OdessaBridgeKitTests: XCTestCase {
    func testExample() throws {
        let seanse = OdessaBridgeSeanse()
        seanse.isLogOn = true
        // seanse.startSingleGame(pannel: UserPannelExample(), botsCount: 3)
    }
}
