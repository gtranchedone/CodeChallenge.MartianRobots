import Foundation

/// Mars is a strange planet represented by a grid.
/// This class allows you to check if a point is contained in the grid the planet is represented with.
/// It also allows to set and check data specific to a point on the plane. See the methods for details.
public class Mars {
    
    private var board: [[Bool]]
    
    public init(width: Int, height: Int) {
        board = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: width + 1), count: height + 1)
    }
    
    /// Allows to leave a 'scent' anywhere on the planet. What the scent represents is up to the user.
    /// It doesn't do anything if the passed-in point isn't contained in the planet.
    public func leaveScent(at position: Coordinates2D) {
        guard contains(position) else { return }
        board[position.y][position.x] = true
    }
    
    /// Returns `true` if a 'scent' was left at the passed-in point.
    /// If the point isn't contained on the planet, it returns `false`.
    public func hasScent(at position: Coordinates2D) -> Bool {
        guard contains(position) else { return false }
        return board[position.y][position.x]
    }
    
    /// Returns `true` if the planet contains the passed-in point.
    public func contains(_ coordinates: Coordinates2D) -> Bool {
        return coordinates.y >= 0 && coordinates.y < board.count && coordinates.x >= 0 && coordinates.x < board[coordinates.y].count
    }
    
}
