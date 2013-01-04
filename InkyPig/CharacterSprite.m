//
//  CharacterSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 24..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "CharacterSprite.h"


@implementation CharacterSprite

@synthesize moveDirection, crashZones;
@synthesize attackType;
@synthesize hp, mp, level, attackDamage, moveSpeed, range;
@synthesize attackPoint, recentlyPoint;

@synthesize stateEnemy;

- (id)init {
    if ((self = [super init])) {
        [self setMoveDirection:Direction_Left];
        crashZones = [[CCNode alloc] init];
        [crashZones setAnchorPoint:ccp(0.5f, 0.5f)];
        
        [self setAttackType:AttackType_Melee];
        
        [self setHp:0];
        [self setMp:0];
        [self setLevel:1];
        [self setAttackDamage:0];
        [self setMoveSpeed:0];
        [self setRange:0];
        
        [self setAttackPoint:CGPointZero];
        [self setRecentlyPoint:CGPointZero];
    }
    
    return self;
}

- (void)dealloc {
    [crashZones release];
    
    [super dealloc];
}

@end
