import Foundation
import XCTest

public class RobotInstructionsTests: XCTestCase {
    
    // Mark: Orientation Change
    
    func test_left_orientationChange_fromNorth() {
        let instruction = RobotInstruction.left
        let newOrientation = instruction.orientation(from: .north)
        XCTAssertEqual(newOrientation, .west)
    }
    
    func test_left_orientationChange_fromWest() {
        let instruction = RobotInstruction.left
        let newOrientation = instruction.orientation(from: .west)
        XCTAssertEqual(newOrientation, .south)
    }
    
    func test_left_orientationChange_fromSouth() {
        let instruction = RobotInstruction.left
        let newOrientation = instruction.orientation(from: .south)
        XCTAssertEqual(newOrientation, .east)
    }
    
    func test_left_orientationChange_fromEast() {
        let instruction = RobotInstruction.left
        let newOrientation = instruction.orientation(from: .east)
        XCTAssertEqual(newOrientation, .north)
    }
    
    func test_right_orientationChange_fromNorth() {
        let instruction = RobotInstruction.right
        let newOrientation = instruction.orientation(from: .north)
        XCTAssertEqual(newOrientation, .east)
    }
    
    func test_right_orientationChange_fromEast() {
        let instruction = RobotInstruction.right
        let newOrientation = instruction.orientation(from: .east)
        XCTAssertEqual(newOrientation, .south)
    }
    
    func test_right_orientationChange_fromSouth() {
        let instruction = RobotInstruction.right
        let newOrientation = instruction.orientation(from: .south)
        XCTAssertEqual(newOrientation, .west)
    }
    
    func test_right_orientationChange_fromWest() {
        let instruction = RobotInstruction.right
        let newOrientation = instruction.orientation(from: .west)
        XCTAssertEqual(newOrientation, .north)
    }
    
    func test_forward_orientationChange_fromNorth() {
        let instruction = RobotInstruction.forward
        let newOrientation = instruction.orientation(from: .north)
        XCTAssertEqual(newOrientation, .north)
    }
    
    func test_forward_orientationChange_fromEast() {
        let instruction = RobotInstruction.forward
        let newOrientation = instruction.orientation(from: .east)
        XCTAssertEqual(newOrientation, .east)
    }
    
    func test_forward_orientationChange_fromSouth() {
        let instruction = RobotInstruction.forward
        let newOrientation = instruction.orientation(from: .south)
        XCTAssertEqual(newOrientation, .south)
    }
    
    func test_forward_orientationChange_fromWest() {
        let instruction = RobotInstruction.forward
        let newOrientation = instruction.orientation(from: .west)
        XCTAssertEqual(newOrientation, .west)
    }
    
    
    // Mark: Movement
    
    func test_left_movement_fromNorth() {
        let instruction = RobotInstruction.left
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_left_movement_fromWest() {
        let instruction = RobotInstruction.left
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .west)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_left_movement_fromSouth() {
        let instruction = RobotInstruction.left
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_left_movement_fromEast() {
        let instruction = RobotInstruction.left
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_right_movement_fromNorth() {
        let instruction = RobotInstruction.right
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_right_movement_fromEast() {
        let instruction = RobotInstruction.right
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_right_movement_fromSouth() {
        let instruction = RobotInstruction.right
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_right_movement_fromWest() {
        let instruction = RobotInstruction.right
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 0))
    }
    
    func test_forward_movement_fromNorth() {
        let instruction = RobotInstruction.forward
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .north)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: 1))
    }
    
    func test_forward_movement_fromEast() {
        let instruction = RobotInstruction.forward
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .east)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 1, y: 0))
    }
    
    func test_forward_movement_fromSouth() {
        let instruction = RobotInstruction.forward
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .south)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: 0, y: -1))
    }
    
    func test_forward_movement_fromWest() {
        let instruction = RobotInstruction.forward
        let newCoordinates = instruction.move(from: Coordinates2D(x: 0, y: 0), orientation: .west)
        XCTAssertEqual(newCoordinates, Coordinates2D(x: -1, y: 0))
    }
    
}
