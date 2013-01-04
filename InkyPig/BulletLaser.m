//
//  BulletLaser.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 14..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "BulletLaser.h"
#import "GameLayer.h"
#import "GameData.h"
#import "MapData.h"
#import "MapBlockData.h"
#import "Weapon.h"
#import "Tree.h"
#import "CrashZoneNode.h"
#import "GameUtils.h"

#import "CharacterSprite.h"
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

#import "Tower_Character.h"
#import "LaserBoom.h"

@implementation BulletLaser

@synthesize weapon;

- (id)initWithGameLayer:(GameLayer *)layer angle:(double)ag {
    Tree *power = [[[layer gameData] treeLaser] objectAtIndex:0];
    
    switch ([power currentLevel]) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            if ((self = [super initWithSpriteFrameName:@"T_L_b_01.png"])) {
            }
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:{
            if ((self = [super initWithSpriteFrameName:@"T_L_b_01.png"])) {
            }
            break;
        }
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:{
            if ((self = [super initWithSpriteFrameName:@"T_L_b_01.png"])) {
            }
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            if ((self = [super initWithSpriteFrameName:@"T_L_b_01.png"])) {
            }
            break;
        }
    }
    gameLayer = layer;
    [self setWeapon:[[layer gameData] laser]];
    [self setContentSize:CGSizeMake(120+(power.currentLevel-1)*15, 8)];
    [self setOpacity:0];
    for (int i=1; i<=(120+(power.currentLevel-1)*15)/5; i++) {
        CCSprite *laser = [[CCSprite alloc] initWithSpriteFrameName:@"T_L_b_01.png"];
        [laser setPosition:CGPointMake(self.contentSize.width
                                       - laser.contentSize.width*0.5f
                                       - (laser.contentSize.width *(i-1)),
                                       self.contentSize.height*0.5f)];
        [laser setVisible:NO];
        [self addChild:laser z:0 tag:i];
        [laser release];
    }
    //[self setScaleX:(120+(power.currentLevel-1)*15)/5];
    angle = ag;
    distanceX = [weapon bulletSpeed]*GAME_METER*cos(ag);
    distanceY = [weapon bulletSpeed]*GAME_METER*sin(ag);
    
    [crashZones setAnchorPoint:self.anchorPoint];
    [crashZones setContentSize:self.contentSize];
    
    [self createCrashZone];
    
    return self;
}

