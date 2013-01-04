//
//  DifficultySelectLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "DifficultySelectLayerSprite.h"


@implementation DifficultySelectLayerSprite

@synthesize backButton, normalButton, hardButton, infinityButton;

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];
    }
    return self;
}

- (void)create {
    backButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_common_back.png"];
    [backButton setPosition:CGPointMake(10 + backButton.contentSize.width*0.5f,
                                        self.contentSize.height - 10 - backButton.contentSize.height*0.5f)];
    [self addChild:backButton];
    [backButton release];
    
    normalButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_dif_normal.png"];
    hardButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_dif_hard.png"];
    infinityButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_dif_infinity.png"];
    
    [normalButton setPosition:CGPointMake(self.position.x,
                                    self.position.y
                                    + normalButton.contentSize.height
                                    + 10)];
    [hardButton setPosition:CGPointMake(normalButton.position.x,
                                  normalButton.position.y
                                  - hardButton.contentSize.height
                                  - 10)];
    [infinityButton setPosition:CGPointMake(normalButton.position.x,
                                      hardButton.position.y
                                      - hardButton.contentSize.height
                                      - 10)];
    [self addChild:normalButton];
    [self addChild:hardButton];
    [self addChild:infinityButton];
    
    [normalButton release];
    [hardButton release];
    [infinityButton release];
}

- (void)show {
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

@end
