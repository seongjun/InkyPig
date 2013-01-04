//
//  Tower_Character.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 3..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "Tower_Character.h"
#import "CrashZoneNode.h"
#import "GameLayer.h"
#import "GameHUDLayer.h"
#import "TowerSmoke.h"
#import "TowerPump.h"
#import "LaserBoom.h"

#define animateFrame 0.05f
#define pipe1DelayTime 1.0f
#define pipe2DelayTime 1.5f


@implementation Tower_Character

@synthesize weaponStand;
@synthesize isChangeWeapon;
@synthesize laserBoom;

- (id)initWithGameLayer:(GameLayer*)layer withLevel:(NSInteger)lv withTag:(NSInteger)tag {
    switch (lv) {
        case 1:{
            if ((self = [super initWithSpriteFrameName:@"tower_01.png"])) {
                [self setOpacity:0];
                CCSprite *tower = [[CCSprite alloc] initWithSpriteFrameName:@"tower_01.png"];
                [tower setPosition:CGPointMake(self.contentSize.width*0.5f,
                                               self.contentSize.height*0.5f)];
                [self addChild:tower z:100];
                [tower release];

                //gears
                CCSprite *gear13_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_13.png"];
                [gear13_1 setPosition:CGPointMake(88, 120)];
                [self addChild:gear13_1 z:1 tag:1];
                [gear13_1 release];
                CCSprite *gear07_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_07.png"];
                [gear07_1 setPosition:CGPointMake(80, 104)];
                [self addChild:gear07_1 z:1 tag:2];
                [gear07_1 release];
                CCSprite *gear10_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_10.png"];
                [gear10_1 setPosition:CGPointMake(64, 53)];
                [self addChild:gear10_1 z:1 tag:3];
                [gear10_1 release];
                CCSprite *gear10_2 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_10.png"];
                [gear10_2 setPosition:CGPointMake(92, 53)];
                [self addChild:gear10_2 z:1 tag:4];
                [gear10_2 release];
                CCSprite *gear07_2 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_07.png"];
                [gear07_2 setPosition:CGPointMake(54, 18)];
                [self addChild:gear07_2 z:1 tag:5];
                [gear07_2 release];
                CCSprite *gear09_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_09.png"];
                [gear09_1 setPosition:CGPointMake(97, 20)];
                [self addChild:gear09_1 z:1 tag:6];
                [gear09_1 release];
                
                //pipe
                CCSprite *pipe02 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_pipe_02.png"];
                [pipe02 setPosition:CGPointMake(60, 20)];
                pipe1Position = pipe02.position;
                [self addChild:pipe02 z:2 tag:21];
                [pipe02 release];
                
                //weaponStand
                weaponStandPosition = CGPointMake(95, 112);
                weaponStand = [[CCSprite alloc] initWithSpriteFrameName:@"tower_wepon_arm_01.png"];
                [weaponStand setPosition:weaponStandPosition];
                [self addChild:weaponStand z:0];
                [weaponStand release];
                
                [crashZones setContentSize:self.contentSize];
                CrashZoneNode *zone = [[CrashZoneNode alloc]
                                       initAsRectWithSize:CGSizeMake(self.contentSize.width
                                                                     - 10,
                                                                     self.contentSize.height)];
                [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                              - 5,
                                              self.contentSize.height*0.5f)];
                [crashZones addChild:zone];
                [zone release];
            }
            break;
        }
        case 2:{
            if ((self = [super initWithSpriteFrameName:@"tower_02.png"])) {
                [self setOpacity:0];
                CCSprite *tower = [[CCSprite alloc] initWithSpriteFrameName:@"tower_02.png"];
                [tower setPosition:CGPointMake(self.contentSize.width*0.5f,
                                               self.contentSize.height*0.5f)];
                [self addChild:tower z:100];
                [tower release];

                //gears
                CCSprite *gear13_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_13.png"];
                [gear13_1 setPosition:CGPointMake(86, 137)];
                [self addChild:gear13_1 z:1 tag:1];
                [gear13_1 release];
                CCSprite *gear08_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_08.png"];
                [gear08_1 setPosition:CGPointMake(78, 123)];
                [self addChild:gear08_1 z:1 tag:2];
                [gear08_1 release];
                CCSprite *gear11_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_11.png"];
                [gear11_1 setPosition:CGPointMake(100, 91)];
                [self addChild:gear11_1 z:1 tag:3];
                [gear11_1 release];
                CCSprite *gear06_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_06.png"];
                [gear06_1 setPosition:CGPointMake(82, 84)];
                [self addChild:gear06_1 z:1 tag:4];
                [gear06_1 release];
                CCSprite *gear14_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_14.png"];
                [gear14_1 setPosition:CGPointMake(62, 72)];
                [self addChild:gear14_1 z:1 tag:5];
                [gear14_1 release];
                CCSprite *gear12_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_12.png"];
                [gear12_1 setPosition:CGPointMake(88, 72)];
                [self addChild:gear12_1 z:1 tag:6];
                [gear12_1 release];
                CCSprite *gear05_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_05.png"];
                [gear05_1 setPosition:CGPointMake(95, 40)];
                [self addChild:gear05_1 z:1 tag:7];
                [gear05_1 release];
                CCSprite *gear04_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_04.png"];
                [gear04_1 setPosition:CGPointMake(50, 29)];
                [self addChild:gear04_1 z:1 tag:8];
                [gear04_1 release];
                CCSprite *gear02_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_02.png"];
                [gear02_1 setPosition:CGPointMake(50, 24)];
                [self addChild:gear02_1 z:1 tag:9];
                [gear02_1 release];

                //pipe
                CCSprite *pipe02 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_pipe_02.png"];
                [pipe02 setPosition:CGPointMake(50, 43)];
                pipe1Position = pipe02.position;
                [self addChild:pipe02 z:2 tag:21];
                [pipe02 release];

                //pump
                TowerPump *pump = [[TowerPump alloc] initSelf];
                [pump setPosition:CGPointMake(71, 56)];
                [self addChild:pump z:101];
                [pump release];

                //weaponStand
                weaponStandPosition = CGPointMake(94, 131);
                weaponStand = [[CCSprite alloc] initWithSpriteFrameName:@"tower_wepon_arm_01.png"];
                [weaponStand setPosition:weaponStandPosition];
                [self addChild:weaponStand z:0];
                [weaponStand release];

                [crashZones setContentSize:self.contentSize];
                CrashZoneNode *zone = [[CrashZoneNode alloc]
                                       initAsRectWithSize:CGSizeMake(self.contentSize.width
                                                                     - 10,
                                                                     self.contentSize.height)];
                [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                              - 5,
                                              self.contentSize.height*0.5f)];
                [crashZones addChild:zone];
                [zone release];
            }
            break;
        }
        case 3:{
            if ((self = [super initWithSpriteFrameName:@"tower_03.png"])) {
                [self setOpacity:0];
                CCSprite *tower = [[CCSprite alloc] initWithSpriteFrameName:@"tower_03.png"];
                [tower setPosition:CGPointMake(self.contentSize.width*0.5f,
                                               self.contentSize.height*0.5f)];
                [self addChild:tower z:100];
                [tower release];

                //gears
                CCSprite *gear13_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_13.png"];
                [gear13_1 setPosition:CGPointMake(84, 153)];
                [self addChild:gear13_1 z:1 tag:1];
                [gear13_1 release];
                CCSprite *gear04_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_04.png"];
                [gear04_1 setPosition:CGPointMake(70, 136)];
                [self addChild:gear04_1 z:1 tag:2];
                [gear04_1 release];
                CCSprite *gear11_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_11.png"];
                [gear11_1 setPosition:CGPointMake(96, 109)];
                [self addChild:gear11_1 z:1 tag:3];
                [gear11_1 release];
                CCSprite *gear06_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_06.png"];
                [gear06_1 setPosition:CGPointMake(79, 98)];
                [self addChild:gear06_1 z:1 tag:4];
                [gear06_1 release];
                CCSprite *gear14_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_14.png"];
                [gear14_1 setPosition:CGPointMake(55, 85)];
                [self addChild:gear14_1 z:1 tag:5];
                [gear14_1 release];
                CCSprite *gear12_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_12.png"];
                [gear12_1 setPosition:CGPointMake(82, 85)];
                [self addChild:gear12_1 z:1 tag:6];
                [gear12_1 release];
                CCSprite *gear05_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_05.png"];
                [gear05_1 setPosition:CGPointMake(99, 74)];
                [self addChild:gear05_1 z:1 tag:7];
                [gear05_1 release];
                CCSprite *gear03_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_03.png"];
                [gear03_1 setPosition:CGPointMake(46, 42)];
                [self addChild:gear03_1 z:1 tag:8];
                [gear03_1 release];
                CCSprite *gear01_1 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_01.png"];
                [gear01_1 setPosition:CGPointMake(60, 35)];
                [self addChild:gear01_1 z:1 tag:9];
                [gear01_1 release];
                CCSprite *gear11_2 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_gear_11.png"];
                [gear11_2 setPosition:CGPointMake(81, 37)];
                [self addChild:gear11_2 z:1 tag:10];
                [gear11_2 release];

                //pipe
                CCSprite *pipe02 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_pipe_02.png"];
                [pipe02 setPosition:CGPointMake(39, 57)];
                pipe1Position = pipe02.position;
                [self addChild:pipe02 z:2 tag:21];
                [pipe02 release];
                
                CCSprite *pipe01 = [[CCSprite alloc] initWithSpriteFrameName:@"tower_pipe_01.png"];
                [pipe01 setPosition:CGPointMake(56, 75)];
                pipe2Position = pipe01.position;
                [self addChild:pipe01 z:2 tag:22];
                [pipe01 release];

                //pump
                TowerPump *pump1 = [[TowerPump alloc] initSelf];
                [pump1 setPosition:CGPointMake(62, 105)];
                [self addChild:pump1 z:101];
                [pump1 release];

                TowerPump *pump2 = [[TowerPump alloc] initSelf];
                [pump2 setPosition:CGPointMake(62, 70)];
                [self addChild:pump2 z:101];
                [pump2 release];

                //weaponStand
                weaponStandPosition = CGPointMake(91, 145);
                weaponStand = [[CCSprite alloc] initWithSpriteFrameName:@"tower_wepon_arm_01.png"];
                [weaponStand setPosition:weaponStandPosition];
                [self addChild:weaponStand z:0];
                [weaponStand release];

                [crashZones setContentSize:self.contentSize];
                CrashZoneNode *zone = [[CrashZoneNode alloc]
                                       initAsRectWithSize:CGSizeMake(self.contentSize.width
                                                                     - 10,
                                                                     self.contentSize.height)];
                [zone setPosition:CGPointMake(self.contentSize.width*0.5f
                                              - 5,
                                              self.contentSize.height*0.5f)];
                [crashZones addChild:zone];
                [zone release];
            }
            break;
        }
        default:
            break;
    }
    weaponAnchor = [[CCSprite alloc] initWithSpriteFrameName:@"tower_wepon_arm.png"];
    [weaponAnchor setAnchorPoint:CGPointMake(9/weaponAnchor.contentSize.width,
                                             10/weaponAnchor.contentSize.height)];
    [weaponAnchor setPosition:CGPointMake(21, 49)];
    [weaponStand addChild:weaponAnchor];
    [weaponAnchor release];
    
    vulcan = [[CCSprite alloc] initWithSpriteFrameName:@"W_varcan_14.png"];
    [vulcan setAnchorPoint:CGPointMake(23/vulcan.contentSize.width, 0.5f)];
    [vulcan setPosition:CGPointMake(38, 10)];
    [weaponAnchor addChild:vulcan];
    [vulcan setVisible:NO];
    [vulcan release];
    
    missile = [[CCSprite alloc] initWithSpriteFrameName:@"W_missile_00.png"];
    [missile setAnchorPoint:CGPointMake(6/missile.contentSize.width, 0.5f)];
    [missile setPosition:CGPointMake(38, 10)];
    [weaponAnchor addChild:missile];
    [missile setVisible:NO];
    [missile release];
    
    laser = [[CCSprite alloc] initWithSpriteFrameName:@"W_laser_11.png"];
    [laser setAnchorPoint:CGPointMake(11/laser.contentSize.width, 0.5f)];
    [laser setPosition:CGPointMake(38, 10)];
    [weaponAnchor addChild:laser];
    [laser setVisible:NO];
    [laser release];
    
    laserBoom = [[LaserBoom alloc] initSelf];
    [laserBoom setPosition:CGPointMake(laser.contentSize.width
                                       + laserBoom.contentSize.width*0.5f
                                       - 8,
                                       laser.contentSize.height*0.5f)];
    [laser addChild:laserBoom];
    [laserBoom release];
    
    [self createVulcanAnimate];
    [self createLaserAnimate];
    
    CCSprite *towerBar = [[CCSprite alloc] initWithSpriteFrameName:@"game UI_towerbar.png"];
    [towerBar setPosition:CGPointMake(self.contentSize.width
                                      - towerBar.contentSize.width*0.5f
                                      - 7,
                                      -towerBar.contentSize.height*0.5f
                                      + 4)];
    [self addChild:towerBar z:101];
    [towerBar release];
    
    [self setLevel:lv];
    gameLayer = layer;
    
    isChangeWeapon = NO;

    return self;
}

