import Foundation

class Tile {
    /**
     * A single space on the tile
     * Can be occupied or not
    */
    struct Square {
        enum Position {
            case Empty, Red, Black
        }
        
        var space: Position {
            willSet (newSpaceValue) {
                println("Now occupied by \(newSpaceValue)")
            }
        }
        
        init() {
            space = Position.Empty
        }
    }
    
    var squares: [Square]
    var size: Int
    
    init(size: Int) {
        self.size = size
        // TODO: Of size?
        self.squares = [Square](count: size, repeatedValue: Square())
    }
    
    func indexesOccupied(topRightRow row: Int, topRightColumn column: Int)
        -> [(row: Int, column: Int)] {
        // For all, the top-right corner
        var indexes = [(row: row, column: column)]
            
        // For all, the 2x1 spot
        indexes.append(row: row + 1, column: column)
        // For 1x3 only
        if size == 3 || size == 6 {
            indexes.append(row: row + 2, column: column)
        }
        // For 2x2 or 2x3
        if size >= 4 {
            indexes.append(row: row, column: column + 1)
            indexes.append(row: row + 1, column: column + 1)
        }
        // For 2x3
        if size == 6 {
            indexes.append(row: row + 2, column: column + 1)
        }
        
        return indexes
    }
}

