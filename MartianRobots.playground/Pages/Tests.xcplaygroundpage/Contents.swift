//: [Previous](@previous)

/// NOTE: open the playground's sources pane using the button in the top right corner of Xcode.

/// See the `Sources` folder in this playground page - `Tests` - for
/// the tests implementations.

import Foundation
import XCTest

/// Add a test observer to raise a visible error in the playground if any test fails.
/// If a test observer wasn't added, failures would only appear in the console logs.

class TestObserver: NSObject, XCTestObservation {

    public func testCase(_ testCase: XCTestCase,
                         didFailWithDescription description: String,
                         inFile filePath: String?,
                         atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }

}

let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)

/// Run all tests for each test class
MarsTests.defaultTestSuite.run()
RobotTests.defaultTestSuite.run()
RobotInstructionsTests.defaultTestSuite.run()
ProgramRunnerTests.defaultTestSuite.run()

//: [Next](@next)