- (void)dealloc {
    [vulcanAnimate release];
    [laserAnimate release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    [crashZones setPosition:self.position];
    [[gameLayer crashZoneSprite] addChild:crashZones];
    
    switch (gameLayer.hud.currentWeapon) {
        case 1:{
            [vulcan setVisible:YES];
            break;
        }
        case 2:{
            [missile setVisible:YES];
            break;
        }
        case 3:{
            [laser setVisible:YES];
            break;
        }
    }
    [self pipeMove];
}

- (void)createVulcanAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=14; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"W_varcan_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    vulcanAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}

- (void)createLaserAnimate {
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (int i=1; i<=11; i++) {
        CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"W_laser_%02d.png", i]];
        [frames addObject:frame];
    }
    
    CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:animateFrame];
    [frames release];
    
    laserAnimate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
    [animation release];
}

#pragma mark gears
- (void)gearsActionNomalIsClock:(BOOL)isClock {
    if (isClock) {
        [self schedule:@selector(gearsActionNomalClockSchedule:)];
    } else {
        [self schedule:@selector(gearsActionNomalUnclockSchedule:)];
    }
}
- (void)gearsActionHighIsClock:(BOOL)isClock {
    if (isClock) {
        [self schedule:@selector(gearsActionHighClockSchedule:)];
    } else {
        [self schedule:@selector(gearsActionhighUnclockSchedule:)];
    }
}

