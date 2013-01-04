//
//  Enemy_Character02.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 28..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "Enemy_Character02.h"
#import "GameLayer.h"
#import "GameHUDLayer.h"
#import "MapData.h"
#import "MapBlockData.h"
#import "CrashZoneNode.h"

#import "GameUtils.h"

#define DefaultHP 15
#define DefaultMP 0
#define DefaultAt 6
#define DefaultMs 0.5f
#define DefaultRg 0.8f
#define HoldTimes 1

#define animateFrame 0.05f


@implementation Enemy_Character02

- (id)initWithGameLayer:(GameLayer *)layer withLevel:(NSInteger)lv {
    if ((self = [super initWithSpriteFrameName:@"M_A_01_move_01.png"])) {
        isFirstAttack = YES;
        [self setAnchorPoint:CGPointMake(0.5f, 0.0f)];
        
        [crashZones setAnchorPoint:self.anchorPoint];
        [crashZones setContentSize:self.contentSize];
        
        //CharacterSprite
        [self createCrashZone];
        [self setLevel:lv];
        [self setHp:DefaultHP * lv];
        [self setMp:DefaultMP];
        [self setAttackDamage:DefaultAt * lv];
        [self setMoveSpeed:DefaultMs * GAME_METER];
        [self setRange:DefaultRg * GAME_METER];
        
        [self setStateEnemy:StateEnemy_Move];
        
        gameLayer = layer;
        
        [self createWalkAnimate];
        [self createAttackReadyAnimate];
        [self createAttackAnimate];
        [self createAttackCompleteAnimate];
        [self createDieAnimate];
        [self createHitAnimate];
        [self createHoldAnimate];
        
        miniMap = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_minimap_enemy.png"];
        
        holdTimes = 0;
        
    }
    
    return self;
}

- (id)initWithGameLayer:(GameLayer *)layer withLevel:(NSInteger)lv withState:(StateEnemy)state {
    if ((self = [self initWithGameLayer:layer withLevel:lv])) {
        [self setStateEnemy:state];
    }
    
    return self;
}

- (void)dealloc {
    [walkAnimate release];
    [attackReadyAnimate release];
    [attackAnimate release];
    [attackCompleteAnimate release];
    [dieAnimate release];
    [hitAnimate release];
    [holdAnimate release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    switch (stateEnemy) {
        case StateEnemy_Move:{
            [self move];
            break;
        }
        case StateEnemy_Attack:{
            [self attack];
            break;
        }
        case StateEnemy_hit:{
            [self hitWithDamage:0];
            break;
        }
        case StateEnemy_die:{
            [self die];
            break;
        }
        case StateEnemy_hold:{
            [self hold];
            break;
        }
    }
    
    //create minimap
    [[gameLayer hud] addMinimapEnemy:miniMap position:self.position];
    //create crashZone position
    [crashZones setPosition:self.position];
    [[gameLayer crashZoneSprite] addChild:crashZones];
}

- (void)createCrashZone {
    CrashZoneNode *zone = [[CrashZoneNode alloc] initAsRectWithSize:CGSizeMake(30, 33)];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                  + 8,
                                  self.contentSize.height*0.5f
                                  - 9)];
    [crashZones addChild:zone];
    [zone release];
}

- (void)createWalkAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=11; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_move_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    walkAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createAttackReadyAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=5; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_atkR_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    attackReadyAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createAttackAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=4; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_atk_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    attackAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createAttackCompleteAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=9; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_atkC_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    attackCompleteAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createDieAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=12; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"M_A_01_die_01.png"];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    dieAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createHitAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=6; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_hit_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    hitAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}
- (void)createHoldAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=8; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_A_01_hold_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    holdAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}

