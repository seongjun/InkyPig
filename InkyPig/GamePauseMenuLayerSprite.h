//
//  GamePauseMenuLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 9..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@interface GamePauseMenuLayerSprite : CCSprite <LayerSprite> {
    CCLayer *gameLayer;
    
    NSInteger animateState;
    
    BOOL isChainSet;
    
    CCSprite *backFilter;
    CCSprite *popBoard, *popOption;
    CCSprite *chainLeft1, *chainLeft2, *chainRight1, *chainRight2;
    CCSprite *gearLeft, *gearCenter, *gearRight, *gearOption;
    CCSprite *anchorLeft, *anchorRight;
    CCSprite *resumeButton, *restartButton, *optionButton, *exitButton;
    CCSprite *musicButton, *soundButton, *vibButton, *optionExit;
}

@property (nonatomic, readonly) CCSprite *resumeButton, *restartButton, *optionButton, *exitButton;
@property (nonatomic, readonly) CCSprite *musicButton, *soundButton, *vibButton, *optionExit;

- (id)initWithGameLayer:(CCLayer*)layer;

- (void)showOption;
- (void)hideOption;

- (void)showSchedule;
- (void)hideSchedule;
- (void)showOptionSchedule;
- (void)hideOptionSchedule;

@end
