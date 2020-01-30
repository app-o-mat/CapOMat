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

class StateToCapitalGenerator: ProblemGenerator {
    let maxAnswerLength: Int

    static let data = [
        "Alabama": ("Montgomery", ["Birmingham", "Huntville", "Mobile"]),
        "Alaska": ("Juneau", ["Anchorage", "Fairbanks", "Wasilla"]),
        "Arizona": ("Phoenix", ["Tucson", "Winslow", "Mesa", "Scottsdale"]),
        "Arkansas": ("Little Rock", ["Springdale", "Fort Smith", "Topeka"]),
        "California": ("Sacramento", ["Los Angeles", "San Diego", "Fresno"]),
        "Colorado": ("Denver", ["Fort Collins", "Aurora", "Boulder"]),
        "Connecticut": ("Hartford", ["Bridgeport", "New Haven", "Stamford"]),
        "Delaware": ("Dover", ["Wilmington", "Newark", "Middletown"]),
        "Florida": ("Tallahasee", ["Miami", "Tampa", "Jacksonville", "Orlando"]),
        "Georgia": ("Atlanta", ["Augusta", "Macon", "Savannah"]),
        "Hawaii": ("Honolulu", ["Hilo", "Maui", "Kailua", "Oahu"]),
        "Idaho": ("Boise", ["Nampa", "Idaho Falls", "Meridian"]),
        "Illinois": ("Springfield", ["Chicago", "Joliet", "Naperville"]),
        "Indiana": ("Indianapolis", ["Evansville", "South Bend", "Fort Wayne"]),
        "Iowa": ("Des Moines", ["Davenport", "Iowa City", "Sioux City"]),
        "Kansas": ("Topeka", ["Wichita", "Kansas City", "Little Rock"]),
        "Kentucky": ("Frankfort", ["Louisville", "Lexington", "Topeka"]),
        "Louisiana": ("Baton Rouge", ["New Orleans", "Shreveport", "Lafayette"]),
        "Maine": ("Augusta", ["Portland", "Lewiston", "Bangor"]),
        "Maryland": ("Annapolis", ["Baltimore", "Rockville", "Bowie", "Frederick"]),
        "Massachusetts": ("Boston", ["Worcester", "Northampton", "Springfield", "Cambridge"]),
        "Michigan": ("Lansing", ["Detroit", "Grand Rapids", "Warren", "Ann Arbor"]),
        "Minnesota": ("Saint Paul", ["Minneapolis", "Rochester", "Duluth"]),
        "Mississippi": ("Jackson", ["Gulfport", "Southaven", "Biloxi", "Mobile"]),
        "Missouri": ("Jefferson City", ["Kansas City", "Saint Louis", "Columbia"]),
        "Montana": ("Helena", ["Billings", "Missoula", "Bozeman", "Butte"]),
        "Nebraska": ("Lincoln", ["Omaha", "Bellevue", "Kearney"]),
        "Nevada": ("Carson City", ["Las Vegas", "Reno", "Sparks", "Henderson"]),
        "New Hampshire": ("Concord", ["Manchester", "Nashua", "Dover"]),
        "New Jersey": ("Trenton", ["Newark", "Hoboken", "Jersey City", "Elizabeth"]),
        "New Mexico": ("Santa Fe", ["Albuquerque", "Las Cruces", "Roswell"]),
        "New York": ("Albany", ["New York", "Buffalo", "Rochester", "Syracuse"]),
        "North Carolina": ("Raleigh", ["Charlotte", "Greensboro", "Asheville", "Durham"]),
        "North Dakota": ("Bismarck", ["Fargo", "Pierre", "Grand Forks"]),
        "Ohio": ("Columbus", ["Cleveland", "Cincinnati", "Toledo"]),
        "Oklahoma": ("Oklahoma City", ["Tulsa", "Edmond", "Lexington"]),
        "Oregon": ("Salem", ["Bend", "Portland", "Eugene"]),
        "Pennsylvania": ("Harrisburg", ["Philadelphia", "Pittsburgh", "Allentown", "Erie"]),
        "Rhode Island": ("Providence", ["Warwick", "Pawtucket", "Charlestown"]),
        "South Carolina": ("Columbia", ["Charleston", "Rock Hill", "Raleigh", "Durham"]),
        "South Dakota": ("Pierre", ["Sioux Falls", "Rapid City", "Bismarck"]),
        "Tennessee": ("Nashville", ["Memphis", "Knoxville", "Clarksville"]),
        "Texas": ("Austin", ["Dallas", "Houston", "San Antonio", "Fort Worth"]),
        "Utah": ("Salt Lake City", ["Provo", "Orem", "Utah City"]),
        "Vermont": ("Montpelier", ["Burlington", "Barre", "Concord"]),
        "Virginia": ("Richmond", ["Norfolk", "Chesapeake", "Virginia Beach"]),
        "Washington": ("Olympia", ["Seattle", "Spokane", "Tacoma"]),
        "West Virginia": ("Charleston", ["Huntington", "Mobile", "Columbia"]),
        "Wisconsin": ("Madison", ["Milwaukee", "Green Bay", "Kenosha"]),
        "Wyoming": ("Cheyenne", ["Casper", "Helena", "Laramie", "Lexington"]),
    ]

