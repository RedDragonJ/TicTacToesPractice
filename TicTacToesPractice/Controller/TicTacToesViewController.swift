//
//  TicTacToesViewController.swift
//  TicTacToesPractice
//
//  Created by James H Layton on 6/15/18.
//  Copyright © 2018 james. All rights reserved.
//

import UIKit

class TicTacToesViewController: UIViewController {
    
    private let stats = GameState.shared
    private let alert = AlertViewManager.shared
    
    //MARK: - TicTacToesViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tttGameAction(_ sender: TicTacToesButton) {
        sender.setImageForGame()
        
        let type: WinnerType = self.stats.checkForWinner()
        switch type {
        case WinnerType.circle:
            self.alert.presentAlertWithClosure(title: "Circle Won!", msg: "Hit Ok to play again.", vc: self, closure: {
                self.resetGame()
            })
            break
        case WinnerType.cross:
            self.alert.presentAlertWithClosure(title: "Cross Won!", msg: "Hit Ok to play again.", vc: self, closure: {
                self.resetGame()
            })
            break
        default:
            break
        }
    }
    
    func resetGame() {
        NotificationCenter.default.post(name: NSNotification.Name("ResetTheGame"), object: nil)
    }
}
