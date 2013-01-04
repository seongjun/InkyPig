//
//  GamePauseMenuLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 9..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "GamePauseMenuLayerSprite.h"
#import "GameUtils.h"

#define BOARD_X self.position.x
#define GEAR_LEFT_X self.position.x - 41
#define GEAR_CENTER_X popBoard.position.x + 10
#define GEAR_RIGHT_X self.position.x + 52
#define GEAR_CENTER_Y popBoard.position.y + popBoard.contentSize.height*0.5 - 13
#define GEAR_OPTION_Y popOption.position.y + popOption.contentSize.height*0.5 - 13
#define ANCHOR_LEFT_Y gearLeft.position.y + anchorLeft.contentSize.height*0.5f - 6
#define ANCHOR_RIGHT_Y gearRight.position.y + anchorRight.contentSize.height*0.5f - 11
#define CHAIN_LEFT1_X gearLeft.position.x - gearLeft.contentSize.width*0.5f + 6
#define CHAIN_LEFT2_X gearLeft.position.x + gearLeft.contentSize.width*0.5f - 6
#define CHAIN_RIGHT1_X gearRight.position.x - gearRight.contentSize.width*0.5f + 3
#define CHAIN_RIGHT2_X gearRight.position.x + gearRight.contentSize.width*0.5f - 3
#define CHAIN_LEFT1_Y gearLeft.position.y + 2
#define CHAIN_LEFT2_Y gearLeft.position.y - chainLeft2.contentSize.height*0.5f + 2
#define CHAIN_RIGHT1_Y gearRight.position.y + 2
#define CHAIN_RIGHT2_Y gearRight.position.y - chainRight2.contentSize.height*0.5f + 2
#define BUTTON_LEFT_X popBoard.position.x - 4 - resumeButton.contentSize.width*0.5f
#define BUTTON_RIGHT_X popBoard.position.x + 4 + restartButton.contentSize.width*0.5f
#define BUTTON_UPPER_Y popBoard.position.y + 4 + resumeButton.contentSize.height*0.5f
#define BUTTON_BOTTOM_Y popBoard.position.y - 4 - restartButton.contentSize.height*0.5f
#define BUTTON_OPTION_X popOption.position.x - musicButton.contentSize.width*0.5f
#define BUTTON_OPTION_EXIT_X popOption.position.x
#define BUTTON_OPTION_UPPER_Y popOption.position.y + 49
#define BUTTON_OPTION_MIDDLE_Y popOption.position.y + 6
#define BUTTON_OPTION_BOTTOM_Y popOption.position.y - 38
#define BUTTON_OPTION_EXIT_Y popOption.position.y - 67

#define BOARD_DEST_Y self.position.y
#define GEAR_LEFT_DEST_Y self.contentSize.height - 2
#define GEAR_RIGHT_DEST_Y self.contentSize.height - gearRight.contentSize.height*0.5f

#define BOARD_START_Y (- popBoard.contentSize.height*0.5f - 11)
#define OPTION_START_Y (- popOption.contentSize.height*0.5f - 11)
#define GEAR_LEFT_START_Y (- gearLeft.contentSize.height*0.5f - 53)
#define GEAR_RIGHT_START_Y (- gearRight.contentSize.height*0.5f - 59)

#define MOVE_FIRST_Y 30
#define MOVE_SECOND_Y 15

#define ROTATION_GEAR_LEFT 5
#define ROTATION_GEAR_CENTER 8
#define ROTATION_GEAR_RIGHT 9

#define CHAIN_PILE 5

@implementation GamePauseMenuLayerSprite

@synthesize resumeButton, restartButton, optionButton, exitButton;
@synthesize musicButton, soundButton, vibButton, optionExit;

- (id)initWithGameLayer:(CCLayer *)layer {
    if ((self = [super init])) {
        gameLayer = layer;
        //[self setScale:0.5f];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];
    }
    return self;
}

