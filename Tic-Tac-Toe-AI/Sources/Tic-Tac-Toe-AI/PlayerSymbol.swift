//
//  File.swift
//  
//
//  Created by Tiago Santos on 22/06/2021.
//

enum PlayerSymbol: String {
    case cross  = "X"
    case circle = "O"
    
    func getOppositeSymbol() -> PlayerSymbol {
        if self == .cross {
            return .circle
        }
        return .cross
    }
}
