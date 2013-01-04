//
//  BulletMissile.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "BulletSprite.h"

@class GameLayer;
@class GameData;
@class Weapon;
@class CharacterSprite;

@interface BulletMissile : BulletSprite {
    GameLayer *gameLayer;
    Weapon *weapon;
    CGPoint target;
    double distanceX, distanceY;
    double angle;

}

@property (nonatomic, retain) Weapon *weapon;

- (id)initWithGameLayer:(GameLayer *)layer angle:(double)ag target:(CGPoint)tg;

- (void)createCrashZone;
- (void)removeSelf;
- (void)hitEnemy:(CharacterSprite *)enemy damage:(CGFloat)damage;
- (CGFloat)getDamageAir;
- (CGFloat)getDamageLand;

- (void)moveSchedule:(ccTime)dt;

@end