- (void)gearsActionStop {
    [self unschedule:@selector(gearsActionNomalClockSchedule:)];
    [self unschedule:@selector(gearsActionNomalUnclockSchedule:)];
    [self unschedule:@selector(gearsActionHighClockSchedule:)];
    [self unschedule:@selector(gearsActionhighUnclockSchedule:)];
}

- (void)gearsActionNomalClockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 240;
    switch (self.level) {
        case 1:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*3*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*2*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*2*deltaTime];
            break;
        }
        case 2:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];

            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation + angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation - angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation - angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation + angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation - angularVelocity*0.5f*deltaTime];
            break;
        }
        case 3:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            CCSprite *gear10 = (CCSprite *)[self getChildByTag:10];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation + angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation - angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation - angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation + angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation + angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation + angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation - angularVelocity*0.5f*deltaTime];
            [gear10 setRotation:gear10.rotation - angularVelocity*3*deltaTime];
            break;
        }
    }
}
- (void)gearsActionNomalUnclockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 240;
    switch (self.level) {
        case 1:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*3*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*2*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*2*deltaTime];
            break;
        }
        case 2:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            
            [gear1 setRotation:gear1.rotation - angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation + angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation - angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation + angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation + angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation - angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation + angularVelocity*0.5f*deltaTime];
            break;
        }
        case 3:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            CCSprite *gear10 = (CCSprite *)[self getChildByTag:10];
            
            [gear1 setRotation:gear1.rotation - angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation + angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation - angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation - angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation + angularVelocity*0.5f*deltaTime];
            [gear10 setRotation:gear10.rotation + angularVelocity*3*deltaTime];
            break;
        }
    }
}
- (void)gearsActionHighClockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 480;
    switch (self.level) {
        case 1:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*3*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*2*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*2*deltaTime];
            break;
        }
        case 2:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation + angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation - angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation - angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation + angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation - angularVelocity*0.5f*deltaTime];
            break;
        }
        case 3:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            CCSprite *gear10 = (CCSprite *)[self getChildByTag:10];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation + angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation - angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation - angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation + angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation + angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation + angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation - angularVelocity*0.5f*deltaTime];
            [gear10 setRotation:gear10.rotation - angularVelocity*3*deltaTime];
            break;
        }
    }
}
- (void)gearsActionhighUnclockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 480;
    switch (self.level) {
        case 1:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            
            [gear1 setRotation:gear1.rotation + angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation - angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*3*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*2*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*2*deltaTime];
            break;
        }
        case 2:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            
            [gear1 setRotation:gear1.rotation - angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation + angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation - angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation + angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation + angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation - angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation + angularVelocity*0.5f*deltaTime];
            break;
        }
        case 3:{
            CCSprite *gear1 = (CCSprite *)[self getChildByTag:1];
            CCSprite *gear2 = (CCSprite *)[self getChildByTag:2];
            CCSprite *gear3 = (CCSprite *)[self getChildByTag:3];
            CCSprite *gear4 = (CCSprite *)[self getChildByTag:4];
            CCSprite *gear5 = (CCSprite *)[self getChildByTag:5];
            CCSprite *gear6 = (CCSprite *)[self getChildByTag:6];
            CCSprite *gear7 = (CCSprite *)[self getChildByTag:7];
            CCSprite *gear8 = (CCSprite *)[self getChildByTag:8];
            CCSprite *gear9 = (CCSprite *)[self getChildByTag:9];
            CCSprite *gear10 = (CCSprite *)[self getChildByTag:10];
            
            [gear1 setRotation:gear1.rotation - angularVelocity*3*deltaTime];
            [gear2 setRotation:gear2.rotation + angularVelocity*2*deltaTime];
            [gear3 setRotation:gear3.rotation - angularVelocity*3*deltaTime];
            [gear4 setRotation:gear4.rotation + angularVelocity*2*deltaTime];
            [gear5 setRotation:gear5.rotation + angularVelocity*3*deltaTime];
            [gear6 setRotation:gear6.rotation - angularVelocity*3*deltaTime];
            [gear7 setRotation:gear7.rotation - angularVelocity*2*deltaTime];
            [gear8 setRotation:gear8.rotation - angularVelocity*2*deltaTime];
            [gear9 setRotation:gear9.rotation + angularVelocity*0.5f*deltaTime];
            [gear10 setRotation:gear10.rotation + angularVelocity*3*deltaTime];
            break;
        }
    }
}

