import Foundation
import XCTest

public class MarsTests: XCTestCase {
    
    // MARK: Coordinates
    
    func test_contains_pointInGrid_bottomLeft() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertTrue(mars.contains(Coordinates2D(x: 0, y: 0)))
    }
    
    func test_contains_pointInGrid_topRight() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertTrue(mars.contains(Coordinates2D(x: 100, y: 100)))
    }
    
    func test_contains_pointInGrid_center() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertTrue(mars.contains(Coordinates2D(x: 50, y: 50)))
    }
    
    func test_contains_pointInGrid_offGridLeft() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertFalse(mars.contains(Coordinates2D(x: -1, y: 0)))
    }
    
    func test_contains_pointInGrid_offGridRight() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertFalse(mars.contains(Coordinates2D(x: 101, y: 0)))
    }
    
    func test_contains_pointInGrid_offGridTop() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertFalse(mars.contains(Coordinates2D(x: 0, y: 101)))
    }
    
    func test_contains_pointInGrid_offGridBottom() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertFalse(mars.contains(Coordinates2D(x: 0, y: -1)))
    }
    
    // MARK: Scents
    
    func test_hasScent_noScent_pointInPlane() {
        let mars = Mars(width: 100, height: 100)
        XCTAssertFalse(mars.hasScent(at: Coordinates2D(x: 0, y: 0)))
    }
    
    func test_hasScent_noScent_pointOutOfPlane() {
        let mars = Mars(width: 100, height: 100)
        XCTAssertFalse(mars.hasScent(at: Coordinates2D(x: -1, y: -1)))
    }
    
    func test_leaveScent_pointOutOfPlane() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: -1, y: -1))
        XCTAssertFalse(mars.hasScent(at: Coordinates2D(x: -1, y: -1)))
    }
    
    func test_leaveScent_pointInPlane() {
        let mars = Mars(width: 100, height: 100)
        mars.leaveScent(at: Coordinates2D(x: 0, y: 0))
        XCTAssertTrue(mars.hasScent(at: Coordinates2D(x: 0, y: 0)))
    }
    
}
