//
//  CharacterSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 24..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameDefine.h"

typedef enum {
    Direction_Left,
    Direction_Right,
    Direction_Up,
    Direction_Down
}Direction;

typedef enum {
    CrashType_Rect,
    CrashType_Circle
}CrashType;

typedef enum {
    AttackType_Melee,
    AttackType_Range
}AttackType;

@interface CharacterSprite : CCSprite {
    Direction moveDirection;
    CCNode *crashZones;
    
    AttackType attackType;

    NSInteger hp;
    NSInteger mp;
    NSInteger level;
    CGFloat attackDamage;
    CGFloat moveSpeed;
    CGFloat range;
    
    CGPoint attackPoint;
    CGPoint recentlyPoint;
    
    StateEnemy stateEnemy;
}

@property (nonatomic, readwrite) Direction moveDirection;
@property (nonatomic, retain) CCNode *crashZones;

@property (nonatomic, readwrite) AttackType attackType;

@property (nonatomic, readwrite) NSInteger hp;
@property (nonatomic, readwrite) NSInteger mp;
@property (nonatomic, readwrite) NSInteger level;
@property (nonatomic, readwrite) CGFloat attackDamage;
@property (nonatomic, readwrite) CGFloat moveSpeed;
@property (nonatomic, readwrite) CGFloat range;

@property (nonatomic, readwrite) CGPoint attackPoint;
@property (nonatomic, readwrite) CGPoint recentlyPoint;

@property (nonatomic, readwrite) StateEnemy stateEnemy;

@end
