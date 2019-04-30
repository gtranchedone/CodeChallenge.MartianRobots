import Foundation

public class ProgramRunner {
    
    public enum InputError: Error {
        case notEnoughParameters
        case invalidGridSize
        case invalidRobotPosition
        case invalidRobotInstruction
    }
    
    let input: String
    
    public init(input: String) {
        self.input = input
    }
    
    public func run() throws -> String {
        // break down input into non-empty strings - one for each line.
        let inputs = input.components(separatedBy: "\n").filter({ !$0.isEmpty })
        guard inputs.count >= 3 else {
            throw InputError.notEnoughParameters
        }
        
        let mars = try makePlanet(from: inputs[0])
        
        var output = ""
        var robotInstructionIndex = 1
        
        while robotInstructionIndex < inputs.count - 1 {
            let initialPositionInstruction = inputs[robotInstructionIndex]
            let movementInstructions = inputs[robotInstructionIndex + 1]
            var robot = try makeRobot(from: initialPositionInstruction)
            guard mars.contains(robot.position) else {
                throw InputError.invalidRobotPosition
            }
            let result = try perform(instructions: movementInstructions, on: mars, robot: &robot)
            output.append("\(result)\n")
            
            robotInstructionIndex += 2
        }
        
        return output.trimmingCharacters(in: ["\n"])
    }
    
    private func makePlanet(from input: String) throws -> Mars {
        let gridSizeComponents = input.components(separatedBy: " ")
        guard
            gridSizeComponents.count == 2,
            let gridWidth = Int(gridSizeComponents[0]),
            let gridHeigth = Int(gridSizeComponents[1])
            else {
                throw InputError.invalidGridSize
        }
        return Mars(width: gridWidth, height: gridHeigth)
    }
    
    private func makeRobot(from input: String) throws -> Robot {
        let initialPositionComponents = input.components(separatedBy: " ")
        guard
            initialPositionComponents.count == 3,
            let x = Int(initialPositionComponents[0]),
            let y = Int(initialPositionComponents[1]),
            let orientation = Orientation(rawValue: initialPositionComponents[2])
            else {
                throw InputError.invalidRobotPosition
        }
        return Robot(position: Coordinates2D(x: x, y: y), orientation: orientation)
    }
    
    private func perform(instructions: String, on planet: Mars, robot: inout Robot) throws -> String {
        var gotLost = false
        var finalGridPosition = robot.position
        
        for instructionValue in instructions {
            guard let instruction = RobotInstruction(rawValue: instructionValue) else {
                throw InputError.invalidRobotInstruction
            }
            
            gotLost = gotLost || !robot.perform(instruction, on: planet)
            if gotLost {
                break
            }
            
            finalGridPosition = robot.position
        }
        
        var output = "\(finalGridPosition.x) \(finalGridPosition.y) \(robot.orientation.rawValue)"
        if gotLost {
            output.append(" LOST")
        }
        return output
    }
    
}
