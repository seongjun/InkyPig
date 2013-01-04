//
//  GameLayer.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 7..
//  Copyright 2012년 Zemico. All rights reserved.
//
#import "MenuLayers.h"
#import "GameLayer.h"
#import "GameHUDLayer.h"
#import "GameData.h"
#import "Weapon.h"
#import "Skill.h"
#import "Tower.h"
#import "MapData.h"
#import "MapBlockData.h"
#import "WaveData.h"
#import "EnemyData.h"
#import "GamePauseMenuLayerSprite.h"

#import "GameDefine.h"
#import "GameUtils.h"

#import "Tower_Character.h"
#import "BulletVulcan.h"
#import "BulletMissile.h"
#import "BulletLaser.h"
#import "Enemy_Character01.h"
#import "Enemy_Character02.h"
#import "Enemy_Character03.h"
#import "Enemy_Character04.h"
#import "Enemy_Character05.h"
#import "Enemy_Character06.h"
#import "Enemy_Character07.h"
#import "Enemy_Character08.h"
#import "Enemy_Character09.h"
#import "Enemy_Character10.h"
#import "Enemy_Character11.h"
#import "Enemy_Character12.h"
#import "Enemy_Character13.h"

#import "MissileSmoke.h"

typedef enum {
    zTagBack_BackBack,
    zTagBack_BackMid,
    zTagBack_BackFront,
    zTagBack_BgRoot,
    zTagBack_Character,
    zTagBack_BgObj,
    zTagBack_CrashZone,
    zTagBack_BgRootCopy
}zTagBack;

@implementation GameLayer

@synthesize gameData, hud, mapData;
@synthesize tower;
@synthesize lastShootTime;
@synthesize crashZoneSprite;
@synthesize heroBatchNode, enemyAirBatchNode, enemyLandBatchNode;
@synthesize shootPoint;

+ (CCScene *)scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
    GameHUDLayer *hudLayer = [[GameHUDLayer alloc] initWithGameLayer:layer];
	layer.hud = hudLayer;
    
	// add layer as a child to scene
	[scene addChild:layer];
	
    // 'HudLayer'
    [scene addChild:hudLayer z:1 tag:1];
    [hudLayer release];
    
	// return the scene
	return scene;
}

- (id)init {
    if ((self = [super init])) {
        [self setIsTouchEnabled:YES];
        screenSize = [[CCDirector sharedDirector] winSize];
        
        [self loadGameData];
        
        mapData = [[MapData alloc] initWithStage:[gameData selectedStage]];
        waveData = [[WaveData alloc] initWithStage:[gameData selectedStage]
                                        difficulty:[gameData selectedDifficult]];

        gameState = GameState_Start;
        currentWave = 0;
        isFirstShoot = NO;
        [self setLastShootTime:[NSDate date]];
                
        preLocation = CGPointZero;
        isScroll = NO;
    }
    
    return self;
}

