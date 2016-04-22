//
//  GameScene.m
//  AngleTest
//
//  Created by The Cowans on 13/04/2016.
//  Copyright (c) 2016 DCC. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    SKSpriteNode* sprite;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 45;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if(!sprite){
            
            sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
            
            sprite.xScale = 0.5;
            sprite.yScale = 0.5;
            sprite.position = location;
            
            //SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
            
            //[sprite runAction:[SKAction repeatActionForever:action]];
            
            [self addChild:sprite];
            
        }
        
        else {
            
            //sprite.zRotation = sprite.zRotation + M_PI;
            
            sprite.zRotation = [self getAngleFrom:sprite.position to:location];
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        
            //sprite.zRotation = sprite.zRotation + M_PI;
            
            sprite.zRotation = [self getAngleFrom:sprite.position to:location];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(float)getAngleFrom:(CGPoint)pointA to:(CGPoint)pointB{
    CGFloat angle = 0.0;
    
    //NSLog(@"A: %2.0f, %2.0f; B: %2.0f, %2.0f", pointA.x, pointA.y, pointB.x, pointB.y);
    
    
    //convert pointB to a point relative to pointA
    pointB = CGPointMake(
                         pointB.x - pointA.x,
                         pointB.y - pointA.y
                         );
    //NSLog(@"B relative to A: %2.0f, %2.0f", pointB.x, pointB.y);
    
    angle = -atan2f(pointB.x, pointB.y);
    
    NSLog(@"touch at: %f, %f angle: %f", pointB.x, pointB.y, angle/M_PI);
    
    return angle;
}

@end
