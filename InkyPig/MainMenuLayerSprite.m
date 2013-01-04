//
//  MainMenuLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MainMenuLayerSprite.h"

@implementation MainMenuLayerSprite

@synthesize playButton, infoButton, optionButton;

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
    CCSprite *title = [[CCSprite alloc] initWithSpriteFrameName:@"menu_title.png"];
    [title setPosition:CGPointMake(self.position.x, 
                                   self.position.y
                                   + 80)];
    [self addChild:title];
    [title release];
    
    float buttonsX = self.contentSize.width * 0.75f;
    playButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_play.png"];
    infoButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_info.png"];
    optionButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option.png"];
    
    [playButton setPosition:CGPointMake(buttonsX, 
                                        title.position.y
                                        - title.contentSize.height*0.5f
                                        - playButton.contentSize.height*0.5f)];
    [optionButton setPosition:CGPointMake(buttonsX, 
                                          playButton.position.y
                                          - playButton.contentSize.height*0.5f
                                          - optionButton.contentSize.height*0.5f
                                          - 10)];
    [infoButton setPosition:CGPointMake(buttonsX, 
                                        optionButton.position.y
                                        - optionButton.contentSize.height*0.5f
                                        - infoButton.contentSize.height*0.5f
                                        - 10)];
    
    [self addChild:playButton];
    [self addChild:optionButton];
    [self addChild:infoButton];
    
    [playButton release];
    [infoButton release];
    [optionButton release];
}

- (void)show {
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];    
}

@end
