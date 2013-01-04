//
//  EnemyData.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "EnemyData.h"

@implementation EnemyData

@synthesize typeEnemy;
@synthesize enemyLevel;
@synthesize enemyNumber, enemyCount;
@synthesize currentCount;
@synthesize createStartTime, createDelayTime;
@synthesize currentTime;

- (id)initWithType:(TypeEnemy)eType
        enemyLevel:(NSInteger)level
       enemyNumber:(NSInteger)number
       enemeyCount:(NSInteger)count
   createDelayTime:(CGFloat)delay
   createStartTime:(CGFloat)start {
    if ((self = [super init])) {
        typeEnemy = eType;
        enemyLevel = level;
        enemyNumber = number;
        enemyCount = count;
        currentCount = 0;
        createDelayTime = delay;
        createStartTime = start;
        currentTime = 0;
    }
    
    return self;
}

@end
