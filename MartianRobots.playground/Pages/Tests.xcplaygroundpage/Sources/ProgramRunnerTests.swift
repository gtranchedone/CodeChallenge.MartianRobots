import Foundation
import XCTest

public class ProgramRunnerTests: XCTestCase {
    
    func test_invalidInput_tooFewParameters() throws {
        let input =
            """
            0 0
            CLF
            """
        
        let expectedError = ProgramRunner.InputError.notEnoughParameters
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    // MARK: Invalid Grid Size
    
    func test_invalidGridInstructions_tooManyParameters() throws {
        let input =
            """
            5 3 1
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidGridSize
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidGridInstructions_tooFewParameters() throws {
        let input =
            """
            5
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidGridSize
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidGridInstructions_emptyGrid() throws {
        let input =
            """
            0 0
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidGridSize
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidGridInstructions_NAN() throws {
        let input =
            """
            A 0
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidGridSize
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    /// MARK: Invalid Robot Position
    
    func test_invalidRobotPosition_tooManyParameters() throws {
        let input =
            """
            5 3
            1 1 E A
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidRobotPosition
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidRobotPosition_tooFewParameters() throws {
        let input =
            """
            5 3
            1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidRobotPosition
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidRobotPosition_outOfPlanetStartingPosition() throws {
        let input =
            """
            0 0
            -1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidRobotPosition
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    func test_invalidRobotPosition_NAN() throws {
        let input =
            """
            0 0
            A 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedError = ProgramRunner.InputError.invalidRobotPosition
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    /// MARK: Invalid Robot Instructions
    
    func test_invalidRobotInstructions_invalidCharacters() throws {
        let input =
            """
            0 0
            1 1 E
            1CLF
            """
        
        let expectedError = ProgramRunner.InputError.invalidRobotInstruction
        let runner = ProgramRunner(input: input)
        XCTAssertThrowsError(try runner.run()) {
            XCTAssertEqual($0.localizedDescription, expectedError.localizedDescription)
        }
    }
    
    /// MARK: Valid Inputs
    
    func test_validInstructions() throws {
        let input =
            """
            5 3
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            LLFFFLFLFL
            """
        
        let expectedOutput =
            """
            1 1 E
            3 3 N LOST
            2 3 S
            """
        
        let runner = ProgramRunner(input: input)
        let output = try runner.run()
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_validInstructions_missingLastRobotInstructions() throws {
        let input =
            """
            5 3
            1 1 E
            RFRFRFRF
            3 2 N
            FRRFLLFFRRFLL
            0 3 W
            """
        
        let expectedOutput =
            """
            1 1 E
            3 3 N LOST
            """
        
        let runner = ProgramRunner(input: input)
        let output = try runner.run()
        XCTAssertEqual(output, expectedOutput)
    }
    
}