- (void)move {
    stateEnemy = StateEnemy_Move;
    [self stopAllActions];
    CrashZoneNode *zone = [crashZones.children objectAtIndex:0];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                  + 8,
                                  self.contentSize.height*0.5f
                                  - 9)];
    
    [self runAction:
     [CCRepeatForever actionWithAction:walkAnimate]];
    [self schedule:@selector(moveSchedule:)];
}
- (void)attackReady {
    if (isFirstAttack) {
        isFirstAttack = NO;
        currentPosition = self.position;
    }
    [self unschedule:@selector(moveSchedule:)];
    
    stateEnemy = StateEnemy_Attack;
    [self stopAllActions];
    
    [self runAction:
     [CCSequence actions:
      attackReadyAnimate,
      [CCCallFunc actionWithTarget:self
                          selector:@selector(attack)], nil]];
}
- (void)attack {
    CrashZoneNode *zone = [crashZones.children objectAtIndex:0];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                  - 10,
                                  self.contentSize.height*0.5f
                                  - 9)];
    [self schedule:@selector(attackSchedule:)];
    
    [self stopAllActions];
    
    [self runAction:
     [CCSequence actions:
      attackAnimate,
      [CCCallFunc actionWithTarget:self
                          selector:@selector(attackComplete)], nil]];
}
- (void)attackComplete {
    attackedPosition = self.position;
    [self unschedule:@selector(attackSchedule:)];
    [self schedule:@selector(attackCompleteSchedule:)];
    
    [self stopAllActions];
    
    CrashZoneNode *zone = [crashZones.children objectAtIndex:0];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                  - 1,
                                  self.contentSize.height*0.5f
                                  - 9)];
    [self runAction:
     [CCSequence actions:
      attackCompleteAnimate,
      [CCCallFunc actionWithTarget:self
                          selector:@selector(hold)], nil]];
}
- (void)die {
    [self unschedule:@selector(moveSchedule:)];
    
    [self stopAllActions];
    
    [self runAction:
     [CCSequence actions:
      [CCSpawn actions:
       dieAnimate,
       [CCJumpBy actionWithDuration:0.6f position:CGPointMake(20, 0) height:20 jumps:1],
       [CCFadeOut actionWithDuration:0.6f], nil],
      [CCCallFunc actionWithTarget:self
                          selector:@selector(dieComplete)], nil]];
}
- (void)dieComplete {
    [self removeSelf];
}
- (void)hitWithDamage:(CGFloat)damage {
    [self unschedule:@selector(moveSchedule:)];
    [self unschedule:@selector(attackSchedule:)];
    [self unschedule:@selector(attackCompleteSchedule:)];
    
    stateEnemy = StateEnemy_hit;
    [self stopAllActions];
    
    hp -= damage;
    if (hp<=0) {
        stateEnemy = StateEnemy_die;
        [self runAction:
         [CCSequence actions:
          hitAnimate,
          [CCCallFunc actionWithTarget:self
                              selector:@selector(die)], nil]];
    } else {
        [self runAction:
         [CCSequence actions:
          hitAnimate,
          [CCCallFunc actionWithTarget:self
                              selector:@selector(move)], nil]];
    }
}
- (void)hold {
    [self unschedule:@selector(attackCompleteSchedule:)];
    
    CrashZoneNode *zone = [crashZones.children objectAtIndex:0];
    [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                  + 6,
                                  self.contentSize.height*0.5f
                                  - 9)];
    
    stateEnemy = StateEnemy_hold;
    [self stopAllActions];
    
    if (holdTimes <= HoldTimes) {
        holdTimes++;
        [self runAction:
         [CCSequence actions:
          holdAnimate,
          [CCCallFunc actionWithTarget:self
                              selector:@selector(hold)], nil]];
    } else {
        holdTimes = 0;
        [self runAction:
         [CCSequence actions:
          holdAnimate,
          [CCCallFunc actionWithTarget:self
                              selector:@selector(move)], nil]];
    }
}

- (void)removeSelf {
    [[gameLayer hud] removeMinimapEnemy:miniMap];
    [[gameLayer crashZoneSprite] removeChild:crashZones cleanup:YES];
    [[gameLayer enemyAirBatchNode] removeChild:self cleanup:YES];
}

- (void)moveSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    NSInteger mapIndex;
    NSInteger positionX = self.position.x;
    mapIndex = (positionX/80);
    
    float moveDistance = moveSpeed*deltaTime;
    
    CharacterSprite *tower = (CharacterSprite *)[[gameLayer heroBatchNode] getChildByTag:tagGameHero_Tower];
    if ([GameUtils isRangeCharater:self target:tower]) {
        [self attackReady];
        return;
    }
    [self setPosition:CGPointMake(self.position.x
                                  - moveDistance,
                                  self.position.y)];
    [crashZones setPosition:self.position];
    [[gameLayer hud] moveMinimapEnemy:miniMap position:self.position];
}

- (void)attackSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    
    float moveDistance = (range/0.2f)*deltaTime;
    
    CharacterSprite *tower = (CharacterSprite *)[[gameLayer heroBatchNode] getChildByTag:tagGameHero_Tower];
    if (![GameUtils isCrashCharacter:tower character:self]) {
        float moveHeight = -5*(GAME_HEIGHT/80.0f)*moveDistance;
        [self setPosition:CGPointMake(self.position.x
                                      - moveDistance,
                                      self.position.y
                                      + moveHeight)];
    }
    [crashZones setPosition:self.position];
    [[gameLayer hud] moveMinimapEnemy:miniMap position:self.position];
}

- (void)attackCompleteSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    
    //float moveDistance = (range/0.45f)*deltaTime;
    float moveDistance = ((currentPosition.x - attackedPosition.x)/0.45f)*deltaTime;
    
    float moveHeight = 5*(GAME_HEIGHT/80.0f)*moveDistance;
    [self setPosition:CGPointMake(self.position.x
                                  + moveDistance,
                                  self.position.y
                                  + moveHeight)];
    
    [crashZones setPosition:self.position];
    [[gameLayer hud] moveMinimapEnemy:miniMap position:self.position];
}

@end
