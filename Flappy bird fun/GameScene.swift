//
//  GameScene.swift
//  Flappy bird fun
//
//  Created by Azucena on 5/14/15.
//  Copyright (c) 2015 LEIF. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let hero = SKSpriteNode(imageNamed: "FlapTap")
    let hero2 = SKSpriteNode(imageNamed: "GreenTap1")
    let hero3 = SKSpriteNode(imageNamed: "BlueTap1")
    
    let PlayG = SKSpriteNode(imageNamed: "Play Game")
    
    var heroSelected = false
    
    override func didMoveToView(view: SKView) {
        
        //adding to the scene
        bg()
        addPlay()
        heroes()
    }
    
    func bg() {
        self.backgroundColor = SKColor.blackColor()
    }
    
    //function for the playgame button
    func addPlay() {
        PlayG.size = CGSize(width: 220, height: 40)
        PlayG.zPosition = 10
        PlayG.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        addChild(PlayG)
        
        //play Action
        var action = SKAction.scaleBy(0.9, duration: 1.0)
        var actionSequence = SKAction.sequence([action, action.reversedAction()])
        
        PlayG.runAction(SKAction.repeatActionForever(actionSequence))
    }
    
    func heroes() {
        hero.size  = CGSize(width: 70, height: 70)
        hero.zPosition = 10
        hero.position = CGPoint(x: self.frame.size.width*0.2, y: self.frame.size.height*0.6)
        addChild(hero)
        
        //texture for flaps
        let flap1 = SKTexture(imageNamed: "FlapTap")
        let flap2 = SKTexture(imageNamed: "FlapTap2")
        let flaps = [flap1, flap2]
        
        //runActions
        hero.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))
        
        //hero2
        hero2.size  = CGSize(width: 70, height: 70)
        hero2.zPosition = 10
        hero2.position = CGPoint(x: self.frame.size.width*0.2, y: self.frame.size.height*0.5)
        addChild(hero2)
        
        //texture for flaps
        let flap3 = SKTexture(imageNamed: "GreenTap1")
        let flap4 = SKTexture(imageNamed: "GreenTap2")
        let flapss = [flap3, flap4]
        
        //runActions
        hero2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapss, timePerFrame: 0.1)))
        
        //hero2
        hero3.size  = CGSize(width: 70, height: 70)
        hero3.zPosition = 10
        hero3.position = CGPoint(x: self.frame.size.width*0.2, y: self.frame.size.height*0.4)
        addChild(hero3)
        
        //texture for flaps
        let flap5 = SKTexture(imageNamed: "BlueTap1")
        let flap6 = SKTexture(imageNamed: "BlueTap2")
        let flapsss = [flap5, flap6]
        
        hero3.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapsss, timePerFrame: 0.1)))
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)

            //selecting which hero
            switch self.nodeAtPoint(location) {
            case self.hero:
                NSUserDefaults().setObject("Flap1", forKey: "SelectedHero")
                let selected = NSUserDefaults().objectForKey("SelectedHero") as! String
                
                if selected == "Flap1" {
                    hero2.removeAllActions()
                    hero3.removeAllActions()
                    
                    hero2.texture = SKTexture(imageNamed: "GreenTap1")
                    hero3.texture = SKTexture(imageNamed: "BlueTap1")
    
                    let flap3 = SKTexture(imageNamed: "GreenTap1")
                    let flap4 = SKTexture(imageNamed: "GreenTap2")
                    let flapss = [flap3, flap4]
                    
                    let flap5 = SKTexture(imageNamed: "BlueTap1")
                    let flap6 = SKTexture(imageNamed: "BlueTap2")
                    let flapsss = [flap5, flap6]
                    
                    hero2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapss, timePerFrame: 0.1)))
                    hero3.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapsss, timePerFrame: 0.1)))
                }
                heroSelected = true
                hero.removeAllActions()
                hero.texture = SKTexture(imageNamed: "FlapSelected")
                
            case self.hero2:
                NSUserDefaults().setObject("GreenTap1", forKey: "SelectedHero")
                
                let selected = NSUserDefaults().objectForKey("SelectedHero") as! String
                
                if selected == "GreenTap1" {
                    hero.removeAllActions()
                    hero3.removeAllActions()
                    
                    hero.texture = SKTexture(imageNamed: "FlapTap")
                    hero3.texture = SKTexture(imageNamed: "BlueTap1")
                    
                    let flap1 = SKTexture(imageNamed: "FlapTap")
                    let flap2 = SKTexture(imageNamed: "FlapTap2")
                    let flaps = [flap1, flap2]
                    
                    let flap5 = SKTexture(imageNamed: "BlueTap1")
                    let flap6 = SKTexture(imageNamed: "BlueTap2")
                    let flapsss = [flap5, flap6]
                    
                    hero.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))
                    hero3.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapsss, timePerFrame: 0.1)))
                }
                
                heroSelected = true
                hero2.removeAllActions()
                hero2.texture = SKTexture(imageNamed: "GreenSelected")
                
            case self.hero3:
                NSUserDefaults().setObject("BlueTap1", forKey: "SelectedHero")
                
                let selected = NSUserDefaults().objectForKey("SelectedHero") as! String
                
                if selected == "BlueTap1" {
                    hero.removeAllActions()
                    hero2.removeAllActions()
                    
                    hero.texture = SKTexture(imageNamed: "FlapTap")
                    hero2.texture = SKTexture(imageNamed: "GreenTap1")
                    
                    let flap1 = SKTexture(imageNamed: "FlapTap")
                    let flap2 = SKTexture(imageNamed: "FlapTap2")
                    let flaps = [flap1, flap2]
                    
                    let flap3 = SKTexture(imageNamed: "GreenTap1")
                    let flap4 = SKTexture(imageNamed: "GreenTap2")
                    let flapss = [flap3, flap4]
                    
                    hero.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flaps, timePerFrame: 0.1)))
                    hero2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flapss, timePerFrame: 0.1)))
                }
                
                heroSelected = true
                hero3.removeAllActions()
                hero3.texture = SKTexture(imageNamed: "BlueSelected")
            
            default:
                println("Hero not selected")
            }
            
            //presenting scene when touch
            if self.nodeAtPoint(location) == self.PlayG {
                if heroSelected {
                    let scene = PlayScene(size: self.size)
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .AspectFill
                    skView.presentScene(scene)
                }else{
                    if PlayG.containsPoint(location) {
                        let game = UIAlertController(title: "", message:  "Select Hero first", preferredStyle: UIAlertControllerStyle.Alert)
                        game.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default)  { _ in
                            })
                        self.view!.window!.rootViewController!.presentViewController(game, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