#pragma mark pipe
- (void)pipeMove {
    pipe1Delay = pipe1DelayTime;
    pipe2Delay = pipe2DelayTime;
    switch (self.level) {
        case 1:{
            [self schedule:@selector(pipe1MoveDownSchedule:)];
            break;
        }
        case 2:{
            [self schedule:@selector(pipe1MoveDownSchedule:)];
            break;
        }
        case 3:{
            [self schedule:@selector(pipe1MoveDownSchedule:)];
            [self schedule:@selector(pipe2MoveDownSchedule:)];
            break;
        }
    }
}

- (void)pipe1MoveUpSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat pipeSpeed = 0.5f*GAME_METER;
    CCSprite *pipe = (CCSprite *)[self getChildByTag:21];
    if (pipe.position.y < pipe1Position.y) {
        [pipe setPosition:CGPointMake(pipe.position.x,
                                       pipe.position.y + pipeSpeed*deltaTime)];
    } else {
        pipe1Delay = 0;
        [pipe setPosition:CGPointMake(pipe1Position.x, pipe1Position.y)];
        [self unschedule:@selector(pipe1MoveUpSchedule:)];
        [self schedule:@selector(pipe1MoveDownSchedule:)];
        [self addSmokeWithPosition:CGPointMake(pipe1Position.x
                                               - pipe.contentSize.width*0.5f
                                               - 17,
                                               pipe1Position.y
                                               + pipe.contentSize.height*0.5f
                                               - 3)];
    }
}
- (void)pipe1MoveDownSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat pipeSpeed = 0.5f*GAME_METER;
    CCSprite *pipe = (CCSprite *)[self getChildByTag:21];
    if (pipe1Delay > pipe1DelayTime) {
        if (pipe.position.y > pipe1Position.y - 5) {
            [pipe setPosition:CGPointMake(pipe.position.x,
                                          pipe.position.y - pipeSpeed*deltaTime)];
        } else {
            [pipe setPosition:CGPointMake(pipe1Position.x, pipe1Position.y - 5)];
            [self unschedule:@selector(pipe1MoveDownSchedule:)];
            [self schedule:@selector(pipe1MoveUpSchedule:)];
        }
    } else {
        pipe1Delay += deltaTime;
    }
}
- (void)pipe2MoveUpSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat pipeSpeed = 0.4f*GAME_METER;
    CCSprite *pipe = (CCSprite *)[self getChildByTag:22];
    if (pipe.position.y < pipe2Position.y) {
        [pipe setPosition:CGPointMake(pipe.position.x,
                                       pipe.position.y + pipeSpeed*deltaTime)];
    } else {
        pipe2Delay = 0;
        [pipe setPosition:CGPointMake(pipe2Position.x, pipe2Position.y)];
        [self unschedule:@selector(pipe2MoveUpSchedule:)];
        [self schedule:@selector(pipe2MoveDownSchedule:)];
        [self addSmokeWithPosition:CGPointMake(pipe2Position.x
                                               - pipe.contentSize.width*0.5f
                                               - 17,
                                               pipe2Position.y
                                               + pipe.contentSize.height*0.5f
                                               - 3)];
    }
}
- (void)pipe2MoveDownSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat pipeSpeed = 0.4f*GAME_METER;
    CCSprite *pipe = (CCSprite *)[self getChildByTag:22];
    if (pipe2Delay > pipe2DelayTime) {
        if (pipe.position.y > pipe2Position.y - 8) {
            [pipe setPosition:CGPointMake(pipe.position.x,
                                          pipe.position.y - pipeSpeed*deltaTime)];
        } else {
            [pipe setPosition:CGPointMake(pipe2Position.x, pipe2Position.y - 8)];
            [self unschedule:@selector(pipe2MoveDownSchedule:)];
            [self schedule:@selector(pipe2MoveUpSchedule:)];
        }
    } else {
        pipe2Delay += deltaTime;
    }
}
- (void)addSmokeWithPosition:(CGPoint)position {
    TowerSmoke *smoke = [[TowerSmoke alloc] initSelf];
    [smoke setPosition:position];
    [self addChild:smoke z:1];
    [smoke release];
}

