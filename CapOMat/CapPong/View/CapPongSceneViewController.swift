//
//  CapPongSceneViewController.swift
//  CapOMat
//
//  Created by Louis Franco on 12/22/19.
//  Copyright © 2019 App-o-Mat. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class CapPongSceneViewController: UIViewController {

    var scene: CapPongScene?
    var viewDidAppearAlready = false

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !viewDidAppearAlready {
            viewDidAppearFirstTime()
        }
        viewDidAppearAlready = true
    }

    func viewDidAppearFirstTime() {
        self.scene?.startGame(view: self.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let skView = view as? SKView {
            self.scene = CapPongScene(size: view.frame.size)
            skView.presentScene(self.scene)
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