- (void)dealloc {
    [weapon release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    [self setRotation:CC_RADIANS_TO_DEGREES(-angle)];
    [crashZones setPosition:self.position];
    [crashZones setRotation:CC_RADIANS_TO_DEGREES(-angle)];
    [[gameLayer crashZoneSprite] addChild:crashZones];
    startPoint = self.position;
    
    [self schedule:@selector(moveSchedule:)];
}

- (void)createCrashZone {
    for (int i=1; i<=self.contentSize.width/self.contentSize.height; i++) {
        CrashZoneNode *zone = [[CrashZoneNode alloc] initAsCircleWithRadius:self.contentSize.height*0.5f];
        [zone setPosition:CGPointMake(self.contentSize.width
                                      - self.contentSize.height*0.5f
                                      - (self.contentSize.height*(i-1)),
                                      self.contentSize.height*0.5f)];
        [crashZones addChild:zone];
        [zone release];
    }
}
- (void)removeSelf {
    [self setIsWillRemove:YES];
    [self unschedule:@selector(moveSchedule:)];
    [[gameLayer crashZoneSprite] removeChild:crashZones cleanup:YES];
    [[gameLayer heroBatchNode] removeChild:self cleanup:YES];
}
- (void)hitEnemy:(CharacterSprite *)enemy damage:(CGFloat)damage {
    switch ([enemy tag]) {
        case 1:{
            Enemy_Character01 *enemy1 = (Enemy_Character01 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 2:{
            Enemy_Character02 *enemy1 = (Enemy_Character02 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 3:{
            Enemy_Character03 *enemy1 = (Enemy_Character03 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 4:{
            Enemy_Character04 *enemy1 = (Enemy_Character04 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 5:{
            Enemy_Character05 *enemy1 = (Enemy_Character05 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 6:{
            Enemy_Character06 *enemy1 = (Enemy_Character06 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 7:{
            Enemy_Character07 *enemy1 = (Enemy_Character07 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 8:{
            Enemy_Character08 *enemy1 = (Enemy_Character08 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 9:{
            Enemy_Character09 *enemy1 = (Enemy_Character09 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 10:{
            Enemy_Character10 *enemy1 = (Enemy_Character10 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 11:{
            Enemy_Character11 *enemy1 = (Enemy_Character11 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 12:{
            Enemy_Character12 *enemy1 = (Enemy_Character12 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
        case 13:{
            Enemy_Character13 *enemy1 = (Enemy_Character13 *)enemy;
            [enemy1 hitWithDamage:damage];
            break;
        }
    }
}
- (CGFloat)getDamageAir {
    NSInteger dmRange = weapon.airMax*10 - weapon.airMin*10;
    NSInteger rDmg = rand()%dmRange;
    CGFloat damage = weapon.airMin + (rDmg*0.1f);

    return damage;
}
- (CGFloat)getDamageLand {
    NSInteger dmRange = weapon.landMax*10 - weapon.landMin*10;
    NSInteger rDmg = rand()%dmRange;
    CGFloat damage = weapon.landMin + (rDmg*0.1f);

    return damage;
}

- (void)moveSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    BOOL isCrash = NO;
    if ([crashZones.children count] <= 0) {
        [self removeSelf];
        return;
    }
    // boom
    if (self.position.x < startPoint.x + (self.contentSize.width*0.5f + 44)*cosf(CC_DEGREES_TO_RADIANS(self.rotation))) {
        if (!gameLayer.tower.laserBoom.visible) {
            [gameLayer.tower.laserBoom boomStart];
        }
    } else {
        [gameLayer.tower.laserBoom boomStop];
    }
    
    //이미지 보이기
    for (int i=0; i<self.children.count; i++) {
        CCSprite *lazer = [self.children objectAtIndex:i];
        if (![lazer visible]) {
            CGPoint lazerPosition = [GameUtils convertToWorldPosition:lazer];
            if (lazerPosition.x >= gameLayer.shootPoint.x) {
                [lazer setVisible:YES];
            }
        }
    }
    
    //적 충돌
    for (int i=0; i<[[[gameLayer enemyAirBatchNode] children] count]; i++) {
        if (!isWillRemove) {
            CharacterSprite *enemy = [[[gameLayer enemyAirBatchNode] children] objectAtIndex:i];
            isCrash = [GameUtils isCrashBullet:self character:enemy];
            if (isCrash && enemy.stateEnemy != StateEnemy_die && enemy.stateEnemy != StateEnemy_hit) {
                [self hitEnemy:enemy damage:[self getDamageAir]];
            }
        }
    }
    for (int i=0; i<[[[gameLayer enemyLandBatchNode] children] count]; i++) {
        if (!isWillRemove) {
            CharacterSprite *enemy = [[[gameLayer enemyLandBatchNode] children] objectAtIndex:i];
            isCrash = [GameUtils isCrashBullet:self character:enemy];
            if (isCrash && enemy.stateEnemy != StateEnemy_die && enemy.stateEnemy != StateEnemy_hit) {
                [self hitEnemy:enemy damage:[self getDamageLand]];
            }
        }
    }
    // 지상 충돌
    NSInteger mapIndex = (self.position.x/80);
    if (mapIndex <= 12) {
        MapBlockData *blockData = (MapBlockData*)[[[gameLayer mapData] mapBlocksArray] objectAtIndex:mapIndex];
        NSInteger willRemoveZoneIndex = -1;
        for (int i=0; i<crashZones.children.count; i++) {
            CrashZoneNode *zone = [[crashZones children] objectAtIndex:i];
            CGPoint zonePosition = [GameUtils convertToWorldPosition:zone];
            CGFloat mapY = (-1*[blockData gradient]*GAME_HEIGHT/80)*(zonePosition.x - mapIndex*80)+(GAME_FLOOR + [blockData positionY]*GAME_HEIGHT);
            if (mapY >= zonePosition.y) {
                willRemoveZoneIndex = i;
            }
        }
        if (willRemoveZoneIndex != -1) {
            [crashZones removeChild:[crashZones.children objectAtIndex:willRemoveZoneIndex] cleanup:YES];
        }
        //*
        NSInteger willRemoveLazerIndex = -1;
        for (int i=0; i<self.children.count; i++) {
            CCSprite *lazer = [[self children] objectAtIndex:i];
            CGPoint lazerPosition = [GameUtils convertToWorldPosition:lazer];
            CGFloat mapY = (-1*[blockData gradient]*GAME_HEIGHT/80)*(lazerPosition.x - mapIndex*80)+(GAME_FLOOR + [blockData positionY]*GAME_HEIGHT);

            if (mapY >= lazerPosition.y) {
                willRemoveLazerIndex = i;
            }
        }
        if (willRemoveLazerIndex != -1) {
            [self removeChild:[self.children objectAtIndex:willRemoveLazerIndex] cleanup:YES];
        }//*/
    }
    
    // 화면 벗어남
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    if (self.position.x > screenSize.width*2 + self.contentSize.width ||
        self.position.x < - self.contentSize.width ||
        self.position.y > screenSize.height + self.contentSize.height) {
        [self removeSelf];
        return;
    }
    
    [self setPosition:CGPointMake(self.position.x
                                  + (distanceX*deltaTime),
                                  self.position.y
                                  + (distanceY*deltaTime))];
    [crashZones setPosition:self.position];
}

@end
