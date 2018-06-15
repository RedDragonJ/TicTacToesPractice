//
//  TicTacToesButton.swift
//  TicTacToesPractice
//
//  Created by James H Layton on 6/15/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class TicTacToesButton: UIButton {

    private let stats = GameState.shared
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(resetGame), name: NSNotification.Name("ResetTheGame"), object: nil)
    }
    
    func setImageForGame() {
        if self.stats.gameState[self.tag - 1] == 0 {
            self.stats.gameState[self.tag - 1] = self.stats.currentPlayer
            
            if self.stats.currentPlayer == 1 {
                
                self.stats.currentPlayer = 2
                self.setImage(#imageLiteral(resourceName: "circle"), for: .normal)
            }
            else {
                
                self.stats.currentPlayer = 1
                self.setImage(#imageLiteral(resourceName: "cross"), for: .normal)
            }
        }
    }
    
    @objc func resetGame() {
        self.setImage(nil, for: .normal)
    }
}
