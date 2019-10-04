//
//  ViewController.swift
//  testPerlinNoiseBug
//
//  Created by Admin on 22.08.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 256, height: 256))

        for freq in 1...2 {
            let labelF = NSTextField()
            labelF.frame = CGRect(origin: CGPoint(x: freq == 2 ? 128 : 0, y: 256 - 18), size: CGSize(width: 100, height: 10))
            labelF.stringValue = freq == 2 ? "2ϝ" : "ϝ"
            labelF.font = NSFont(name: "Menlo", size: 12)
            labelF.backgroundColor = .black
            labelF.sizeToFit()
            
            sceneView.addSubview(labelF)
        }

        let scene = GameScene(size: sceneView.frame.size)
        scene.scaleMode = .fill

        sceneView.presentScene(scene)
        
        self.view = sceneView
        
        
    }
}

