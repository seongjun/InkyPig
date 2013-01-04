//
//  BulletVulcan.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 12..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "BulletVulcan.h"
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

@implementation BulletVulcan

@synthesize weapon;

- (id)initWithGameLayer:(GameLayer *)layer angle:(double)ag {
    Tree *power = [[[layer gameData] treeCannon] objectAtIndex:0];
    
    switch ([power currentLevel]) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:{
            if ((self = [super initWithSpriteFrameName:@"T_V_b_01.png"])) {
            }
            break;
        }
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:{
            if ((self = [super initWithSpriteFrameName:@"T_V_b_01.png"])) {
            }
            break;
        }
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:{
            if ((self = [super initWithSpriteFrameName:@"T_V_b_01.png"])) {
            }
            break;
        }
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:{
            if ((self = [super initWithSpriteFrameName:@"T_V_b_01.png"])) {
            }
            break;
        }
    }
    gameLayer = layer;
    [self setWeapon:[[layer gameData] vulcan]];
    
    distanceX = [weapon bulletSpeed]*GAME_METER*cos(ag);
    distanceY = [weapon bulletSpeed]*GAME_METER*sin(ag);
    
    [crashZones setAnchorPoint:self.anchorPoint];
    [crashZones setContentSize:self.contentSize];
    
    [self createCrashZone];

    return self;
}

- (void)dealloc {
    //[gameLayer release];
    [weapon release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    [crashZones setPosition:self.position];
    [[gameLayer crashZoneSprite] addChild:crashZones];

    [self schedule:@selector(moveSchedule:)];
}

- (void)createCrashZone {
    CrashZoneNode *zone = [[CrashZoneNode alloc] initAsCircleWithRadius:self.contentSize.width*0.5f];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f,
                                  self.contentSize.height*0.5f)];
    [crashZones addChild:zone];
    [zone release];
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
    //적 충돌
    for (int i=0; i<[[[gameLayer enemyAirBatchNode] children] count]; i++) {
        if (!isWillRemove) {
            CharacterSprite *enemy = [[[gameLayer enemyAirBatchNode] children] objectAtIndex:i];
            isCrash = [GameUtils isCrashBullet:self character:enemy];
            if (isCrash && enemy.stateEnemy != StateEnemy_die) {
                [self removeSelf];
                [self hitEnemy:enemy damage:[self getDamageAir]];
            }
        }
    }
    for (int i=0; i<[[[gameLayer enemyLandBatchNode] children] count]; i++) {
        if (!isWillRemove) {
            CharacterSprite *enemy = [[[gameLayer enemyLandBatchNode] children] objectAtIndex:i];
            isCrash = [GameUtils isCrashBullet:self character:enemy];
            if (isCrash && enemy.stateEnemy != StateEnemy_die) {
                [self removeSelf];
                [self hitEnemy:enemy damage:[self getDamageLand]];
            }
        }
    }
    // 지상 충돌
    NSInteger mapIndex = (self.position.x/80);
    MapBlockData *blockData = (MapBlockData*)[[[gameLayer mapData] mapBlocksArray] objectAtIndex:mapIndex];
    CGFloat mapY = (-1*[blockData gradient]*GAME_HEIGHT/80)*(self.position.x - mapIndex*80)+(GAME_FLOOR + [blockData positionY]*GAME_HEIGHT);

    if (mapY >= self.position.y) {
        [self removeSelf];
    }
    
    // 화면 벗어남
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    if (self.position.x > screenSize.width*2 + self.contentSize.width ||
        self.position.x < - self.contentSize.width ||
        self.position.y > screenSize.height + self.contentSize.height) {
        [self removeSelf];
    }
    
    [self setPosition:CGPointMake(self.position.x
                                  + (distanceX*deltaTime),
                                  self.position.y
                                  + (distanceY*deltaTime))];
    [crashZones setPosition:self.position];
}

@end
