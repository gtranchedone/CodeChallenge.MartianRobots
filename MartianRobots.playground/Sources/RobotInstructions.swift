import Foundation

public enum RobotInstruction: Character {
    case left = "L"
    case right = "R"
    case forward = "F"
}

extension RobotInstruction {
    
    public func orientation(from originalOrientation: Orientation) -> Orientation {
        switch self {
        case .forward:
            return originalOrientation
            
        case .left:
            switch originalOrientation {
            case .north:
                return .west
                
            case .west:
                return .south
                
            case .south:
                return .east
                
            case .east:
                return .north
            }
            
        case .right:
            switch originalOrientation {
            case .north:
                return .east
                
            case .east:
                return .south
                
            case .south:
                return .west
                
            case .west:
                return .north
            }
        }
    }
    
    public func move(from startingCoordinates: Coordinates2D, orientation: Orientation) -> Coordinates2D {
        switch self {
        case .forward:
            switch orientation {
            case .north:
                return Coordinates2D(x: startingCoordinates.x, y: startingCoordinates.y + 1)
                
            case .south:
                return Coordinates2D(x: startingCoordinates.x, y: startingCoordinates.y - 1)
                
            case .east:
                return Coordinates2D(x: startingCoordinates.x + 1, y: startingCoordinates.y)
                
            case .west:
                return Coordinates2D(x: startingCoordinates.x - 1, y: startingCoordinates.y)
            }
            
        default:
            return startingCoordinates
        }
    }
    
}
