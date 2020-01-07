//
//  CapPongScene.swift
//  CapOMat
//
//  Created by Louis Franco on 12/22/19.
//  Copyright © 2019 App-o-Mat. All rights reserved.
//

import SpriteKit
import GameplayKit
import GameOMatKit

class StateCapitalGenerator: ProblemGenerator {
    let maxAnswerLength: Int

    static let data = [
        "Alabama": ("Montgomery", ["Birmingham", "Home"]),
        "Alaska": ("Juneau", ["Sacremento", "Buffalo"]),
        "Arizona": ("Phoenix", ["Tucson", "Winslow"]),
        "Arkansas": ("Little Rock", ["Kansas", "Montpelier"]),
        "Florida": ("Tallahasee", ["Miami", "Tampa"]),
        "New Jersey": ("Trenton", ["Newark", "Hoboken"]),
        "New York": ("Albany", ["New York", "Buffalo"]),
    ]

    init() {
        // Find the longest answer
        self.maxAnswerLength = StateCapitalGenerator.data.reduce(0) { curMax, stateInfo in
            ([stateInfo.1.0] + stateInfo.1.1).reduce(curMax) { max($0, $1.count) }
        }
    }

    func getNextProblem() -> Problem {
        let pData = StateCapitalGenerator.data.randomElement()!
        return Problem(question: pData.0,
                       answer: pData.1.0,
                       wrongAnswers: Set<String>(pData.1.1))
    }

}

class CapPongScene: GameScene {

    init(size: CGSize) {
       super.init(size: size, gameLogics:
       [PongOnePlayerLogic(generator: StateCapitalGenerator(), numButtonLines: 2),
        PongTwoPlayerLogic(generator: StateCapitalGenerator(), numButtonLines: 2)])
   }

}
