//
//  ViewController.swift
//  TicTacToe
//
//  Created by J Tomkiewicz on 14/04/2020.
//  Copyright © 2020 JTomkiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playerPlaying: Int = 1
    var statesOfBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0] //if zero then place empty
    
    var optionsToWin = [[0, 1, 2], [3, 4 , 5], [6, 7 , 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameOver = false
    
    @IBOutlet weak var score: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        if statesOfBoard[sender.tag-1] == 0 && gameOver != true {
            
            statesOfBoard[sender.tag-1] = playerPlaying
            
            if playerPlaying == 1 {
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                playerPlaying = 2
            } else {
                sender.setImage(UIImage(named: "android.png"), for: UIControl.State())
                playerPlaying = 1
            }
        }
        
        for options in optionsToWin {
            if statesOfBoard[options[0]] != 0 && statesOfBoard[options[0]] == statesOfBoard[options[1]] && statesOfBoard[options[1]] == statesOfBoard[options[2]] {
                
                if statesOfBoard[options[0]] == 0 {
                    score.text = String("ANDROID WIN")
                    gameOver = true
                    
                } else {
                    score.text = String("APPLE WIN")
                    gameOver = true
                }
                resetbutton.isHidden = false
            }
        }
        
        gameOver = true
        for item in statesOfBoard {
            if item == 0 {
                gameOver = false
                break
            }
        }
        
        if gameOver == true { resetbutton.isHidden = false }
    }
    
    
    @IBOutlet weak var resetbutton: UIButton!
    @IBAction func resetAction(_ sender: AnyObject) {
        statesOfBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameOver = false
        playerPlaying = 1
        resetbutton.isHidden = true
        score.text = String("")
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetbutton.isHidden = true
    }


}