- (void)create {
    backFilter = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_bg.png"];
    [backFilter setPosition:self.position];
    [self addChild:backFilter z:0];
    [backFilter release];
    
    popBoard = [[CCSprite alloc] initWithSpriteFrameName:@"pop_stop_bg.png"];
    [popBoard setPosition:CGPointMake(BOARD_X, BOARD_START_Y)];
    [self addChild:popBoard z:5];
    [popBoard release];
    
    popOption = [[CCSprite alloc] initWithSpriteFrameName:@"pop_option_bg.png"];
    [popOption setPosition:CGPointMake(BOARD_X, OPTION_START_Y)];
    [self addChild:popOption z:5];
    [popOption release];
    
    // gear
    gearLeft = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_gear_03.png"];
    [gearLeft setPosition:CGPointMake(GEAR_LEFT_X, GEAR_LEFT_START_Y)];
    [self addChild:gearLeft z:2];
    [gearLeft release];
    
    gearCenter = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_gear_01.png"];
    [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
    [self addChild:gearCenter z:2];
    [gearCenter release];
    
    gearRight = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_gear_02.png"];
    [gearRight setPosition:CGPointMake(GEAR_RIGHT_X, GEAR_RIGHT_START_Y)];
    [self addChild:gearRight z:2];
    [gearRight release];

    gearOption = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_gear_01.png"];
    [gearOption setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
    [self addChild:gearOption z:2];
    [gearOption release];

    // anchor
    anchorLeft = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_arrow_01.png"];
    [anchorLeft setPosition:CGPointMake(GEAR_LEFT_X,
                                        ANCHOR_LEFT_Y)];
    [self addChild:anchorLeft z:3];
    [anchorLeft release];
    
    anchorRight = [[CCSprite alloc] initWithSpriteFrameName:@"pop_common_arrow_02.png"];
    [anchorRight setPosition:CGPointMake(GEAR_RIGHT_X,
                                         ANCHOR_RIGHT_Y)];
    [self addChild:anchorRight z:3];
    [anchorRight release];

    // chain
    NSInteger chainCount1 = 6;
    NSInteger chainCount2 = 3;
    chainLeft1 = [[CCSprite alloc] init];
    [chainLeft1 setContentSize:CGSizeMake(10, (147-CHAIN_PILE)*chainCount1)];
    [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X, CHAIN_LEFT1_Y)];
    [self addChild:chainLeft1 z:1];
    [chainLeft1 release];
    
    for (int i=1; i<=chainCount1; i++) {
        CCSprite *chain = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_chain.png"];
        [chain setPosition:CGPointMake(chainLeft1.contentSize.width*0.5f,
                                       chainLeft1.contentSize.height
                                       - chain.contentSize.height*0.5f
                                       - ((chain.contentSize.height-CHAIN_PILE)*(i-1)))];
        [chainLeft1 addChild:chain z:0 tag:i];
        [chain release];
    }
    
    chainLeft2 = [[CCSprite alloc] init];
    [chainLeft2 setContentSize:CGSizeMake(10, (147-CHAIN_PILE)*chainCount2)];
    [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X, CHAIN_LEFT2_Y)];
    [self addChild:chainLeft2 z:1];
    [chainLeft2 release];

    for (int i=1; i<=chainCount2; i++) {
        CCSprite *chain = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_chain.png"];
        [chain setPosition:CGPointMake(chainLeft2.contentSize.width*0.5f,
                                       chainLeft2.contentSize.height
                                       - chain.contentSize.height*0.5f
                                       - ((chain.contentSize.height-CHAIN_PILE)*(i-1)))];
        [chainLeft2 addChild:chain z:0 tag:i];
        [chain release];
    }

    chainRight1 = [[CCSprite alloc] init];
    [chainRight1 setContentSize:CGSizeMake(10, (147-CHAIN_PILE)*chainCount1)];
    [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X, CHAIN_RIGHT1_Y)];
    [self addChild:chainRight1 z:1];
    [chainRight1 release];
    
    for (int i=1; i<=chainCount1; i++) {
        CCSprite *chain = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_chain.png"];
        [chain setPosition:CGPointMake(chainRight1.contentSize.width*0.5f,
                                       chainRight1.contentSize.height
                                       - chain.contentSize.height*0.5f
                                       - ((chain.contentSize.height-CHAIN_PILE)*(i-1)))];
        [chainRight1 addChild:chain z:0 tag:i];
        [chain release];
    }
    
    chainRight2 = [[CCSprite alloc] init];
    [chainRight2 setContentSize:CGSizeMake(10, (147-CHAIN_PILE)*chainCount1)];
    [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X, CHAIN_RIGHT2_Y)];
    [self addChild:chainRight2 z:2];
    [chainRight2 release];
    
    for (int i=1; i<=chainCount1; i++) {
        CCSprite *chain = [[CCSprite alloc] initWithSpriteFrameName:@"UI_common_chain.png"];
        [chain setPosition:CGPointMake(chainRight2.contentSize.width*0.5f,
                                       chainRight2.contentSize.height
                                       - chain.contentSize.height*0.5f
                                       - ((chain.contentSize.height-CHAIN_PILE)*(i-1)))];
        [chainRight2 addChild:chain z:0 tag:i];
        [chain release];
    }
    
    // buttons
    resumeButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_stop_btn_resume.png"];
    [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X,
                                          BUTTON_UPPER_Y)];
    [self addChild:resumeButton z:6];
    [resumeButton release];
    
    restartButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_stop_btn_restart.png"];
    [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X,
                                           BUTTON_UPPER_Y)];
    [self addChild:restartButton z:6];
    [restartButton release];
    
    exitButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_stop_btn_exit.png"];
    [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X,
                                        BUTTON_BOTTOM_Y)];
    [self addChild:exitButton z:6];
    [exitButton release];
    
    optionButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_stop_btn_option.png"];
    [optionButton setPosition:CGPointMake(BUTTON_LEFT_X,
                                          BUTTON_BOTTOM_Y)];
    [self addChild:optionButton z:6];
    [optionButton release];
    
    // option
    musicButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_option_btn_music.png"];
    [musicButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_UPPER_Y)];
    [self addChild:musicButton z:6];
    [musicButton release];
    
    soundButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_option_btn_sound.png"];
    [soundButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_MIDDLE_Y)];
    [self addChild:soundButton z:6];
    [soundButton release];
    
    vibButton = [[CCSprite alloc] initWithSpriteFrameName:@"pop_option_btn_vib.png"];
    [vibButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_BOTTOM_Y)];
    [self addChild:vibButton z:6];
    [vibButton release];
    
    optionExit = [[CCSprite alloc] initWithSpriteFrameName:@"pop_option_reset.png"];
    [optionExit setPosition:CGPointMake(BUTTON_OPTION_EXIT_X, BUTTON_OPTION_EXIT_Y)];
    [self addChild:optionExit z:6];
    [optionExit release];
}