#pragma mark weapon angle
- (void)changeWeaponAngle:(CGFloat)angle {
    if (!isChangeWeapon) {
        [self gearsActionStop];
        [self changeWeaponAngleStop];
        
        targetAngle = angle;
        float degrees = CC_RADIANS_TO_DEGREES(-targetAngle);
        BOOL isWillChange = YES;
        BOOL isClock = YES;
        switch (gameLayer.hud.currentWeapon) {
            case 1:{
                if (vulcan.rotation < degrees) {
                    isClock = YES;
                } else if (vulcan.rotation > degrees) {
                    isClock = NO;
                } else {
                    isWillChange = NO;
                }
                break;
            }
            case 2:{
                if (missile.rotation < degrees) {
                    isClock = YES;
                } else if (missile.rotation > degrees) {
                    isClock = NO;
                } else {
                    isWillChange = NO;
                }
                break;
            }
            case 3:{
                if (laser.rotation < degrees) {
                    isClock = YES;
                } else if (laser.rotation > degrees) {
                    isClock = NO;
                } else {
                    isWillChange = NO;
                }
                break;
            }
        }
        if (isWillChange) {
            [self gearsActionNomalIsClock:isClock];
            [self changeWeaponAngleIsClock:isClock];
        } else {
            switch (gameLayer.hud.currentWeapon) {
                case 1:
                    [self shootVulcan];
                    break;
                case 2:
                    [self shootMissile];
                    break;
                case 3:
                    [self shootLaser];
                    break;
            }
        }
    }
}
- (void)changeWeaponAngle:(CGFloat)angle target:(CGPoint)target {
    targetPoint = target;
    [self changeWeaponAngle:angle];
}
- (void)changeWeaponAngleIsClock:(BOOL)isClock {
    if (isClock) {
        [self schedule:@selector(changeWeaponAngleClockSchedule:)];
    } else {
        [self schedule:@selector(changeWeaponAngleUnclockSchedule:)];
    }
}


