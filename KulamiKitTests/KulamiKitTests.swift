import UIKit
import XCTest

class BoardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOccupyBoard() {
        var board = Board()
        var twoByOne = Tile(size: 2)
        let canOccupy = board.canOccupy(topRightRow: 0, topRightColumn: 0, tile: twoByOne)
        XCTAssert(canOccupy, "Tile can occupy board")
    }
    
    func testOverlapOnLeft() {
        let board = Board()
        let twoByTwo = Tile(size: 4)
        let twoByThree = Tile(size: 6)
        board[4, 4] = twoByTwo
        let canOccupy = board.canOccupy(topRightRow: 3, topRightColumn: 3, tile: twoByThree)
        
        XCTAssert(canOccupy ==  false, "Tile cannot overlap on left")
    }
    
    func testOverlapOnRight() {
        let board = Board()
        let twoByTwo = Tile(size: 4)
        let twoByThree = Tile(size: 6)
        board[4, 4] = twoByTwo
        let canOccupy = board.canOccupy(topRightRow: 3, topRightColumn: 3, tile: twoByThree)
        
        XCTAssert(canOccupy == false, "Tile cannot overlap on right")
    }
}
