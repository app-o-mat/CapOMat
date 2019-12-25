//
//  MapPongScene.swift
//  MapOMat
//
//  Created by Louis Franco on 12/22/19.
//  Copyright © 2019 App-o-Mat. All rights reserved.
//

import SpriteKit
import GameplayKit
import GameOMatKit

class StateCapitalGenerator: ProblemGenerator {
    func getNextProblem() -> Problem {
        return Problem(question: "Florida",
                       answer: "Tallahasee",
                       wrongAnswers: Set<String>(arrayLiteral: "Miami", "Tampa"))
    }

}

class MapPongScene: GameScene {

    init(size: CGSize) {
       super.init(size: size, gameLogics:
       [PongOnePlayer(generator: StateCapitalGenerator()),
        PongTwoPlayer(generator: StateCapitalGenerator())])
   }

}
