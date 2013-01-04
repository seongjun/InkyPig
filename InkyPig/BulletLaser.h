//
//  BulletLaser.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 14..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "BulletSprite.h"

@class GameLayer;
@class GameData;
@class Weapon;
@class CharacterSprite;

@interface BulletLaser : BulletSprite {
    GameLayer *gameLayer;
    Weapon *weapon;
    double distanceX, distanceY;
    double angle;
    CGPoint startPoint;
}

@property (nonatomic, retain) Weapon *weapon;

- (id)initWithGameLayer:(GameLayer *)layer angle:(double)ag;

- (void)createCrashZone;
- (void)removeSelf;
- (void)hitEnemy:(CharacterSprite *)enemy damage:(CGFloat)damage;
- (CGFloat)getDamageAir;
- (CGFloat)getDamageLand;

- (void)moveSchedule:(ccTime)dt;

@end
