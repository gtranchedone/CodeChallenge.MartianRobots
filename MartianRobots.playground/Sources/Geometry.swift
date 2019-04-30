import Foundation

/// A data structure that represents a point on a 2-dimentional plane
public struct Coordinates2D: Equatable {
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Coordinates2D: CustomStringConvertible {
    
    public var description: String {
        return "(\(x), \(y))"
    }
    
}
