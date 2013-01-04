//
//  WaveData.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "WaveData.h"
#import "EnemyData.h"

@implementation WaveData

@synthesize wavesArray;

- (id)initWithStage:(NSInteger)stage difficulty:(NSInteger)difficulty {
    if ((self = [super init])) {
        NSInteger defaultLevel = 1;
        if (difficulty == 2) {
            defaultLevel += 5;
        }
        switch (stage) {
            case 1:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:3
                                                         createDelayTime:1.0f
                                                         createStartTime:0.0f],
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:5
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave3 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave4 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              wave3,
                              wave4,
                              nil];
                break;
            }
            case 2:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 3:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 4:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 5:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 6:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 7:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 8:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 9:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 10:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 11:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 12:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 13:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 14:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 15:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 16:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 17:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 18:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 19:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 20:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 21:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 22:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 23:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 24:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 25:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 26:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 27:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 28:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 29:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
            case 30:{
                NSMutableArray *wave1 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                NSMutableArray *wave2 = [[NSMutableArray alloc] initWithObjects:
                                         [[EnemyData alloc] initWithType:TypeEnemy_Land
                                                              enemyLevel:defaultLevel
                                                             enemyNumber:1
                                                             enemeyCount:1
                                                         createDelayTime:1.0f
                                                         createStartTime:1.0f],
                                         nil];
                wavesArray = [[NSMutableArray alloc] initWithObjects:
                              wave1,
                              wave2,
                              nil];
                break;
            }
        }
    }
    
    return self;
}

@end
