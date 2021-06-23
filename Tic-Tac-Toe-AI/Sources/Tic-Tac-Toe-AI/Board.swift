//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

protocol BoardProtocol {
    var squares: [PlayerSymbol?] {get set}
    func select(square: Int, player: PlayerSymbol) -> Bool
    func getFreeSquares() -> [Int]
    func getSymbolsForPositions(_ positions: [Int]) -> [PlayerSymbol?]
}

class Board: BoardProtocol {
    
    var squares = [PlayerSymbol?]()
    
    init(_ board: [PlayerSymbol?]) {
        squares = board
    }
    
    func select(square: Int, player: PlayerSymbol) -> Bool {
        squares[square] = player
        return true
    }
    
    func getFreeSquares() -> [Int] {
        var freeSquares = [Int]()
        for i in 0..<squares.count{
            if squares[i] == .none {
                freeSquares.append(i)
            }
        }
        return freeSquares
    }
    
    func getSymbolsForPositions(_ indexes: [Int]) -> [PlayerSymbol?] {
        var boardSquares = [PlayerSymbol?]()
        for index in indexes {
            boardSquares.append(squares[index])
        }
        return boardSquares
    }
}
