//
//  StageSelectLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "StageSelectLayerSprite.h"
#import "StageNumberSprite.h"
#import "GameUtils.h"


@implementation StageSelectLayerSprite

@synthesize backButton, stageBoard, upgradeButton;

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        CCSprite *bg = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_allbg.png"];
        [bg setPosition:CGPointMake(self.contentSize.width*0.5f,
                                    self.contentSize.height*0.5f)];
        [self addChild:bg z:-100];
        [bg release];
        
        [self create];
    }
    return self;
}

- (void)create {
    stageBoard = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_hud_bg_0.png"];
    [stageBoard setPosition:CGPointMake(self.contentSize.width*0.5f,
                                        self.contentSize.height
                                        - stageBoard.contentSize.height*0.5f)];
    [self addChild:stageBoard];
    [stageBoard release];
    CCSprite *stageBoardText = [[CCSprite alloc] initWithSpriteFrameName:@"stage_UI_stage.png"];
    [stageBoardText setPosition:CGPointMake(stageBoard.contentSize.width*0.5f,
                                            stageBoard.contentSize.height
                                            - stageBoardText.contentSize.height*0.5f
                                            - 3)];
    [stageBoard addChild:stageBoardText];
    
    CCSprite *mask = [[CCSprite alloc] initWithSpriteFrameName:@"stage_UI_mask.png"];
    CCSprite *stageNumBoard = [[CCSprite alloc] init];
    [stageNumBoard setContentSize:self.contentSize];
    CCSprite *maskedStageBoard = [GameUtils maskedSpriteWithSprite:stageNumBoard maskSprite:mask];
    [self addChild:maskedStageBoard];
    
    

    backButton = [[CCSprite alloc] initWithSpriteFrameName:@"btn_common_back.png"];
    [backButton setPosition:CGPointMake(stageBoard.position.x
                                        + stageBoard.contentSize.width*0.5f
                                        - 5,
                                        stageBoard.position.y
                                        + stageBoard.contentSize.height*0.5f
                                        - backButton.contentSize.height*0.5f
                                        - 5)];
    [self addChild:backButton];
    [backButton release];
    
    
    float margineX = (self.contentSize.width - 290)*0.5f;
    for (int page=0; page<2; page++) {
        for (int row=0; row<3; row++) {
            for (int col=0; col<5; col++) {
                NSInteger num = (page*15)+(row*5)+(col+1);
                StageNumberSprite *number = [[StageNumberSprite alloc] initWithNumber:num];
                [number setPosition:CGPointMake((page*self.contentSize.width)
                                                + margineX
                                                + number.contentSize.width*0.5
                                                + (number.contentSize.width+10)*col,
                                                self.contentSize.height
                                                - 20
                                                - number.contentSize.height*0.5f
                                                - (number.contentSize.height+10)*row)];
                [stageNumBoard addChild:number z:0 tag:num];
                [number release];
            }
        }
    }
    
    
    upgradeButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_stage_Upgrade.png"];
    [upgradeButton setPosition:CGPointMake(self.position.x,
                                     upgradeButton.contentSize.height)];
    [self addChild:upgradeButton];
    [upgradeButton release];
}

- (void)show {
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

@end