- (void)changeWeaponAngleStop {
    [self unschedule:@selector(changeWeaponAngleClockSchedule:)];
    [self unschedule:@selector(changeWeaponAngleUnclockSchedule:)];
}

- (void)changeWeaponAngleClockSchedule:(ccTime)dt {
    float degrees = CC_RADIANS_TO_DEGREES(-targetAngle);
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 120;
    switch (gameLayer.hud.currentWeapon) {
        case 1:{
            if (vulcan.rotation < degrees) {
                [vulcan setRotation:vulcan.rotation + angularVelocity*deltaTime];
            } else {
                [vulcan setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootVulcan];
            }
            break;
        }
        case 2:{
            if (missile.rotation < degrees) {
                [missile setRotation:missile.rotation + angularVelocity*deltaTime];
            } else {
                [missile setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootMissile];
            }
            break;
        }
        case 3:{
            if (laser.rotation < degrees) {
                [laser setRotation:laser.rotation + angularVelocity*deltaTime];
            } else {
                [laser setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootLaser];
            }
            break;
        }
    }
}
- (void)changeWeaponAngleUnclockSchedule:(ccTime)dt {
    float degrees = CC_RADIANS_TO_DEGREES(-targetAngle);
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 120;
    switch (gameLayer.hud.currentWeapon) {
        case 1:{
            if (vulcan.rotation > degrees) {
                [vulcan setRotation:vulcan.rotation - angularVelocity*deltaTime];
            } else {
                [vulcan setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootVulcan];
            }
            break;
        }
        case 2:{
            if (missile.rotation > degrees) {
                [missile setRotation:missile.rotation - angularVelocity*deltaTime];
            } else {
                [missile setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootMissile];
            }
            break;
        }
        case 3:{
            if (laser.rotation > degrees) {
                [laser setRotation:laser.rotation - angularVelocity*deltaTime];
            } else {
                [laser setRotation:degrees];
                [self gearsActionStop];
                [self changeWeaponAngleStop];
                [self shootLaser];
            }
            break;
        }
    }
}

