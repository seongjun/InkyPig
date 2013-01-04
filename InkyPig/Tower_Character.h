//
//  Tower_Character.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 3..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterSprite.h"

@class GameLayer;
@class LaserBoom;

@interface Tower_Character : CharacterSprite {
    GameLayer *gameLayer;
    
    CGPoint pipe1Position, pipe2Position;
    CGFloat pipe1Delay, pipe2Delay;
    
    CGPoint weaponStandPosition;
    CCSprite *weaponStand;
    CCSprite *weaponAnchor;
    CCSprite *vulcan;
    CCSprite *missile;
    CCSprite *laser;
    LaserBoom *laserBoom;
    
    NSInteger currentWeapon;
    CCAnimate *vulcanAnimate, *laserAnimate;
    CGFloat targetAngle;
    CGPoint targetPoint;
    
    BOOL isChangeWeapon;
}

@property (nonatomic, readonly) CCSprite *weaponStand;
@property (nonatomic, readonly) BOOL isChangeWeapon;
@property (nonatomic, readonly) LaserBoom *laserBoom;

- (id)initWithGameLayer:(GameLayer*)layer withLevel:(NSInteger)lv withTag:(NSInteger)tag;

- (void)createVulcanAnimate;
- (void)createLaserAnimate;

#pragma mark gears
- (void)gearsActionNomalIsClock:(BOOL)isClock;
- (void)gearsActionHighIsClock:(BOOL)isClock;

- (void)gearsActionStop;

- (void)gearsActionNomalClockSchedule:(ccTime)dt;
- (void)gearsActionNomalUnclockSchedule:(ccTime)dt;
- (void)gearsActionHighClockSchedule:(ccTime)dt;
- (void)gearsActionhighUnclockSchedule:(ccTime)dt;

#pragma mark pipe
- (void)pipeMove;
- (void)pipe1MoveUpSchedule:(ccTime)dt;
- (void)pipe1MoveDownSchedule:(ccTime)dt;
- (void)pipe2MoveUpSchedule:(ccTime)dt;
- (void)pipe2MoveDownSchedule:(ccTime)dt;

#pragma mark weapon angle
- (void)changeWeaponAngle:(CGFloat)angle;
- (void)changeWeaponAngle:(CGFloat)angle target:(CGPoint)target;
- (void)changeWeaponAngleIsClock:(BOOL)isClock;

- (void)changeWeaponAngleStop;

- (void)changeWeaponAngleClockSchedule:(ccTime)dt;
- (void)changeWeaponAngleUnclockSchedule:(ccTime)dt;

- (void)shootVulcan;
- (void)shootMissile;
- (void)shootLaser;

#pragma mark change weapon
- (void)weaponAngleZero;
- (void)weaponAngleZeroIsClock:(BOOL)isClock;

- (void)weaponAngleZeroStop;

- (void)weaponAngleZeroClockSchedule:(ccTime)dt;
- (void)weaponAngleZeroUnclockSchedule:(ccTime)dt;

- (void)weaponAnchorHorizon;
- (void)weaponAnchorVertical;
- (void)weaponAnchorIsClock:(BOOL)isClock;

- (void)weaponAnchorStop;

- (void)weaponAnchorClockSchedule:(ccTime)dt;
- (void)weaponAnchorUnclockSchedule:(ccTime)dt;

- (void)weaponStandDown;
- (void)weaponStandUp;

- (void)weaponStandStop;

- (void)weaponStandDownSchedule:(ccTime)dt;
- (void)weaponStandUpSchedule:(ccTime)dt;

- (void)weaponChange;

@end