- (void)dealloc {
    [gameData release];
    [hud release];
    [mapData release];
    [lastShootTime release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    [self createBackGround];
    [self createTower];
    [self schedule:@selector(gameSchedule)];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if (![[hud gamePauseMenuLayerSprite] visible]) {
        [self moveBackGround:location];
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if (![[hud gamePauseMenuLayerSprite] visible]) {
        if ([GameUtils isTouchInside:[hud uiButtonPause] withExpand:5 withPosition:location]) {
            [[hud gamePauseMenuLayerSprite] show];
        }
        // weapon change
        if ([GameUtils isTouchInside:[hud uiButtonCannon] withPosition:location]
            && [[hud coolCannon] percentage] == 0) {
            isFirstShoot = NO;
            [tower weaponChange];
            [hud changeWeapon:1];
            return;
        }
        if ([GameUtils isTouchInside:[hud uiButtonMissile] withPosition:location]
            && [[hud coolMissile] percentage] == 0) {
            isFirstShoot = NO;
            [tower weaponChange];
            [hud changeWeapon:2];
            return;
        }
        if ([GameUtils isTouchInside:[hud uiButtonLaser] withPosition:location]
            && [[hud coolLaser] percentage] == 0) {
            isFirstShoot = NO;
            [tower weaponChange];
            [hud changeWeapon:3];
            return;
        }

        if (!isScroll && !tower.isChangeWeapon) {
            switch ([hud currentWeapon]) {
                case 1:{
                    if (!isFirstShoot
                        || ABS([lastShootTime timeIntervalSinceDate:[NSDate date]]) >= [[gameData vulcan] delayTime]) {
                        if (!isFirstShoot) {
                            isFirstShoot = YES;
                        }
                        [self setLastShootTime:[NSDate date]];
                        [self shootVulcan:CGPointMake(location.x - self.position.x,
                                                      location.y)];
                    }
                    break;
                }
                case 2:{
                    if (!isFirstShoot
                        || ABS([lastShootTime timeIntervalSinceDate:[NSDate date]]) >= [[gameData missile] delayTime]) {
                        if (!isFirstShoot) {
                            isFirstShoot = YES;
                        }
                        [self setLastShootTime:[NSDate date]];
                        [self shootMissile:CGPointMake(location.x - self.position.x,
                                                       location.y)];
                    }
                    break;
                }
                case 3:{
                    if (!isFirstShoot
                        || ABS([lastShootTime timeIntervalSinceDate:[NSDate date]]) >= [[gameData laser] delayTime]) {
                        if (!isFirstShoot) {
                            isFirstShoot = YES;
                        }
                        [self setLastShootTime:[NSDate date]];
                        [self shootLaser:CGPointMake(location.x - self.position.x,
                                                     location.y)];
                    }
                    break;
                }
            }
        }
    } else {
        if ([GameUtils isTouchInside:[[hud gamePauseMenuLayerSprite] resumeButton] withPosition:location]) {
            [[hud gamePauseMenuLayerSprite] hide];
        }
        if ([GameUtils isTouchInside:[[hud gamePauseMenuLayerSprite] optionButton] withPosition:location]) {
            [[hud gamePauseMenuLayerSprite] showOption];
        }
        if ([GameUtils isTouchInside:[[hud gamePauseMenuLayerSprite] exitButton] withPosition:location]) {
            [[CCDirector sharedDirector] replaceScene:[MenuLayers scene]];
        }
        if ([GameUtils isTouchInside:[[hud gamePauseMenuLayerSprite] optionExit] withExpand:-2 withPosition:location]) {
            [[hud gamePauseMenuLayerSprite] hideOption];
        }
    }
    preLocation = CGPointZero;
    isScroll = NO;
}

#pragma mark Create
- (void)createBackGround {
    [self createBackBack];
    [self createBackMid];
    [self createBackFront];
    [self createBgRoot];
    [self createBgObj];

    crashZoneSprite = [[CCSprite alloc] init];
    [self addChild:crashZoneSprite z:zTagBack_CrashZone];
    [crashZoneSprite release];
    
    heroBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"Hero.png" capacity:1000];
    [self addChild:heroBatchNode z:zTagBack_Character];
    [heroBatchNode release];
    enemyAirBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"EnemyAir.png" capacity:1000];
    [self addChild:enemyAirBatchNode z:zTagBack_Character];
    [enemyAirBatchNode release];
    enemyLandBatchNode = [[CCSpriteBatchNode alloc] initWithFile:@"EnemyLand.png" capacity:1000];
    [self addChild:enemyLandBatchNode z:zTagBack_Character];
    [enemyLandBatchNode release];
}
- (void)createBgObj {
    NSInteger stage = [gameData selectedStage];
    switch (stage) {
        case 1:
        case 7:
        case 8:
        case 9:
        case 13:{
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            bg_obj = [[CCSprite alloc] initWithFile:@"obj_16-20.png"];
            [bg_obj setPosition:CGPointMake(bg_obj.contentSize.width*0.5f,
                                            screenSize.height - 255 +
                                            bg_obj.contentSize.height*0.5f)];
            [self addChild:bg_obj z:zTagBack_BgObj];
            [bg_obj release];
            break;
        }
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 27:
        case 29:
        case 30:{
            break;
        }
        default:{
            bg_obj = [[CCSprite alloc] initWithFile:
                      [NSString stringWithFormat:
                       @"obj_%d.png", stage]];
            [bg_obj setPosition:CGPointMake(bg_obj.contentSize.width*0.5f,
                                            screenSize.height - 255 +
                                            bg_obj.contentSize.height*0.5f)];
            [self addChild:bg_obj z:zTagBack_BgObj];
            [bg_obj release];
            break;
        }
    }
}
- (void)createBgRoot {
    NSInteger stage = [gameData selectedStage];
    switch (stage) {
        default:{
            bg_root = [[CCSprite alloc] initWithFile:
                      [NSString stringWithFormat:
                       @"r_%d.png", stage]];
            [bg_root setPosition:CGPointMake(bg_root.contentSize.width*0.5f,
                                             screenSize.height - 255 +
                                            bg_root.contentSize.height*0.5f)];
            [self addChild:bg_root z:zTagBack_BgRoot];
            [bg_root release];
            
            /*
            CCSprite *bgRootCopy = [[CCSprite alloc] initWithFile:
                                    [NSString stringWithFormat:@"r_%d.png", stage]];
            [bgRootCopy setOpacity:125];
            [bgRootCopy setPosition:CGPointMake(bg_root.contentSize.width*0.5f,
                                                screenSize.height - 270 +
                                                bg_root.contentSize.height*0.5f)];
            [self addChild:bgRootCopy z:zTagBack_BgRootCopy];
            [bgRootCopy release];
             */
            break;
        }
    }
}
- (void)createBackFront {
    NSInteger stage = [gameData selectedStage];
    switch (stage) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_1-5.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_6-10.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_11-15.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_16-20.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_21-25.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:{
            back_front = [[CCSprite alloc] initWithFile:
                          @"bf_26-30.png"];
            [back_front setPosition:CGPointMake(back_front.contentSize.width*0.5f,
                                                screenSize.height
                                                - back_front.contentSize.height*0.5f)];
            [self addChild:back_front z:zTagBack_BackFront];
            [back_front release];
            break;
        }
    }
}
- (void)createBackMid {
    NSInteger stage = [gameData selectedStage];
    switch (stage) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            back_mid = [[CCSprite alloc] initWithFile:
                          @"bm_1-5.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:{
            back_mid = [[CCSprite alloc] initWithFile:
                        @"bm_6-10.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:{
            back_mid = [[CCSprite alloc] initWithFile:
                        @"bm_11-15.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            back_mid = [[CCSprite alloc] initWithFile:
                        @"bm_16-20.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:{
            back_mid = [[CCSprite alloc] initWithFile:
                        @"bm_21-25.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:{
            back_mid = [[CCSprite alloc] initWithFile:
                        @"bm_26-30.png"];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              screenSize.height
                                              - back_mid.contentSize.height*0.5f)];
            [self addChild:back_mid z:zTagBack_BackFront];
            [back_mid release];
            break;
        }
    }
}
- (void)createBackBack {
    NSInteger stage = [gameData selectedStage];
    switch (stage) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_1-5.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_6-10.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_11-15.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_16-20.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_21-25.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:{
            back_back = [[CCSprite alloc] initWithFile:
                         @"bb_26-30.png"];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               screenSize.height
                                               - back_back.contentSize.height*0.5f)];
            [self addChild:back_back z:zTagBack_BackFront];
            [back_back release];
            break;
        }
    }
}

