//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

protocol SupportsAI {
    func getWinnerWith(board: BoardProtocol) -> PlayerSymbol?
}

class AI {
    
    let gameEngine: SupportsAI!
    
    init(gameEngine: SupportsAI) {
        self.gameEngine = gameEngine
    }
    
    func getNextMove(board: BoardProtocol, symbol: PlayerSymbol, isAITurn: Bool = true) -> Int {
        let freeSpaces = board.getFreeSquares()
        var bestScore = -1
        var nextMove = -1
        
        freeSpaces.forEach {
            let score = getScoreFor(board: board, AISymbol: symbol, isAITurn: true, nextMove: $0)
            if score > bestScore {
                bestScore = score
                nextMove = $0
            }
        }
        
        return nextMove
    }
    
    func getScoreFor(board: BoardProtocol, AISymbol: PlayerSymbol, isAITurn: Bool, nextMove: Int) -> Int {
        let currentBoard = board
        
        if isAITurn {
            let playerSymbol = AISymbol
            _ = currentBoard.select(square: nextMove, player: playerSymbol)
        } else {
            let playerSymbol = AISymbol.getOppositeSymbol()
            _ = currentBoard.select(square: nextMove, player: playerSymbol)
        }
        
        switch gameEngine.getWinnerWith(board: currentBoard) {
        case .cross:
            if isAITurn {
                if AISymbol == .cross {
                    return 1
                }
                return -1
            } else {
                if AISymbol == .cross {
                    return -1
                }
                return 1
            }
        case .circle:
            if isAITurn {
                if AISymbol == .circle {
                    return 1
                }
                return -1
            } else {
                if AISymbol == .circle {
                    return -1
                }
                return 1
            }
        case .none:
            let freeSpaces = currentBoard.getFreeSquares()
            if freeSpaces.isEmpty {
                return 0
            } else {
                for freeSpace in freeSpaces {
                    return self.getScoreFor(board: board, AISymbol: AISymbol, isAITurn: !isAITurn, nextMove: freeSpace)
                }
            }
        }
        return 0
    }
}

