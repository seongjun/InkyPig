//
//  Enemy_Character01.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 24..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "CharacterSprite.h"

@class GameLayer;

@interface Enemy_Character01 : CharacterSprite {
    GameLayer *gameLayer;
    
    
    CCAnimate *walkAnimate;
    CCAnimate *attackReadyAnimate;
    CCAnimate *attackAnimate;
    CCAnimate *attackCompleteAnimate;
    CCAnimate *dieAnimate;
    CCAnimate *hitAnimate;
    CCAnimate *holdAnimate;
    
    CCSprite *miniMap;
    
    NSInteger holdTimes;
}

- (id)initWithGameLayer:(GameLayer*)layer withLevel:(NSInteger)lv;
- (id)initWithGameLayer:(GameLayer *)layer withLevel:(NSInteger)lv withState:(StateEnemy)state;

- (void)createCrashZone;

- (void)createWalkAnimate;
- (void)createAttackReadyAnimate;
- (void)createAttackAnimate;
- (void)createAttackCompleteAnimate;
- (void)createDieAnimate;
- (void)createHitAnimate;
- (void)createHoldAnimate;

- (void)move;
- (void)attackReady;
- (void)attack;
- (void)attackComplete;
- (void)die;
- (void)dieComplete;
- (void)hitWithDamage:(CGFloat)damage;
- (void)hold;

- (void)removeSelf;

- (void)moveSchedule:(ccTime)dt;
- (void)attackSchedule:(ccTime)dt;
- (void)attackCompleteSchedule:(ccTime)dt;

@end