- (void)createTower {
    tower = [[Tower_Character alloc] initWithGameLayer:self withLevel:1 withTag:1];
    [tower setPosition:CGPointMake(tower.contentSize.width*0.5f,
                                   GAME_FLOOR
                                   + tower.contentSize.height*0.5f)];
    [heroBatchNode addChild:tower z:1 tag:tagGameHero_Tower];
    [tower release];

    shootPoint = [GameUtils convertToWorldPosition:tower.weaponStand];
    shootPoint = CGPointMake(shootPoint.x + 35,
                             shootPoint.y + 21);
}

#pragma mark Schedule
- (void)gameSchedule {
    switch (gameState) {
        case GameState_Start:{
            //HUD 상태 점검
            gameState = GameState_WaveReady;
            
            break;
        }
        case GameState_WaveReady:{
            currentWave++;
            if ([[waveData wavesArray] count] >= currentWave) {
                //wave number display
                gameState = GameState_WaveStart;
                isRunCreateEnemy = NO;
                isCreateDone = NO;
                waveTime = 0;
            } else {
                gameState = GameState_End;
            }
            break;
        }
        case GameState_WaveStart:{
            // 에너지
            if ([hud currentHp] <= 0) {
                gameState = GameState_End;
            }
            if (!isRunCreateEnemy) {
                isRunCreateEnemy = YES;
                [self schedule:@selector(createEnemySchedule:)];
            } else {
                if (isCreateDone) {
                    gameState = GameState_WaveDone;
                }
            }
            break;
        }
        case GameState_WaveDone:{
            if ([[enemyAirBatchNode children] count] == 0
                && [[enemyLandBatchNode children] count] == 0) {
                gameState = GameState_WaveReady;
            }
            break;
        }
        case GameState_End:{
            break;
        }
    }
}
- (void)createEnemySchedule:(ccTime)dt {
    waveTime += dt;
    
    NSMutableArray *wave = [[waveData wavesArray] objectAtIndex:currentWave-1];
    MapBlockData *startPoint = [[mapData mapBlocksArray] objectAtIndex:12];
    
    BOOL isCreatable = NO;
    BOOL isDone = YES;
    for (int i=0; i<wave.count; i++) {
        EnemyData *enemy = (EnemyData *)[wave objectAtIndex:i];
        if ([enemy createStartTime] <= waveTime) {
            if ([enemy currentCount] < [enemy enemyCount]) {
                if (waveTime - enemy.currentTime >= enemy.createDelayTime) {
                    isCreatable = YES;
                }
                /*if ([enemy currentTime] == 0) {
                    isCreatable = YES;
                } else if (waveTime - enemy.currentTime >= enemy.createDelayTime) {
                    isCreatable = YES;
                }*/
            }
        }
        if (isCreatable) {
            [enemy setCurrentTime:waveTime];
            [enemy setCurrentCount:[enemy currentCount]+1];
            switch ([enemy enemyNumber]) {
                case 1:{
                    Enemy_Character01 *enemySprite = [[Enemy_Character01 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                    + enemySprite.contentSize.width*0.5f,
                                                    GAME_FLOOR
                                                    + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 2:{
                    Enemy_Character02 *enemySprite = [[Enemy_Character02 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + 8 * GAME_HEIGHT)];
                    [enemyAirBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 3:{
                    Enemy_Character03 *enemySprite = [[Enemy_Character03 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 4:{
                    Enemy_Character04 *enemySprite = [[Enemy_Character04 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + 8 * GAME_HEIGHT)];
                    [enemyAirBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 5:{
                    Enemy_Character05 *enemySprite = [[Enemy_Character05 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 6:{
                    Enemy_Character06 *enemySprite = [[Enemy_Character06 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 7:{
                    Enemy_Character07 *enemySprite = [[Enemy_Character07 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + 8 * GAME_HEIGHT)];
                    [enemyAirBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 8:{
                    Enemy_Character08 *enemySprite = [[Enemy_Character08 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 9:{
                    Enemy_Character09 *enemySprite = [[Enemy_Character09 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 10:{
                    Enemy_Character10 *enemySprite = [[Enemy_Character10 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 11:{
                    Enemy_Character11 *enemySprite = [[Enemy_Character11 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + 8 * GAME_HEIGHT)];
                    [enemyAirBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 12:{
                    Enemy_Character12 *enemySprite = [[Enemy_Character12 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + startPoint.positionY * GAME_HEIGHT)];
                    [enemyLandBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
                case 13:{
                    Enemy_Character13 *enemySprite = [[Enemy_Character13 alloc] initWithGameLayer:self withLevel:enemy.enemyLevel];
                    [enemySprite setPosition:CGPointMake(screenSize.width*2
                                                         + enemySprite.contentSize.width*0.5f,
                                                         GAME_FLOOR
                                                         + 8 * GAME_HEIGHT)];
                    [enemyAirBatchNode addChild:enemySprite z:0 tag:[enemy enemyNumber]];
                    [enemySprite release];
                    break;
                }
            }
        }
    }
    for (int i=0; i<wave.count; i++) {
        EnemyData *enemy = (EnemyData *)[wave objectAtIndex:i];
        if ([enemy currentCount] < [enemy enemyCount]) {
            isDone = NO;
        }
    }
    
    if (isDone) {
        isCreateDone = YES;
    }
}

#pragma mark Scene
- (void)moveBackGround:(CGPoint)location {
    if (!isScroll) {
        isScroll = YES;
    }
    if (preLocation.x == 0 && preLocation.y == 0) {
        preLocation = location;
    } else {
        CGFloat distance = preLocation.x - location.x;
        [self setPosition:CGPointMake(self.position.x - distance, self.position.y)];
        [back_back setPosition:CGPointMake(back_back.position.x
                                           + (distance*0.5f),
                                           back_back.position.y)];
        [back_mid setPosition:CGPointMake(back_mid.position.x
                                          + (distance*0.25f),
                                          back_mid.position.y)];
        [bg_obj setPosition:CGPointMake(bg_obj.position.x
                                        - (distance*0.1f),
                                        bg_obj.position.y)];
        if (self.position.x <= -screenSize.width) {
            [self setPosition:CGPointMake(-screenSize.width, self.position.y)];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f
                                               + screenSize.width*0.5f,
                                               back_back.position.y)];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f
                                              + screenSize.width*0.25f,
                                              back_mid.position.y)];
            [bg_obj setPosition:CGPointMake(bg_obj.contentSize.width*0.5f
                                            - screenSize.width*0.1f,
                                            bg_obj.position.y)];
        }
        if (self.position.x >= 0) {
            [self setPosition:CGPointMake(0, self.position.y)];
            [back_back setPosition:CGPointMake(back_back.contentSize.width*0.5f,
                                               back_back.position.y)];
            [back_mid setPosition:CGPointMake(back_mid.contentSize.width*0.5f,
                                              back_mid.position.y)];
            [bg_obj setPosition:CGPointMake(bg_obj.contentSize.width*0.5f,
                                            bg_obj.position.y)];
        }
        preLocation = location;
        [hud setMinimapPosition:self.position.x];
    }
}

#pragma mark weapon and skill
- (void)shootVulcan:(CGPoint)target {
    double angle = atan((target.y - shootPoint.y)/(target.x-shootPoint.x));
    
    [tower changeWeaponAngle:angle];
}
- (void)shootMissile:(CGPoint)target {
    double angle = atan((target.y - shootPoint.y)/(target.x-shootPoint.x));
    
    [tower changeWeaponAngle:angle target:target];
}
- (void)shootLaser:(CGPoint)target {
    double angle = atan((target.y - shootPoint.y)/(target.x-shootPoint.x));
    
    [tower changeWeaponAngle:angle];
}
- (void)addVulcanBulletWithAngle:(CGFloat)angle {
    BulletVulcan *bullet = [[BulletVulcan alloc] initWithGameLayer:self angle:angle];
    [bullet setPosition:shootPoint];
    [heroBatchNode addChild:bullet];
    [bullet release];
}
- (void)addMissileBulletWithTaget:(CGPoint)target {
    NSInteger missileCount = [gameData.missile sprayCount];
    switch (missileCount) {
        case 1:{
            double angle = atan((target.y - shootPoint.y)/(target.x-shootPoint.x));
            BulletMissile *bullet = [[BulletMissile alloc] initWithGameLayer:self angle:angle target:target];
            [bullet setPosition:shootPoint];
            [heroBatchNode addChild:bullet];
            [bullet release];
            break;
        }
        case 2:{
            CGPoint target1 = CGPointMake(target.x - 5, target.y - 5);
            double angle1 = atan((target1.y - shootPoint.y)/(target1.x-shootPoint.x));
            BulletMissile *bullet1 = [[BulletMissile alloc] initWithGameLayer:self angle:angle1 target:target1];
            [bullet1 setPosition:shootPoint];
            [heroBatchNode addChild:bullet1];
            [bullet1 release];
            
            CGPoint target2 = CGPointMake(target.x + 5, target.y + 5);
            double angle2 = atan((target2.y - shootPoint.y)/(target2.x-shootPoint.x));
            BulletMissile *bullet2 = [[BulletMissile alloc] initWithGameLayer:self angle:angle2 target:target2];
            [bullet2 setPosition:shootPoint];
            [heroBatchNode addChild:bullet2];
            [bullet2 release];
            
            break;
        }
        case 3:{
            CGPoint target1 = CGPointMake(target.x - 10, target.y - 10);
            double angle1 = atan((target1.y - shootPoint.y)/(target1.x-shootPoint.x));
            BulletMissile *bullet1 = [[BulletMissile alloc] initWithGameLayer:self angle:angle1 target:target1];
            [bullet1 setPosition:shootPoint];
            [heroBatchNode addChild:bullet1];
            [bullet1 release];
            
            double angle2 = atan((target.y - shootPoint.y)/(target.x-shootPoint.x));
            BulletMissile *bullet2 = [[BulletMissile alloc] initWithGameLayer:self angle:angle2 target:target];
            [bullet2 setPosition:shootPoint];
            [heroBatchNode addChild:bullet2];
            [bullet2 release];
            
            CGPoint target3 = CGPointMake(target.x + 10, target.y + 10);
            double angle3 = atan((target3.y - shootPoint.y)/(target3.x-shootPoint.x));
            BulletMissile *bullet3 = [[BulletMissile alloc] initWithGameLayer:self angle:angle3 target:target3];
            [bullet3 setPosition:shootPoint];
            [heroBatchNode addChild:bullet3];
            [bullet3 release];
            break;
        }
        case 4:{
            CGPoint target1 = CGPointMake(target.x - 15, target.y - 15);
            double angle1 = atan((target1.y - shootPoint.y)/(target1.x-shootPoint.x));
            BulletMissile *bullet1 = [[BulletMissile alloc] initWithGameLayer:self angle:angle1 target:target1];
            [bullet1 setPosition:shootPoint];
            [heroBatchNode addChild:bullet1];
            [bullet1 release];
            
            CGPoint target2 = CGPointMake(target.x + 15, target.y + 15);
            double angle2 = atan((target2.y - shootPoint.y)/(target2.x-shootPoint.x));
            BulletMissile *bullet2 = [[BulletMissile alloc] initWithGameLayer:self angle:angle2 target:target2];
            [bullet2 setPosition:shootPoint];
            [heroBatchNode addChild:bullet2];
            [bullet2 release];
            
            CGPoint target3 = CGPointMake(target.x - 5, target.y - 5);
            double angle3 = atan((target3.y - shootPoint.y)/(target3.x-shootPoint.x));
            BulletMissile *bullet3 = [[BulletMissile alloc] initWithGameLayer:self angle:angle3 target:target3];
            [bullet3 setPosition:shootPoint];
            [heroBatchNode addChild:bullet3];
            [bullet3 release];
            
            CGPoint target4 = CGPointMake(target.x + 5, target.y + 5);
            double angle4 = atan((target4.y - shootPoint.y)/(target4.x-shootPoint.x));
            BulletMissile *bullet4 = [[BulletMissile alloc] initWithGameLayer:self angle:angle4 target:target4];
            [bullet4 setPosition:shootPoint];
            [heroBatchNode addChild:bullet4];
            [bullet4 release];
            break;
        }
    }
}
- (void)addLaserBulletWithAngle:(CGFloat)angle {
    BulletLaser *bullet = [[BulletLaser alloc] initWithGameLayer:self angle:angle];
    [bullet setPosition:shootPoint];
    [heroBatchNode addChild:bullet];
    [bullet release];
}
- (void)addMissileSmoke:(CGPoint)smokePosition {
    MissileSmoke *missileSmoke = [[MissileSmoke alloc] initSelf];
    [missileSmoke setPosition:smokePosition];
    [heroBatchNode addChild:missileSmoke];
    [missileSmoke release];
}

#pragma mark PlayTool

#pragma mark GameData#pragma mark GameData
- (void)loadGameData {
    //*
    if ([GameData hasSaveGameData]) {
        GameData *data = [GameData loadGameData];
        [self setGameData:data];
        //[data release];
    }
    //*/
}

@end
