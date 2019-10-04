//
//  GameScene.swift
//  testPerlinNoiseBug
//
//  Created by Admin on 22.08.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let spriteSize: CGFloat = 128
    let mapSize = vector_double2(2, 2)
    
    func getMapTexture(_ source: GKCoherentNoiseSource) -> SKTexture
    {
        let noise = GKNoise(source)
        
        let noiseMap = GKNoiseMap(noise,
                                  size: mapSize,
                                  origin: vector_double2(0.0, 0.0),
                                  sampleCount: vector_int2(128, 128),
                                  seamless: false)
        
        return SKTexture(noiseMap: noiseMap)
    }
    
    func showSpriteNoise(_ source: GKCoherentNoiseSource, _ freq: Double) {
        let isRidgedNoise: Bool = source is GKRidgedNoiseSource
        
        let noiseTexture = getMapTexture(source)
        
        let spriteNode = SKSpriteNode(
            texture: noiseTexture,
            size: CGSize(width: spriteSize, height: spriteSize))
        
        // shift to Right
        let xShift: CGFloat = freq == 2.0 ? 128 : 0
        // shift to Up
        let yShift: CGFloat = isRidgedNoise ? 128 : 0
        
        spriteNode.position = CGPoint(
            x: spriteSize / 2.0 + xShift,
            y: spriteSize / 2.0 + yShift)
        
        addChild(spriteNode)
    }
    
    func showPerlinSprites(freqList: [ Double ]) {
       
        for freq in freqList {
            
            let perlinNoise = GKPerlinNoiseSource(
                frequency: freq,
                octaveCount: 6,
                persistence: 0.75,
                lacunarity: 2.0,
                seed: 123)
            
            showSpriteNoise(perlinNoise, freq)
            
            let bugRidgedNoise = GKRidgedNoiseSource(
                frequency: freq,
                octaveCount: 4,
                lacunarity: 2.0,
                seed: 111)
            
            showSpriteNoise(bugRidgedNoise, freq)
        }
    }
    
    override func sceneDidLoad() {
        showPerlinSprites(freqList: [1.0, 2.0])
    }
    
}
