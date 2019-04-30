import Foundation

public struct Robot {
    public var position: Coordinates2D
    public var orientation: Orientation
    
    public init(position: Coordinates2D, orientation: Orientation) {
        self.position = position
        self.orientation = orientation
    }
    
    /// Return `false` if lost
    public mutating func perform(_ instruction: RobotInstruction, on planet: Mars) -> Bool {
        orientation = instruction.orientation(from: orientation)
        let targetPosition = instruction.move(from: position, orientation: orientation)
        if planet.contains(targetPosition) {
            position = targetPosition
        }
        else if !planet.hasScent(at: position) {
            planet.leaveScent(at: position)
            position = targetPosition
        }
        return planet.contains(position)
    }
}
