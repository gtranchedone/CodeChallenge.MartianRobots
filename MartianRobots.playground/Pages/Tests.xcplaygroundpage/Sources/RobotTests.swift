import Foundation
import XCTest

public class RobotTests: XCTestCase {
    
    /// MARK: Orientation and Movement
    
    func test_performInstruction_changeOrientation() {
        let planet = Mars(width: 100, height: 100)
        var robot = Robot(position: Coordinates2D(x: 0, y: 0), orientation: .north)
        let instruction = RobotInstruction.left
        robot.perform(instruction, on: planet)
        XCTAssertEqual(robot.position, Coordinates2D(x: 0, y: 0))
        XCTAssertEqual(robot.orientation, .west)
    }
    
    func test_performInstruction_forward() {
        let planet = Mars(width: 100, height: 100)
        var robot = Robot(position: Coordinates2D(x: 0, y: 0), orientation: .north)
        let instruction = RobotInstruction.forward
        robot.perform(instruction, on: planet)
        XCTAssertEqual(robot.position, Coordinates2D(x: 0, y: 1))
        XCTAssertEqual(robot.orientation, .north)
    }
    
    func test_performInstruction_leaveScentAndGetLost() {
        let planet = Mars(width: 100, height: 100)
        var robot = Robot(position: Coordinates2D(x: 0, y: 0), orientation: .west)
        let instruction = RobotInstruction.forward
        XCTAssertFalse(planet.hasScent(at: Coordinates2D(x: 0, y: 0)))
        robot.perform(instruction, on: planet)
        XCTAssertEqual(robot.position, Coordinates2D(x: -1, y: 0))
        XCTAssertEqual(robot.orientation, .west)
        XCTAssertTrue(planet.hasScent(at: Coordinates2D(x: 0, y: 0)))
    }
    
    func test_performInstruction_ignoreInstructionIfCurrentPositionHasScentAndMovingOutOfBounds() {
        let planet = Mars(width: 100, height: 100)
        planet.leaveScent(at: Coordinates2D(x: 0, y: 0))
        var robot = Robot(position: Coordinates2D(x: 0, y: 0), orientation: .west)
        let instruction = RobotInstruction.forward
        XCTAssertTrue(planet.hasScent(at: Coordinates2D(x: 0, y: 0)))
        robot.perform(instruction, on: planet)
        XCTAssertEqual(robot.position, Coordinates2D(x: 0, y: 0))
        XCTAssertEqual(robot.orientation, .west)
    }
    
}