- (void)shootVulcan {
    [vulcan stopAllActions];
    [vulcan runAction:vulcanAnimate];
    [gameLayer addVulcanBulletWithAngle:targetAngle];
}
- (void)shootMissile {
    [gameLayer addMissileBulletWithTaget:targetPoint];    
}

- (void)shootLaser {
    [laser stopAllActions];
    [laser runAction:laserAnimate];
    [gameLayer addLaserBulletWithAngle:targetAngle];
}

#pragma mark change weapon
- (void)weaponAngleZero {
    [self changeWeaponAngleStop];

    BOOL isWillChange = YES;
    BOOL isClock = YES;
    switch (currentWeapon) {
        case 1:{
            if (vulcan.rotation < 0) {
                isClock = YES;
            } else if (vulcan.rotation > 0) {
                isClock = NO;
            } else {
                isWillChange = NO;
            }
            break;
        }
        case 2:{
            if (missile.rotation < 0) {
                isClock = YES;
            } else if (missile.rotation > 0) {
                isClock = NO;
            } else {
                isWillChange = NO;
            }
            break;
        }
        case 3:{
            if (laser.rotation < 0) {
                isClock = YES;
            } else if (laser.rotation > 0) {
                isClock = NO;
            } else {
                isWillChange = NO;
            }
            break;
        }
    }
    if (isWillChange) {
        [self weaponAngleZeroIsClock:isClock];
    }
}
- (void)weaponAngleZeroIsClock:(BOOL)isClock {
    if (isClock) {
        [self schedule:@selector(weaponAngleZeroClockSchedule:)];
    } else {
        [self schedule:@selector(weaponAngleZeroUnclockSchedule:)];
    }
}

- (void)weaponAngleZeroStop {
    [self unschedule:@selector(weaponAngleZeroClockSchedule:)];
    [self unschedule:@selector(weaponAngleZeroUnclockSchedule:)];
}

