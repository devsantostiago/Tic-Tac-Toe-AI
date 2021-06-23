//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

class GameEngine: SupportsAI {
    
    init() {}
    
    func getWinnerWith(board: BoardProtocol) -> PlayerSymbol? {
        return checkIfWinnerIsFound(board: board)
    }
    
    private func checkIfWinnerIsFound(board: BoardProtocol) -> PlayerSymbol? {
        if let winner = checkLines(board: board) {
            return winner
        }
        if let winner = checkColumns(board: board) {
            return winner
        }
        if let winner = checkDiagonals(board: board) {
            return winner
        }
        return nil
    }
    
    private func checkDraw(board: BoardProtocol) -> Bool {
        let freeSpaces = board.getFreeSquares().count
        if freeSpaces == 0 {
            return true
        }
        return false
    }

    private func checkDiagonals(board: BoardProtocol) -> PlayerSymbol? {
        if let winner = checkLeftDiagonal(board: board) {
            return winner
        }
        if let winner = checkRightDiagonal(board: board) {
            return winner
        }
        return nil
    }
    
    private func checkRightDiagonal(board: BoardProtocol) -> PlayerSymbol? {
        let elementsToCheck = board.getSymbolsForPositions([2,4,6])
        if let winner = checkWinnerInArray(elementsToCheck) {
            return winner
        }
        return nil
    }
    
    private func checkLeftDiagonal(board: BoardProtocol) -> PlayerSymbol? {
        let elementsToCheck = board.getSymbolsForPositions([0,4,8])
        if let winner = checkWinnerInArray(elementsToCheck) {
            return winner
        }
        return nil
    }
    
    private func checkColumns(board: BoardProtocol) -> PlayerSymbol? {
        for i in 0...2 {
            let elementsToCheck = board.getSymbolsForPositions([i,i+3,i+6])
            if let winner = checkWinnerInArray(elementsToCheck) {
                return winner
            }
        }
        return nil
    }
    
    private func checkLines(board: BoardProtocol) -> PlayerSymbol? {
        for i in 0...2 {
            let elementsToCheck = board.getSymbolsForPositions([3*i,3*i+1,3*i+2])
            if let winner = checkWinnerInArray(elementsToCheck) {
                return winner
            }
        }
        return nil
    }
    
    private func checkWinnerInArray(_ array: [PlayerSymbol?]) -> PlayerSymbol? {
        if array.contains(.none) {
            return nil
        }
        if areAllElementsEqualIn(array) {
            return array[0]!
        }
        return nil
    }
    
    private func areAllElementsEqualIn(_ array: [PlayerSymbol?]) -> Bool {
        return (array.filter { return $0 == array[0] }).count == array.count
    }
}
