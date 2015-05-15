//
//  PlayScene.swift
//  Flappy bird fun
//
//  Created by Azucena on 5/14/15.
//  Copyright (c) 2015 LEIF. All rights reserved.
//

import Foundation
import SpriteKit



class PlayScene: SKScene {
    

    var player : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        bg()
        addPlayer()
    }
    
    func bg() {
        self.backgroundColor = SKColor.blueColor()
    }
    
    func addPlayer() {
        
        let selectedPlayer = NSUserDefaults().objectForKey("SelectedHero") as! String
        
        switch selectedPlayer {
        case "Flap1":
            player = SKSpriteNode(imageNamed: "FlapTap")
            //player pos
            player.setScale(0.80)
            player.zPosition = 10
            player.position = CGPoint(x: self.frame.size.width/5, y: self.frame.size.height/2)
            
            //player physicsbodies
            player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.height/2)
            player.physicsBody?.affectedByGravity = true
            player.physicsBody?.dynamic = true
            player.physicsBody?.allowsRotation = false
            
            //addchild player
            addChild(player)
            
            let flap1 = SKTexture(imageNamed: "FlapTap")
            let flap2 = SKTexture(imageNamed: "FlapTap2")
            let flaps = [flap1, flap2]
            
            //runActions
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))
        case "GreenTap1":
            player = SKSpriteNode(imageNamed: "GreenTap1")
            //player pos
            player.setScale(0.80)
            player.zPosition = 10
            player.position = CGPoint(x: self.frame.size.width/5, y: self.frame.size.height/2)
            
            //player physicsbodies
            player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.height/2)
            player.physicsBody?.affectedByGravity = true
            player.physicsBody?.dynamic = true
            player.physicsBody?.allowsRotation = false
            
            //addchild player
            addChild(player)
            
            let flap1 = SKTexture(imageNamed: "GreenTap1")
            let flap2 = SKTexture(imageNamed: "GreenTap2")
            let flaps = [flap1, flap2]
            
            //runActions
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))

        case "BlueTap1":
            player = SKSpriteNode(imageNamed: "BlueTap1")
            
            //player pos
            player.setScale(0.80)
            player.zPosition = 10
            player.position = CGPoint(x: self.frame.size.width/5, y: self.frame.size.height/2)
            
            //player physicsbodies
            player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.height/2)
            player.physicsBody?.affectedByGravity = true
            player.physicsBody?.dynamic = true
            player.physicsBody?.allowsRotation = false
            
            //addchild player
            addChild(player)
            
            let flap1 = SKTexture(imageNamed: "BlueTap1")
            let flap2 = SKTexture(imageNamed: "BlueTap2")
            let flaps = [flap1, flap2]
            
            //runActions
            player.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))
            
        default:
            println("No hero")
            
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            player.physicsBody?.velocity = CGVectorMake(0, 0)
            player.physicsBody?.applyImpulse(CGVectorMake(0, 70))
        }
    }
}