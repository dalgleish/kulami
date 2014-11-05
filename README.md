# kulami #
*A profound game by Andreas Kuhnekath*

A two player abstract game.

17 wooden tiles that combine to form the playing board, with maximum dimensions of 10x10.

   - 4 2x1
   - 4 2x3
   - 5 2x2
   - 4 3x1

Each player begins with either
 - 28 black marbles 
 - 28 red marbles

## Score ##
Number of spaces on all tiles controlled by player, such that majority of marbles on it belong to that player (ties are possible)

## Tile ##
 - dimensions (rows: Int, columns: Int)
 - getScore() -> Int {}
 - placeMarble(colour, row, column)

## Board ##
- rows: 10
- columns: 10
- canPlaceTile (row, column, tile) -> Bool
- placeTile (row, column, tile)
- isBoardValid -> Bool
- startGame () -> Bool
- placeMarble (colour, row, column)
- isGameComplete() -> Bool

## Game ##
- players
- tiles
- generateRandomBoard
- generateRandomSquareBoard
- startGame
- playersTurn
- takeTurn
