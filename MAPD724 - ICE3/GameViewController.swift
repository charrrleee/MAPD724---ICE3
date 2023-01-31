//
//  GameViewController.swift
//  MAPD724 - ICE3
//
//  Created by Charlene Cheung on 30/1/2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GKScene(fileNamed: "GameScene")
        {
            if let sceneNode = scene.rootNode as! GameScene?
            {
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView?
                {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
        
        // Initialize the Lives and Score
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
}
