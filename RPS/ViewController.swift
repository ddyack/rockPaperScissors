//
//  ViewController.swift
//  RPS
//
//  Created by ddyack on 13.07.2020.
//  Copyright © 2020 ddyack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var papperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var playerScore = 0
    var computerScore = 0
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            papperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            papperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            papperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        resetButton.isHidden = false
        
        
        let result = sign.getResult(for: computerSign)
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            self.view.backgroundColor = UIColor.green
            playerScore += 1
            self.scoreLabel.text = "\(playerScore):\(computerScore)"
        case .lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
            computerScore += 1
            self.scoreLabel.text = "\(playerScore):\(computerScore)"
        case .start:
            reset()
            self.scoreLabel.text = "\(playerScore):\(computerScore)"
        case .draw:
            statusLabel.text = "It's a draw!"
            self.view.backgroundColor = UIColor.blue
            self.scoreLabel.text = "\(playerScore):\(computerScore)"
        }
        
    }
    
    func reset() {
        robotButton.setTitle("🤖", for: .normal)
        statusLabel.text = "Rock, Papper, Scissor?"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        papperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        
        self.scoreLabel.text = "\(playerScore):\(computerScore)"
    }
    
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func papperButtonPressed(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
}

