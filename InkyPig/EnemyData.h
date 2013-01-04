//
//  EnemyData.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefine.h"

@interface EnemyData : NSObject {
    TypeEnemy typeEnemy;
    NSInteger enemyLevel;
    NSInteger enemyNumber, enemyCount;
    NSInteger currentCount;
    CGFloat createStartTime, createDelayTime;
    CGFloat currentTime;
}

@property (nonatomic, readonly) TypeEnemy typeEnemy;
@property (nonatomic, readonly) NSInteger enemyLevel;
@property (nonatomic, readonly) NSInteger enemyNumber, enemyCount;
@property (nonatomic, readwrite) NSInteger currentCount;
@property (nonatomic, readonly) CGFloat createStartTime, createDelayTime;
@property (nonatomic, readwrite) CGFloat currentTime;

- (id)initWithType:(TypeEnemy)eType
        enemyLevel:(NSInteger)level
       enemyNumber:(NSInteger)number
       enemeyCount:(NSInteger)count
   createDelayTime:(CGFloat)delay
   createStartTime:(CGFloat)start;

@end
