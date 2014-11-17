import Foundation

class Board {
    var board: [Tile?]
    init() {
        self.board = [Tile?](count: 100, repeatedValue: nil)
    }
    subscript(row: Int, column: Int) -> Tile? {
        get {
            // TODO: Automate this calculation somewhere
            return board[row*10+column]
        }
        set {
            assert(indexValid(row, column: column))
            // Remove references to old tile
            if let oldTile = board[row*10+column] {
                var spots = oldTile.indexesOccupied(topRightRow: row, topRightColumn: column)
                for spot in spots {
                    board[spot.row*10+spot.column] = nil
                }
            }
            // Set new ones
            if let newTile = newValue {
                var spots = newTile.indexesOccupied(topRightRow: row, topRightColumn: column)
                for spot in spots {
                    board[spot.row*10+spot.column] = newTile
                }
            }
        }
    }
    func indexValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < 10 && column >= 0 && column < 10
    }
    func canOccupy(topRightRow row: Int, topRightColumn column: Int, tile: Tile) -> Bool {
        var spots = tile.indexesOccupied(topRightRow: row, topRightColumn: column)
        for spot in spots {
            if !indexValid(spot.row, column: spot.column) {
                return false
            }
            if self[spot.row, spot.column] != nil {
                return false
            }
        }
        
        return true
    }
}

