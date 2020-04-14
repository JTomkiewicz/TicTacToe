//
//  ViewController.swift
//  TicTacToe
//
//  Created by J Tomkiewicz on 14/04/2020.
//  Copyright © 2020 JTomkiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playerPlaying = 1
    
    @IBOutlet weak var score: UILabel!
    
    @IBAction func action(_ sender: AnyObject ) {
        if playerPlaying == 1 {
            sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
            playerPlaying = 2
        } else {
            sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
            playerPlaying = 1
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