    init() {
        // Find the longest answer
        self.maxAnswerLength = StateToCapitalGenerator.data.reduce(0) { curMax, stateInfo in
            ([stateInfo.1.0] + stateInfo.1.1).reduce(curMax) { max($0, $1.count) }
        }
    }

    func getNextProblem() -> Problem {
        let pData = StateToCapitalGenerator.data.randomElement()!
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

enum CapGame: String, CaseIterable {
    case state
    case capital

    public func generator() -> ProblemGenerator {
        switch self {
        case .state:
            return StateToCapitalGenerator()
        case .capital:
            return CapitalToStateGenerator()
        }
    }

    public static func at(index: Int) -> CapGame {
        return CapGame.allCases[index]
    }

    public static func named(name: String?) -> CapGame? {
        CapGame.allCases.first { $0.rawValue == name }
    }

    public func index() -> Int {
        return CapGame.allCases.firstIndex(of: self) ?? 0
    }
}

enum CapSettingKey {
    static let currentGameIndex = "cap-pong.settingKey.currentGameIndex"
}

class CapPongScene: GameScene {

    var gameButtons = [ColorButtonNode]()
    var currentGame: CapGame = CapGame.state {
        didSet {
            didSetCurrentGame()
        }
    }

    init(size: CGSize) {
        let style = PongStyle(problemFontSize: 30, buttonFontSize: 18, numButtonLines: 2)
        super.init(size: size, gameLogics:
            [PongOnePlayerLogic(generator: StateToCapitalGenerator(), style: style),
             PongTwoPlayerLogic(generator: StateToCapitalGenerator(), style: style)])
    }

    private func didSetCurrentGame() {
        UserDefaults.standard.set(currentGame.index(), forKey: CapSettingKey.currentGameIndex)
        resetGameButtons()
        self.gameLogic.generator = self.currentGame.generator()
    }

    override func addWaitingToStartButtons() {
        super.addWaitingToStartButtons()
        addGameButtons()
    }

    override func removeControlButtons() {
        super.removeControlButtons()
        removeGameButtons()
    }

    func addGameButtons() {
        for (i, game) in CapGame.allCases.enumerated() {
            let pos = super.buttonPosition(xGridOffset: -0.5 + CGFloat(i), yGridOffset: 1.5)
            self.gameButtons.append(
                addGameButton(gameName: game.rawValue, position: pos, on: currentGame == game))
        }
    }

    func resetGameButtons() {
        removeGameButtons()
        addGameButtons()
    }

    func removeGameButtons() {
        self.gameButtons.forEach { $0.removeFromParent() }
        self.gameButtons = []
    }

    func addGameButton(gameName: String, position: CGPoint, on: Bool) -> ColorButtonNode {
        let button = ColorButtonNode(
            color: AppColor.imageButtonBackground,
            size: Style.smallButtonSize)
        addChild(button)
        button.texture = SKTexture(imageNamed: "\(gameName)-button-\(on ? "on" : "off")")
        button.position = position
        button.name = gameName
        button.onTap = { [weak self] button in
            guard let sself = self else { return }
            sself.currentGame = CapGame.named(name: button.name) ?? CapGame.state
        }
        return button
    }

}