- (void)show {
    [self setVisible:YES];

    animateState = 0;
    
    isChainSet = NO;
    
    [gameLayer setIsTouchEnabled:NO];
    
    [self schedule:@selector(showSchedule)];
}

- (void)hide {
    animateState = 0;
    
    [gameLayer setIsTouchEnabled:NO];
    
    isChainSet = NO;
    
    [self schedule:@selector(hideSchedule)];
}

- (void)showOption {
    animateState = 0;
    
    [gameLayer setIsTouchEnabled:NO];
    
    [self schedule:@selector(showOptionSchedule)];
}

- (void)hideOption {
    animateState = 0;
    
    [gameLayer setIsTouchEnabled:NO];
    
    [self schedule:@selector(hideOptionSchedule)];
}

- (void)showSchedule {
    switch (animateState) {
        case 0:{
            if (!isChainSet) {
                for (int i=1; i<=3; i++) {
                    CCSprite *chainLeft = (CCSprite *)[chainLeft1 getChildByTag:i];
                    CCSprite *chainRight = (CCSprite *)[chainRight1 getChildByTag:i];
                    [chainLeft setVisible:NO];
                    [chainRight setVisible:NO];
                }
                isChainSet = YES;
            }
            if ((gearLeft.position.y < GEAR_LEFT_DEST_Y)
                && (gearRight.position.y < GEAR_RIGHT_DEST_Y)) {
                [gearLeft setPosition:CGPointMake(GEAR_LEFT_X,
                                                  gearLeft.position.y
                                                  + MOVE_FIRST_Y)];
                [gearRight setPosition:CGPointMake(GEAR_RIGHT_X,
                                                   gearRight.position.y
                                                   + MOVE_FIRST_Y)];
                [anchorLeft setPosition:CGPointMake(GEAR_LEFT_X, ANCHOR_LEFT_Y)];
                [anchorRight setPosition:CGPointMake(GEAR_RIGHT_X, ANCHOR_RIGHT_Y)];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X, CHAIN_LEFT1_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X, CHAIN_LEFT2_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X, CHAIN_RIGHT1_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X, CHAIN_RIGHT2_Y)];
            } else {
                [gearLeft setPosition:CGPointMake(GEAR_LEFT_X, GEAR_LEFT_DEST_Y)];
                [gearRight setPosition:CGPointMake(GEAR_RIGHT_X, GEAR_RIGHT_DEST_Y)];
                [anchorLeft setPosition:CGPointMake(GEAR_LEFT_X, ANCHOR_LEFT_Y)];
                [anchorRight setPosition:CGPointMake(GEAR_RIGHT_X, ANCHOR_RIGHT_Y)];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X, CHAIN_LEFT1_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X, CHAIN_LEFT2_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X, CHAIN_RIGHT1_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X, CHAIN_RIGHT2_Y)];
                
                animateState = 1;
                
                isChainSet = NO;
            }
            break;
        }
        case 1:{
            if (!isChainSet) {
                for (int i=1; i<=3; i++) {
                    CCSprite *chainLeft = (CCSprite *)[chainLeft1 getChildByTag:i];
                    CCSprite *chainRight = (CCSprite *)[chainRight1 getChildByTag:i];
                    [chainLeft setVisible:YES];
                    [chainRight setVisible:YES];
                }
                isChainSet = YES;
            }
            if (popBoard.position.y < BOARD_DEST_Y) {
                [popBoard setPosition:CGPointMake(BOARD_X,
                                                  popBoard.position.y
                                                  + MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation - ROTATION_GEAR_LEFT];
                [gearCenter setRotation:gearCenter.rotation + ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation - ROTATION_GEAR_RIGHT];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    - MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    + MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     - MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     + MOVE_SECOND_Y)];
                
                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y < popBoard.position.y && chain.visible) {
                        [chain setVisible:NO];
                    }
                }
                
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
            } else {
                [popBoard setPosition:CGPointMake(BOARD_X, BOARD_DEST_Y)];
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
                
                animateState = 2;
            }
            break;
        }
        case 2:{
            [self unschedule:@selector(showSchedule)];
            [gameLayer setIsTouchEnabled:YES];
            break;
        }
    }
}
- (void)hideSchedule {
    switch (animateState) {
        case 0:{
            if (popBoard.position.y > BOARD_START_Y) {
                [popBoard setPosition:CGPointMake(BOARD_X,
                                                  popBoard.position.y
                                                  - MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation + ROTATION_GEAR_LEFT];
                [gearCenter setRotation:gearCenter.rotation - ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation + ROTATION_GEAR_RIGHT];

                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    + MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    - MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     + MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     - MOVE_SECOND_Y)];

                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y > popBoard.position.y && !chain.visible) {
                        [chain setVisible:YES];
                    }
                }

                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
            } else {
                [popBoard setPosition:CGPointMake(BOARD_X, BOARD_START_Y)];
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
                
                animateState = 1;
            }
            break;
        }
        case 1:{
            if (!isChainSet) {
                for (int i=1; i<=3; i++) {
                    CCSprite *chainLeft = (CCSprite *)[chainLeft1 getChildByTag:i];
                    CCSprite *chainRight = (CCSprite *)[chainRight1 getChildByTag:i];
                    [chainLeft setVisible:NO];
                    [chainRight setVisible:NO];
                }
                isChainSet = YES;
            }

            if ((gearLeft.position.y > GEAR_LEFT_START_Y)
                && (gearRight.position.y > GEAR_RIGHT_START_Y)) {
                [gearLeft setPosition:CGPointMake(GEAR_LEFT_X,
                                                  gearLeft.position.y
                                                  - MOVE_FIRST_Y)];
                [gearRight setPosition:CGPointMake(GEAR_RIGHT_X,
                                                   gearRight.position.y
                                                   - MOVE_FIRST_Y)];
                [anchorLeft setPosition:CGPointMake(GEAR_LEFT_X, ANCHOR_LEFT_Y)];
                [anchorRight setPosition:CGPointMake(GEAR_RIGHT_X, ANCHOR_RIGHT_Y)];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X, CHAIN_LEFT1_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X, CHAIN_LEFT2_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X, CHAIN_RIGHT1_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X, CHAIN_RIGHT2_Y)];
            } else {
                [gearLeft setPosition:CGPointMake(GEAR_LEFT_X, GEAR_LEFT_START_Y)];
                [gearRight setPosition:CGPointMake(GEAR_RIGHT_X, GEAR_RIGHT_START_Y)];
                [anchorLeft setPosition:CGPointMake(GEAR_LEFT_X, ANCHOR_LEFT_Y)];
                [anchorRight setPosition:CGPointMake(GEAR_RIGHT_X, ANCHOR_RIGHT_Y)];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X, CHAIN_LEFT1_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X, CHAIN_LEFT2_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X, CHAIN_RIGHT1_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X, CHAIN_RIGHT2_Y)];
                
                animateState = 2;
            }
            break;
        }
        case 2:{
            [self unschedule:@selector(hideSchedule)];
            
            [self setVisible:NO];
            [gameLayer setIsTouchEnabled:YES];
            
            break;
        }
    }
}
- (void)showOptionSchedule {
    switch (animateState) {
        case 0:{
            if (popBoard.position.y > BOARD_START_Y) {
                [popBoard setPosition:CGPointMake(BOARD_X,
                                                  popBoard.position.y
                                                  - MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation + ROTATION_GEAR_LEFT];
                [gearCenter setRotation:gearCenter.rotation - ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation + ROTATION_GEAR_RIGHT];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    + MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    - MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     + MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     - MOVE_SECOND_Y)];
                
                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y > popBoard.position.y && !chain.visible) {
                        [chain setVisible:YES];
                    }
                }
                
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
            } else {
                [popBoard setPosition:CGPointMake(BOARD_X, BOARD_START_Y)];
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
                
                animateState = 1;
            }
            break;
        }
        case 1:{
            if (popOption.position.y < BOARD_DEST_Y) {
                [popOption setPosition:CGPointMake(BOARD_X,
                                                  popOption.position.y
                                                  + MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation - ROTATION_GEAR_LEFT];
                [gearOption setRotation:gearOption.rotation + ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation - ROTATION_GEAR_RIGHT];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    - MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    + MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     - MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     + MOVE_SECOND_Y)];
                
                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y < popBoard.position.y && chain.visible) {
                        [chain setVisible:NO];
                    }
                }
                
                [gearOption setPosition:CGPointMake(GEAR_CENTER_X, GEAR_OPTION_Y)];
                
                [musicButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_UPPER_Y)];
                [soundButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_MIDDLE_Y)];
                [vibButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_BOTTOM_Y)];
                [optionExit setPosition:CGPointMake(BUTTON_OPTION_EXIT_X, BUTTON_OPTION_EXIT_Y)];
            } else {
                [popOption setPosition:CGPointMake(BOARD_X, BOARD_DEST_Y)];
                [gearOption setPosition:CGPointMake(GEAR_CENTER_X, GEAR_OPTION_Y)];
                
                [musicButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_UPPER_Y)];
                [soundButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_MIDDLE_Y)];
                [vibButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_BOTTOM_Y)];
                [optionExit setPosition:CGPointMake(BUTTON_OPTION_EXIT_X, BUTTON_OPTION_EXIT_Y)];
                
                animateState = 2;
            }
            break;
        }
        case 2:{
            [self unschedule:@selector(showOptionSchedule)];
            
            [gameLayer setIsTouchEnabled:YES];
            
            break;
        }
    }
}
- (void)hideOptionSchedule {
    
    switch (animateState) {
        case 0:{
            if (popOption.position.y > OPTION_START_Y) {
                [popOption setPosition:CGPointMake(BOARD_X,
                                                   popOption.position.y
                                                   - MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation + ROTATION_GEAR_LEFT];
                [gearOption setRotation:gearOption.rotation - ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation + ROTATION_GEAR_RIGHT];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    + MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    - MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     + MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     - MOVE_SECOND_Y)];
                
                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y > popOption.position.y && !chain.visible) {
                        [chain setVisible:YES];
                    }
                }
                
                [gearOption setPosition:CGPointMake(GEAR_CENTER_X, GEAR_OPTION_Y)];
                
                [musicButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_UPPER_Y)];
                [soundButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_MIDDLE_Y)];
                [vibButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_BOTTOM_Y)];
                [optionExit setPosition:CGPointMake(BUTTON_OPTION_EXIT_X, BUTTON_OPTION_EXIT_Y)];
            } else {
                [popOption setPosition:CGPointMake(BOARD_X, OPTION_START_Y)];
                [gearOption setPosition:CGPointMake(GEAR_CENTER_X, GEAR_OPTION_Y)];
                
                [musicButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_UPPER_Y)];
                [soundButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_MIDDLE_Y)];
                [vibButton setPosition:CGPointMake(BUTTON_OPTION_X, BUTTON_OPTION_BOTTOM_Y)];
                [optionExit setPosition:CGPointMake(BUTTON_OPTION_EXIT_X, BUTTON_OPTION_EXIT_Y)];
                
                animateState = 1;
            }
            break;
        }
        case 1:{
            if (popBoard.position.y < BOARD_DEST_Y) {
                [popBoard setPosition:CGPointMake(BOARD_X,
                                                  popBoard.position.y
                                                  + MOVE_SECOND_Y)];
                [gearLeft setRotation:gearLeft.rotation - ROTATION_GEAR_LEFT];
                [gearCenter setRotation:gearCenter.rotation + ROTATION_GEAR_CENTER];
                [gearRight setRotation:gearRight.rotation - ROTATION_GEAR_RIGHT];
                
                [chainLeft1 setPosition:CGPointMake(CHAIN_LEFT1_X,
                                                    chainLeft1.position.y
                                                    - MOVE_SECOND_Y)];
                [chainLeft2 setPosition:CGPointMake(CHAIN_LEFT2_X,
                                                    chainLeft2.position.y
                                                    + MOVE_SECOND_Y)];
                [chainRight1 setPosition:CGPointMake(CHAIN_RIGHT1_X,
                                                     chainRight1.position.y
                                                     - MOVE_SECOND_Y)];
                [chainRight2 setPosition:CGPointMake(CHAIN_RIGHT2_X,
                                                     chainRight2.position.y
                                                     + MOVE_SECOND_Y)];
                
                for (int i=1; i<=6; i++) {
                    CCSprite *chain = (CCSprite *)[chainRight1 getChildByTag:i];
                    CGPoint chainAbPoint = [GameUtils convertToWorldPosition:chain];
                    if (chainAbPoint.y < popBoard.position.y && chain.visible) {
                        [chain setVisible:NO];
                    }
                }
                
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
            } else {
                [popBoard setPosition:CGPointMake(BOARD_X, BOARD_DEST_Y)];
                [gearCenter setPosition:CGPointMake(GEAR_CENTER_X, GEAR_CENTER_Y)];
                
                [resumeButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_UPPER_Y)];
                [restartButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_UPPER_Y)];
                [exitButton setPosition:CGPointMake(BUTTON_RIGHT_X, BUTTON_BOTTOM_Y)];
                [optionButton setPosition:CGPointMake(BUTTON_LEFT_X, BUTTON_BOTTOM_Y)];
                
                animateState = 2;
            }
            break;
        }
        case 2:{
            [self unschedule:@selector(hideOptionSchedule)];
            
            [gameLayer setIsTouchEnabled:YES];
            
            break;
        }
    }
}

@end
