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

class CapitalToStateGenerator: ProblemGenerator {
    let maxAnswerLength: Int

    static let data = [
        "Alabama": "Montgomery",
        "Alaska": "Juneau",
        "Arizona": "Phoenix",
        "Arkansas": "Little Rock",
        "California": "Sacramento",
        "Colorado": "Denver",
        "Connecticut": "Hartford",
        "Delaware": "Dover",
        "Florida": "Tallahassee",
        "Georgia": "Atlanta",
        "Hawaii": "Honolulu",
        "Idaho": "Boise",
        "Illinois": "Springfield",
        "Indiana": "Indianapolis",
        "Iowa": "Des Moines",
        "Kansas": "Topeka",
        "Kentucky": "Frankfort",
        "Louisiana": "Baton Rouge",
        "Maine": "Augusta",
        "Maryland": "Annapolis",
        "Massachusetts": "Boston",
        "Michigan": "Lansing",
        "Minnesota": "Saint Paul",
        "Mississippi": "Jackson",
        "Missouri": "Jefferson City",
        "Montana": "Helena",
        "Nebraska": "Lincoln",
        "Nevada": "Carson City",
        "New Hampshire": "Concord",
        "New Jersey": "Trenton",
        "New Mexico": "Santa Fe",
        "New York": "Albany",
        "North Carolina": "Raleigh",
        "North Dakota": "Bismarck",
        "Ohio": "Columbus",
        "Oklahoma": "Oklahoma City",
        "Oregon": "Salem",
        "Pennsylvania": "Harrisburg",
        "Rhode Island": "Providence",
        "South Carolina": "Columbia",
        "South Dakota": "Pierre",
        "Tennessee": "Nashville",
        "Texas": "Austin",
        "Utah": "Salt Lake City",
        "Vermont": "Montpelier",
        "Virginia": "Richmond",
        "Washington": "Olympia",
        "West Virginia": "Charleston",
        "Wisconsin": "Madison",
        "Wyoming": "Cheyenne",
    ]

    init() {
        // Find the longest answer
        self.maxAnswerLength = CapitalToStateGenerator.data.reduce(0) { max($0, $1.1.count) }
    }

    func getNextProblem() -> Problem {
        let stateAndCap = CapitalToStateGenerator.data.randomElement()!
        var wrongAnswers = Set<String>(CapitalToStateGenerator.data.keys)
        wrongAnswers.remove(stateAndCap.0)

        return Problem(question: stateAndCap.1,
                       answer: stateAndCap.0,
                       wrongAnswers: wrongAnswers)
    }

}

class CapPongScene: GameScene {

    init(size: CGSize) {
        let style = PongStyle(problemFontSize: 30, buttonFontSize: 20, numButtonLines: 2)
        super.init(size: size, gameLogics:
            [PongOnePlayerLogic(generator: CapitalToStateGenerator(), style: style),
             PongTwoPlayerLogic(generator: CapitalToStateGenerator(), style: style)])
    }

}
