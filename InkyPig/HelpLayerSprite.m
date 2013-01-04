//
//  HelpLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "HelpLayerSprite.h"
#import "StageNumberSprite.h"


@implementation HelpLayerSprite

@synthesize backButton, preButton, nextButton;

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
    
    preButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_help_pre.png"];
    [preButton setPosition:CGPointMake(self.position.x
                                       - 100,
                                       self.contentSize.height
                                       - 50)];
    [self addChild:preButton];
    [preButton release];
    
    nextButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_help_next.png"];
    [nextButton setPosition:CGPointMake(self.position.x
                                        + 100,
                                        preButton.position.y)];
    [self addChild:nextButton];
    [nextButton release];
    
    CCSprite *slash = [[CCSprite alloc] initWithSpriteFrameName:@"menu_common_slash.png"];
    [slash setPosition:CGPointMake(self.position.x,
                                   preButton.position.y)];
    [self addChild:slash];
    [slash release];
    
    pageNumber = [[StageNumberSprite alloc] initWithNumber:1];
    [pageNumber setPosition:CGPointMake(self.position.x
                                        - slash.contentSize.width*0.5f
                                        - pageNumber.contentSize.width*0.5f,
                                        preButton.position.y)];
    [self addChild:pageNumber];
    [pageNumber release];
    
    pageCount = [[StageNumberSprite alloc] initWithNumber:4];
    [pageCount setPosition:CGPointMake(self.position.x
                                       + slash.contentSize.width*0.5f
                                       + pageCount.contentSize.width*0.5f,
                                       preButton.position.y)];
    [self addChild:pageCount];
    [pageCount release];
    
    helpBoard = [[CCSprite alloc] init];
    [helpBoard setContentSize:self.contentSize];
    [helpBoard setPosition:self.position];
    [self addChild:helpBoard];
    [helpBoard release];
    
    for (int i=1; i<=4; i++) {
        CCSprite *help = [[CCSprite alloc] initWithSpriteFrameName:
                          [NSString stringWithFormat:@"menu_help_%02d.png", i]];
        [help setPosition:CGPointMake(self.position.x,
                                      preButton.position.y
                                      - 20
                                      - help.contentSize.height*0.5f)];
        [help setVisible:NO];
        [helpBoard addChild:help z:0 tag:i];
        [help release];
    }
    CCSprite *help = (CCSprite *)[helpBoard getChildByTag:1];
    [help setVisible:YES];
    
    currentPage = 1;
}

- (void)show {
    for (CCSprite *help in [helpBoard children]) {
        [help setVisible:NO];
    }
    CCSprite *help = (CCSprite *)[helpBoard getChildByTag:1];
    [help setVisible:YES];

    currentPage = 1;
    [pageNumber setNumber:1];
    
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

- (void)nextPage {
    if (currentPage < 4) {
        currentPage++;
        for (CCSprite *sprite in [helpBoard children]) {
            [sprite setVisible:NO];
        }
        CCSprite *sprite = (CCSprite *)[helpBoard getChildByTag:currentPage];
        [sprite setVisible:YES];
        
        [pageNumber setNumber:currentPage];
    }
}

- (void)prePage {
    if (currentPage > 1) {
        currentPage--;
        for (CCSprite *sprite in [helpBoard children]) {
            [sprite setVisible:NO];
        }
        CCSprite *sprite = (CCSprite *)[helpBoard getChildByTag:currentPage];
        [sprite setVisible:YES];
        
        [pageNumber setNumber:currentPage];
    }
}

@end
