//
//  Sign.swift
//  RPS
//
//  Created by ddyack on 13.07.2020.
//  Copyright © 2020 ddyack. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors

    var emoji : String {
        switch self {
        case .paper:
            return "🖐"
        case .rock:
            return "✊"
        case .scissors:
            return "✌️"
        }
    }

    func getResult(for oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}