- (void)weaponAngleZeroClockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 500;
    switch (currentWeapon) {
        case 1:{
            if (vulcan.rotation < 0) {
                [vulcan setRotation:vulcan.rotation + angularVelocity*deltaTime];
            } else {
                [vulcan setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
        case 2:{
            if (missile.rotation < 0) {
                [missile setRotation:missile.rotation + angularVelocity*deltaTime];
            } else {
                [missile setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
        case 3:{
            if (laser.rotation < 0) {
                [laser setRotation:laser.rotation + angularVelocity*deltaTime];
            } else {
                [laser setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
    }
}
- (void)weaponAngleZeroUnclockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 500;
    switch (currentWeapon) {
        case 1:{
            if (vulcan.rotation > 0) {
                [vulcan setRotation:vulcan.rotation - angularVelocity*deltaTime];
            } else {
                [vulcan setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
        case 2:{
            if (missile.rotation > 0) {
                [missile setRotation:missile.rotation - angularVelocity*deltaTime];
            } else {
                [missile setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
        case 3:{
            if (laser.rotation > 0) {
                [laser setRotation:laser.rotation - angularVelocity*deltaTime];
            } else {
                [laser setRotation:0];
                [self weaponAngleZeroStop];
            }
            break;
        }
    }
}

- (void)weaponAnchorHorizon {
    [self gearsActionStop];
    
    [self gearsActionHighIsClock:YES];
    [self weaponAnchorIsClock:YES];
}
- (void)weaponAnchorVertical {
    [self gearsActionStop];
    
    [self gearsActionHighIsClock:NO];
    [self weaponAnchorIsClock:NO];
}
- (void)weaponAnchorIsClock:(BOOL)isClock {
    if (isClock) {
        [self schedule:@selector(weaponAnchorClockSchedule:)];
    } else {
        [self schedule:@selector(weaponAnchorUnclockSchedule:)];
    }
}

- (void)weaponAnchorStop {
    [self unschedule:@selector(weaponAnchorClockSchedule:)];
    [self unschedule:@selector(weaponAnchorUnclockSchedule:)];
}

- (void)weaponAnchorClockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 480;
    if (weaponAnchor.rotation < 0) {
        [weaponAnchor setRotation:weaponAnchor.rotation + angularVelocity*deltaTime];
    } else {
        [weaponAnchor setRotation:0];
        [self gearsActionStop];
        [self weaponAnchorStop];
        isChangeWeapon = NO;
    }
}
- (void)weaponAnchorUnclockSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat angularVelocity = 480;
    if (weaponAnchor.rotation > -90) {
        [weaponAnchor setRotation:weaponAnchor.rotation - angularVelocity*deltaTime];
    } else {
        [weaponAnchor setRotation:-90];
        [self gearsActionStop];
        [self weaponAnchorStop];
        [self weaponStandDown];
    }
}

- (void)weaponStandDown {
    [self gearsActionStop];
    
    [self gearsActionHighIsClock:NO];
    [self schedule:@selector(weaponStandDownSchedule:)];
}
- (void)weaponStandUp {
    [self gearsActionStop];
    
    [self gearsActionHighIsClock:YES];
    [self schedule:@selector(weaponStandUpSchedule:)];
}

- (void)weaponStandStop {
    [self unschedule:@selector(weaponStandDownSchedule:)];
    [self unschedule:@selector(weaponStandUpSchedule:)];
}

- (void)weaponStandDownSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat speed = 15*GAME_METER;
    
    if (weaponStand.position.y > -90) {
        [weaponStand setPosition:CGPointMake(weaponStand.position.x,
                                             weaponStand.position.y
                                             - speed*deltaTime)];
    } else {
        [self gearsActionStop];
        [self weaponStandStop];
        [vulcan setVisible:NO];
        [missile setVisible:NO];
        [laser setVisible:NO];
        switch (gameLayer.hud.currentWeapon) {
            case 1:
                [vulcan setVisible:YES];
                break;
            case 2:
                [missile setVisible:YES];
                break;
            case 3:
                [laser setVisible:YES];
                break;
        }
        [self weaponStandUp];
    }
}
- (void)weaponStandUpSchedule:(ccTime)dt {
    CGFloat deltaTime = dt;
    CGFloat speed = 15*GAME_METER;
    
    if (weaponStand.position.y < weaponStandPosition.y) {
        [weaponStand setPosition:CGPointMake(weaponStand.position.x,
                                             weaponStand.position.y
                                             + speed*deltaTime)];
    } else {
        [weaponStand setPosition:weaponStandPosition];
        [self gearsActionStop];
        [self weaponStandStop];
        [self weaponAnchorHorizon];
    }
}

- (void)weaponChange {
    isChangeWeapon = YES;
    currentWeapon = gameLayer.hud.currentWeapon;
    [self weaponAngleZero];
    [self weaponAnchorVertical];
}

@end
