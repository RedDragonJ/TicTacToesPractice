//
//  GamesState.swift
//  TicTacToesPractice
//
//  Created by James H Layton on 6/15/18.
//  Copyright © 2018 james. All rights reserved.
//

import Foundation

enum WinnerType: String {
    case circle
    case cross
    case none
}

class GameState {
    
    static let shared = GameState()
    
    var currentPlayer: Int = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    private let winningCombinations = [[0, 1, 2],
                                       [3, 4, 5],
                                       [6, 7, 8],
                                       [0, 3, 6],
                                       [1, 4, 7],
                                       [2, 5, 8],
                                       [0, 4, 8],
                                       [2, 4, 6]]
    
    //MARK: - GameState Life Cycle
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(resetGame), name: NSNotification.Name("ResetTheGame"), object: nil)
    }

    func checkForWinner() -> WinnerType {
        for combination in winningCombinations {
            
            let combFirstElement = combination[0]
            let combSecondElement = combination[1]
            let combThirdElement = combination[2]
            
            /* Check elements at those positions are not equal 0;
             Then check if the rest of the element at those positions are matches;
             If they are all match either 1,1,1 or 2,2,2, then we know that either circle or cross won the game
             */
            if gameState[combFirstElement] != 0 && gameState[combFirstElement] == gameState[combSecondElement] && gameState[combSecondElement] == gameState[combThirdElement] {
                
                if gameState[combFirstElement] == 1 {
                    return WinnerType.circle
                }
                else {
                    return WinnerType.cross
                }
            }
        }
        return WinnerType.none
    }
    
    @objc func resetGame() {
        self.currentPlayer = 1
        self.gameState = [0,0,0,0,0,0,0,0,0]
    }
    
}
