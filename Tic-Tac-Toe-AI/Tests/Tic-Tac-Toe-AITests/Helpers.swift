//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

import Tic_Tac_Toe_Engine

class Helpers {
    
    static func convertStringIntoBoard(_ string: String) -> [PlayerSymbol?] {
        var currentBoard = [PlayerSymbol?]()
        let stringArray = Array(string)
        stringArray.forEach {
            switch $0 {
            case ".":
                 currentBoard.append(.none)
            case "X":
                 currentBoard.append(.cross)
            case "O":
                currentBoard.append(.circle)
            default:
                print("")
            }
        }
        return currentBoard
    }
    
}
