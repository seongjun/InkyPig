//
//  GameLayer.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 7..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    GameState_Start,
    GameState_WaveReady,
    GameState_WaveStart,
    GameState_WaveDone,
    GameState_End
}GameState;

@class GameData;
@class MapData;
@class WaveData;

@class GameHUDLayer;
@class CharacterSprite;

@class Tower_Character;

@interface GameLayer : CCLayer {
    GameHUDLayer *hud;

    GameData *gameData;
    MapData *mapData;
    WaveData *waveData;
    
    GameState gameState;
    BOOL isRunCreateEnemy, isCreateDone;
    NSInteger currentWave;
    CGFloat waveTime;
    
    // hero
    CGPoint shootPoint;
    Tower_Character *tower;
    
    // weapon and skill
    BOOL isFirstShoot;
    NSDate *lastShootTime;
    
    // background
    CCSprite *bg_obj, *bg_root, *back_front, *back_mid, *back_back;
    
    CCSprite *crashZoneSprite;
    
    CCSpriteBatchNode *heroBatchNode;
    CCSpriteBatchNode *enemyAirBatchNode, *enemyLandBatchNode;
    
    CGSize screenSize;
    
    // screen move
    CGPoint preLocation;
    BOOL isScroll;
}

@property (nonatomic, retain) GameData *gameData;
@property (nonatomic, retain) GameHUDLayer *hud;
@property (nonatomic, retain) MapData *mapData;

@property (nonatomic, readonly) Tower_Character *tower;
@property (nonatomic, retain) NSDate *lastShootTime;
@property (nonatomic, retain) CCSprite *crashZoneSprite;
@property (nonatomic, retain) CCSpriteBatchNode *heroBatchNode, *enemyAirBatchNode, *enemyLandBatchNode;
@property (nonatomic, readonly) CGPoint shootPoint;

+ (CCScene *)scene;

#pragma mark create
- (void)createBackGround;
- (void)createBgObj;
- (void)createBgRoot;
- (void)createBackFront;
- (void)createBackMid;
- (void)createBackBack;

- (void)createTower;

#pragma mark Schedule
- (void)gameSchedule;
- (void)createEnemySchedule:(ccTime)dt;

#pragma mark Scene
- (void)moveBackGround:(CGPoint)location;

#pragma mark weapon and skill
- (void)shootVulcan:(CGPoint)target;
- (void)shootMissile:(CGPoint)target;
- (void)shootLaser:(CGPoint)target;
- (void)addVulcanBulletWithAngle:(CGFloat)angle;
- (void)addMissileBulletWithTaget:(CGPoint)target;
- (void)addLaserBulletWithAngle:(CGFloat)angle;
- (void)addMissileSmoke:(CGPoint)smokePosition;

#pragma mark PlayTool


#pragma mark GameData
- (void)loadGameData;

@end
