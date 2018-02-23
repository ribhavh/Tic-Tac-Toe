//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ribhav Hora on 7/21/16.
//  Copyright © 2016 SmartApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var result: UILabel!

    @IBOutlet var playAgainButton: UIButton!
    @IBOutlet var button: UIButton!
    
    var activePlayer = 1 // 1 = noughts 2 = crosses
    
    var isActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBAction func playAgain(_ sender: AnyObject) {
        isActive = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        result.isHidden = true
        result.center = CGPoint(x: result.center.x - 500, y: result.center.y)
        playAgainButton.isHidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        var isButton : UIButton
        for i in 0 ..< 9 {
            isButton = view.viewWithTag(i) as! UIButton
            isButton.setImage(nil, for: UIControlState())
        }
      
    }
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7 , 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if isActive {
        
        if(gameState[sender.tag] == 0) {
        if activePlayer % 2 != 0 {
            sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
            gameState[sender.tag] = 1

            
        } else {
            sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
            gameState[sender.tag] = 2
        }
        activePlayer += 1
        }
        
        for combinations in winningCombinations {
            
            if(gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]]) {
                
                isActive = false
                
                if gameState[combinations[0]] == 1 {
                    result.text = "Noughts have won!"
                } else {
                    result.text = "Crosses have won!"
                }
                
                
                endGame()
                
            }
        }
            if isActive {
                isActive = false
                
                for buttonState in gameState {
                    if buttonState == 0 {
                        isActive = true
                    }
                }
                
                if !isActive {
                    result.text = "It's a draw!";
                    endGame()
                }
                
            }
        
        
        }
        
        
        
   }
    
    func endGame() {
        
        result.isHidden = false
        playAgainButton.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: {
            self.result.center = CGPoint(x: self.result.center.x + 500, y: self.result.center.y)
            self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
            
        })
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.isHidden = true
        result.center = CGPoint(x: result.center.x - 500, y: result.center.y)
       playAgainButton.isHidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

