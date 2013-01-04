//
//  GameHUDLayer.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 7..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "GameHUDLayer.h"
#import "GamePauseMenuLayerSprite.h"

#import "GameLayer.h"
#import "GameData.h"
#import "Tower.h"
#import "Weapon.h"
#import "Skill.h"

#import "ScoreNumberFontSprite.h"
#import "StateNumberFontSprite.h"

#define MINIMAP_SIZE 32
#define MINIMAP_VIWE_START_X miniMapBoard.position.x - 12
#define MINIMAP_START_X 19
#define MINIMAP_START_Y 6
#define MINIMAP_WIDTH 64
#define MINIMAP_HEIGHT 21


@implementation GameHUDLayer

@synthesize gamePauseMenuLayerSprite;
@synthesize uiButtonPause;
@synthesize uiButtonCannon, uiButtonLaser, uiButtonMissile;
@synthesize coolMissile, coolLaser, coolCannon;
@synthesize uiSkillCannon1, uiSkillCannon2, uiSkillCannon3, uiSkillCannon4;
@synthesize uiSkillLaser1, uiSkillLaser2, uiSkillLaser3, uiSkillLaser4;
@synthesize uiSkillMissile1, uiSkillMissile2, uiSkillMissile3, uiSkillMissile4;
@synthesize currentHp;
@synthesize currentWeapon;

- (id)initWithGameLayer:(GameLayer *)layer {
    if ((self = [super init])) {
        gameLayer = layer;
        currentWeapon = 1;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        //[self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];

        [self createSkillBox];
        [self createStateBar];
        [self createPauseMenu];
    }
    
    return self;
}

- (void)onEnter {
    [super onEnter];
    
    [self changeWeapon:1];
    
    [gear runAction:
     [CCRepeatForever actionWithAction:
      [CCRotateBy actionWithDuration:0.1f angle:-5]]];
    //temp
    currentHp = 100;
}

- (void)onExit {
    [super onExit];
    
    [gear stopAllActions];
}

- (void)createSkillBox {
    CCSprite *uiHUDBottom = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_hud_bottom.png"];
    [uiHUDBottom setPosition:CGPointMake(self.contentSize.width*0.5f,
                                         uiHUDBottom.contentSize.height*0.5f)];
    [self addChild:uiHUDBottom z:0];
    [uiHUDBottom release];
    
    CCSprite *uiHUDTop = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_hud_top.png"];
    [uiHUDTop setPosition:CGPointMake(self.contentSize.width*0.5f,
                                      uiHUDTop.contentSize.height*0.5f)];
    [self addChild:uiHUDTop z:2];
    [uiHUDTop release];
    
    uiGearWeapon = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_gear_00.png"];
    [uiGearWeapon setPosition:CGPointMake(18, 32)];
    [self addChild:uiGearWeapon z:3];
    [uiGearWeapon release];
    
    uiGearLeftSmall = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_gear_03.png"];
    [uiGearLeftSmall setPosition:CGPointMake(68,
                                             uiHUDTop.contentSize.height - 7)];
    [self addChild:uiGearLeftSmall z:1];
    [uiGearLeftSmall release];
    
    uiGearRightSmall = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_gear_03.png"];
    [uiGearRightSmall setPosition:CGPointMake(uiHUDTop.contentSize.width
                                              - 11,
                                              uiGearLeftSmall.position.y)];
    [self addChild:uiGearRightSmall z:1];
    [uiGearRightSmall release];
    
    uiWeaponCannon = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_img_cannon.png"];
    [uiWeaponCannon setPosition:uiGearWeapon.position];
    [self addChild:uiWeaponCannon z:4];
    [uiWeaponCannon release];
    
    uiWeaponLaser = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_img_laser.png"];
    [uiWeaponLaser setPosition:uiGearWeapon.position];
    [self addChild:uiWeaponLaser z:4];
    [uiWeaponLaser release];
    
    uiWeaponMissile = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_img_missile.png"];
    [uiWeaponMissile setPosition:uiGearWeapon.position];
    [self addChild:uiWeaponMissile z:4];
    [uiWeaponMissile release];
    
    uiGearWeaponSmall = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_gear_02.png"];
    [uiGearWeaponSmall setPosition:CGPointMake(uiGearWeapon.position.x
                                               + uiGearWeapon.contentSize.width*0.5f
                                               - 5,
                                               uiGearWeaponSmall.contentSize.height*0.5f
                                               - 2)];
    [self addChild:uiGearWeaponSmall z:5];
    [uiGearWeaponSmall release];
    
    CCSprite *scoreBoard = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_score.png"];
    [scoreBoard setPosition:CGPointMake(scoreBoard.contentSize.width*0.5f,
                                        scoreBoard.contentSize.height*0.5f
                                        +7)];
    [self addChild:scoreBoard z:6];
    [scoreBoard release];
    
    uiCannonText = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_cannon.png"];
    [uiCannonText setPosition:CGPointMake(16
                                          + uiCannonText.contentSize.width*0.5f,
                                          uiCannonText.contentSize.height*0.5f
                                          + 11)];
    [self addChild:uiCannonText z:7];
    [uiCannonText release];
    
    uiLaserText = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_laser.png"];
    [uiLaserText setPosition:uiCannonText.position];
    [self addChild:uiLaserText z:7];
    [uiLaserText release];
    
    uiMissileText = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_missile.png"];
    [uiMissileText setPosition:uiCannonText.position];
    [self addChild:uiMissileText z:7];
    [uiMissileText release];
    
    for (int i=1; i<=8; i++) {
        ScoreNumberFontSprite *number = [[ScoreNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(scoreBoard.contentSize.width
                                        - 7
                                        - number.contentSize.width*0.5
                                        - (number.contentSize.width*(i-1)),
                                        scoreBoard.contentSize.height*0.5f)];
        [scoreBoard addChild:number z:0 tag:i];
        [number release];
    }
    
    miniMapBoard = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_minimap.png"];
    [miniMapBoard setPosition:CGPointMake(uiGearWeapon.position.x
                                          + uiGearWeapon.contentSize.width*0.5f
                                          + miniMapBoard.contentSize.width*0.5f
                                          - 2,
                                          scoreBoard.position.y
                                          + scoreBoard.contentSize.height*0.5f
                                          + miniMapBoard.contentSize.height*0.5f
                                          )];
    [self addChild:miniMapBoard z:3];
    [miniMapBoard release];
    miniView = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_view.png"];
    [miniView setPosition:CGPointMake(MINIMAP_VIWE_START_X,
                                      miniMapBoard.position.y
                                      - 1)];
    [self addChild:miniView z:4];
    [miniView release];
    
    uiButtonCannon = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_vulcan.png"];
    [uiButtonCannon setPosition:CGPointMake(160
                                            + uiButtonCannon.contentSize.width*0.5f,
                                            12
                                            + uiButtonCannon.contentSize.height*0.5f)];
    [self addChild:uiButtonCannon z:3];
    [uiButtonCannon release];
    
    uiButtonMissile = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_missile.png"];
    [uiButtonMissile setPosition:CGPointMake(uiButtonCannon.position.x
                                             + 2
                                             + uiButtonMissile.contentSize.width,
                                             uiButtonCannon.position.y)];
    [self addChild:uiButtonMissile z:3];
    [uiButtonMissile release];

    uiButtonLaser = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_laser.png"];
    [uiButtonLaser setPosition:CGPointMake(uiButtonMissile.position.x
                                           + 2
                                           + uiButtonLaser.contentSize.width,
                                           uiButtonCannon.position.y)];
    [self addChild:uiButtonLaser z:3];
    [uiButtonLaser release];
    
    //weapon cool time
    coolCannon = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolCannon setType:kCCProgressTimerTypeVerticalBarBT];
    [coolCannon setPercentage:100.0f];
    [coolCannon setPosition:CGPointMake(uiButtonCannon.position.x,
                                        uiButtonCannon.position.y
                                        + 6)];
    [self addChild:coolCannon z:4];
    [coolCannon release];
    
    coolMissile = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolMissile setType:kCCProgressTimerTypeVerticalBarBT];
    [coolMissile setPercentage:100.0f];
    [coolMissile setPosition:CGPointMake(uiButtonMissile.position.x,
                                         uiButtonMissile.position.y
                                         + 6)];
    [self addChild:coolMissile z:4];
    [coolMissile release];
    
    coolLaser = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolLaser setType:kCCProgressTimerTypeVerticalBarBT];
    [coolLaser setPercentage:100.0f];
    [coolLaser setPosition:CGPointMake(uiButtonLaser.position.x,
                                       uiButtonLaser.position.y
                                       + 6)];
    [self addChild:coolLaser z:4];
    [coolLaser release];
    
    // skill
    uiSkillCannon1 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_1_1.png"];
    [uiSkillCannon1 setPosition:CGPointMake(uiButtonLaser.position.x
                                            + uiButtonLaser.contentSize.width*0.5f
                                            + 10
                                            + uiSkillCannon1.contentSize.width*0.5f,
                                            uiButtonCannon.position.y
                                            - 2)];
    [self addChild:uiSkillCannon1 z:3];
    [uiSkillCannon1 release];
    
    uiSkillCannon2 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_1_2.png"];
    [uiSkillCannon2 setPosition:CGPointMake(uiSkillCannon1.position.x
                                            + 1
                                            + uiSkillCannon2.contentSize.width,
                                            uiSkillCannon1.position.y)];
    [self addChild:uiSkillCannon2 z:3];
    [uiSkillCannon2 release];
    
    uiSkillCannon3 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_1_3.png"];
    [uiSkillCannon3 setPosition:CGPointMake(uiSkillCannon2.position.x
                                            + 1
                                            + uiSkillCannon3.contentSize.width,
                                            uiSkillCannon1.position.y)];
    [self addChild:uiSkillCannon3 z:3];
    [uiSkillCannon3 release];
    
    uiSkillCannon4 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_1_4.png"];
    [uiSkillCannon4 setPosition:CGPointMake(uiSkillCannon3.position.x
                                            + 1
                                            + uiSkillCannon4.contentSize.width,
                                            uiSkillCannon1.position.y)];
    [self addChild:uiSkillCannon4 z:3];
    [uiSkillCannon4 release];

    uiSkillMissile1 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_2_1.png"];
    [uiSkillMissile1 setPosition:uiSkillCannon1.position];
    [self addChild:uiSkillMissile1 z:3];
    [uiSkillMissile1 release];
    
    uiSkillMissile2 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_2_2.png"];
    [uiSkillMissile2 setPosition:uiSkillCannon2.position];
    [self addChild:uiSkillMissile2 z:3];
    [uiSkillMissile2 release];
    
    uiSkillMissile3 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_2_3.png"];
    [uiSkillMissile3 setPosition:uiSkillCannon3.position];
    [self addChild:uiSkillMissile3 z:3];
    [uiSkillMissile3 release];
    
    uiSkillMissile4 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_2_4.png"];
    [uiSkillMissile4 setPosition:uiSkillCannon4.position];
    [self addChild:uiSkillMissile4 z:3];
    [uiSkillMissile4 release];
    
    uiSkillLaser1 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_3_1.png"];
    [uiSkillLaser1 setPosition:uiSkillCannon1.position];
    [self addChild:uiSkillLaser1 z:3];
    [uiSkillLaser1 release];
    
    uiSkillLaser2 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_3_2.png"];
    [uiSkillLaser2 setPosition:uiSkillCannon2.position];
    [self addChild:uiSkillLaser2 z:3];
    [uiSkillLaser2 release];
    
    uiSkillLaser3 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_3_3.png"];
    [uiSkillLaser3 setPosition:uiSkillCannon3.position];
    [self addChild:uiSkillLaser3 z:3];
    [uiSkillLaser3 release];
    
    uiSkillLaser4 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_btn_skill_3_4.png"];
    [uiSkillLaser4 setPosition:uiSkillCannon4.position];
    [self addChild:uiSkillLaser4 z:3];
    [uiSkillLaser4 release];

    // skill cool time
    coolSkill1 = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolSkill1 setType:kCCProgressTimerTypeVerticalBarBT];
    [coolSkill1 setPosition:CGPointMake(uiSkillCannon1.position.x,
                                        uiSkillCannon1.position.y
                                        + 6)];
    [self addChild:coolSkill1 z:4];
    [coolSkill1 release];
    
    coolSkill2 = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolSkill2 setType:kCCProgressTimerTypeVerticalBarBT];
    [coolSkill2 setPosition:CGPointMake(uiSkillCannon2.position.x,
                                        uiSkillCannon2.position.y
                                        + 6)];
    [self addChild:coolSkill2 z:4];
    [coolSkill2 release];
    
    coolSkill3 = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolSkill3 setType:kCCProgressTimerTypeVerticalBarBT];
    [coolSkill3 setPosition:CGPointMake(uiSkillCannon3.position.x,
                                        uiSkillCannon3.position.y
                                        + 6)];
    [self addChild:coolSkill3 z:4];
    [coolSkill3 release];
    
    coolSkill4 = [[CCProgressTimer alloc] initWithFile:@"game_UI_cool.png"];
    [coolSkill4 setType:kCCProgressTimerTypeVerticalBarBT];
    [coolSkill4 setPosition:CGPointMake(uiSkillCannon4.position.x,
                                        uiSkillCannon4.position.y
                                        + 6)];
    [self addChild:coolSkill4 z:4];
    [coolSkill4 release];
    
    // able
    ableSkill1 = [[CCSprite alloc] initWithFile:@"game_UI_cool.png"];
    [ableSkill1 setPosition:coolSkill1.position];
    [self addChild:ableSkill1 z:5];
    [ableSkill1 release];
    
    ableSkill2 = [[CCSprite alloc] initWithFile:@"game_UI_cool.png"];
    [ableSkill2 setPosition:coolSkill2.position];
    [self addChild:ableSkill2 z:5];
    [ableSkill2 release];
    
    ableSkill3 = [[CCSprite alloc] initWithFile:@"game_UI_cool.png"];
    [ableSkill3 setPosition:coolSkill3.position];
    [self addChild:ableSkill3 z:5];
    [ableSkill3 release];
    
    ableSkill4 = [[CCSprite alloc] initWithFile:@"game_UI_cool.png"];
    [ableSkill4 setPosition:coolSkill4.position];
    [self addChild:ableSkill4 z:5];
    [ableSkill4 release];
    
    // unlock
    uiUnlock1 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_unknown.png"];
    [uiUnlock1 setPosition:uiSkillCannon1.position];
    [self addChild:uiUnlock1 z:6];
    [uiUnlock1 release];
    
    uiUnlock2 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_unknown.png"];
    [uiUnlock2 setPosition:uiSkillCannon2.position];
    [self addChild:uiUnlock2 z:6];
    [uiUnlock2 release];
    
    uiUnlock3 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_unknown.png"];
    [uiUnlock3 setPosition:uiSkillCannon3.position];
    [self addChild:uiUnlock3 z:6];
    [uiUnlock3 release];
    
    uiUnlock4 = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_unknown.png"];
    [uiUnlock4 setPosition:uiSkillCannon4.position];
    [self addChild:uiUnlock4 z:6];
    [uiUnlock4 release];
}
- (void)createStateBar {
    CCSprite *stateBoard = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_hud_lamp.png"];
    [stateBoard setPosition:CGPointMake(self.contentSize.width*0.5f,
                                        self.contentSize.height
                                        - stateBoard.contentSize.height*0.5f
                                        - 5)];
    [self addChild:stateBoard];
    [stateBoard release];
    
    hpBar = [[CCProgressTimer alloc] initWithFile:@"game_UI_bar_hp.png"];
    [hpBar setType:kCCProgressTimerTypeHorizontalBarRL];
    [hpBar setPercentage:100.0f];
    [hpBar setPosition:CGPointMake(stateBoard.position.x
                                   - 19
                                   - hpBar.contentSize.width*0.5f,
                                   stateBoard.position.y
                                   + 6)];
    [self addChild:hpBar z:1];
    [hpBar release];
    
    mpBar = [[CCProgressTimer alloc] initWithFile:@"game_UI_bar_en.png"];
    [mpBar setType:kCCProgressTimerTypeHorizontalBarLR];
    [mpBar setPercentage:100.0f];
    [mpBar setPosition:CGPointMake(stateBoard.position.x
                                   + 19
                                   + mpBar.contentSize.width*0.5f,
                                   hpBar.position.y)];
    [self addChild:mpBar z:1];
    [mpBar release];
    
    gear = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_gear_01.png"];
    [gear setPosition:CGPointMake(stateBoard.position.x,
                                  stateBoard.position.y
                                  + 2)];
    [self addChild:gear z:1];
    [gear release];
    
    uiButtonPause = [[CCSprite alloc] initWithSpriteFrameName:@"game_UI_stop.png"];
    [uiButtonPause setPosition:CGPointMake(gear.position.x
                                           + 1,
                                           gear.position.y)];
    [self addChild:uiButtonPause z:2];
    [uiButtonPause release];
    
    // Font
    maxHpFont = [[CCSprite alloc] init];
    [maxHpFont setContentSize:CGSizeMake(24, 10)];
    [maxHpFont setPosition:CGPointMake(gear.position.x
                                   - maxHpFont.contentSize.width*0.5f
                                   - 34,
                                   gear.position.y
                                   - 12)];
    [self addChild:maxHpFont z:1];
    [maxHpFont release];
    
    currentHpFont = [[CCSprite alloc] init];
    [currentHpFont setContentSize:CGSizeMake(24, 10)];
    [currentHpFont setPosition:CGPointMake(maxHpFont.position.x
                                       - currentHpFont.contentSize.width
                                       - 6,
                                       maxHpFont.position.y)];
    [self addChild:currentHpFont z:1];
    [currentHpFont release];
    
    currentMpFont = [[CCSprite alloc] init];
    [currentMpFont setContentSize:CGSizeMake(24, 10)];
    [currentMpFont setPosition:CGPointMake(gear.position.x
                                       + currentMpFont.contentSize.width*0.5f
                                       + 52,
                                       maxHpFont.position.y)];
    [self addChild:currentMpFont z:1];
    [currentMpFont release];
    
    maxMpFont = [[CCSprite alloc] init];
    [maxMpFont setContentSize:CGSizeMake(24, 10)];
    [maxMpFont setPosition:CGPointMake(currentMpFont.position.x
                                   + maxMpFont.contentSize.width
                                   + 6,
                                   maxHpFont.position.y)];
    [self addChild:maxMpFont z:1];
    [maxMpFont release];
    
    for (int i=1; i<=4; i++) {
        StateNumberFontSprite *number = [[StateNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(maxHpFont.contentSize.width
                                        - number.contentSize.width*0.5
                                        - (number.contentSize.width*(i-1)),
                                        maxHpFont.contentSize.height*0.5f)];
        [maxHpFont addChild:number z:0 tag:i];
        [number release];
    }
    for (int i=1; i<=4; i++) {
        StateNumberFontSprite *number = [[StateNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(currentHpFont.contentSize.width
                                        - number.contentSize.width*0.5
                                        - (number.contentSize.width*(i-1)),
                                        currentHpFont.contentSize.height*0.5f)];
        [currentHpFont addChild:number z:0 tag:i];
        [number release];
    }
    for (int i=1; i<=4; i++) {
        StateNumberFontSprite *number = [[StateNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(currentMpFont.contentSize.width
                                        - number.contentSize.width*0.5
                                        - (number.contentSize.width*(i-1)),
                                        currentMpFont.contentSize.height*0.5f)];
        [currentMpFont addChild:number z:0 tag:i];
        [number release];
    }
    for (int i=1; i<=4; i++) {
        StateNumberFontSprite *number = [[StateNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(maxMpFont.contentSize.width
                                        - number.contentSize.width*0.5
                                        - (number.contentSize.width*(i-1)),
                                        maxMpFont.contentSize.height*0.5f)];
        [maxMpFont addChild:number z:0 tag:i];
        [number release];
    }
}
- (void)createPauseMenu {
    gamePauseMenuLayerSprite = [[GamePauseMenuLayerSprite alloc] initWithGameLayer:gameLayer];
    [self addChild:gamePauseMenuLayerSprite z:10];
    [gamePauseMenuLayerSprite setVisible:NO];
    [gamePauseMenuLayerSprite release];
}

- (void)setMinimapPosition:(CGFloat)locationX {
    CGFloat distance = MINIMAP_SIZE*locationX/480.0f;
    [miniView setPosition:CGPointMake(MINIMAP_VIWE_START_X
                                      - distance,
                                      miniView.position.y)];
}
- (void)addMinimapEnemy:(CCSprite *)miniEnemy position:(CGPoint)position {
    CGFloat distanceX = MINIMAP_WIDTH*position.x/960.0f;
    CGFloat distanceY = MINIMAP_HEIGHT*position.y/320.0f;
    [miniEnemy setPosition:CGPointMake(MINIMAP_START_X + distanceX,
                                       MINIMAP_START_Y + distanceY)];
    [miniMapBoard addChild:miniEnemy z:0];
    [miniEnemy release];
}
- (void)moveMinimapEnemy:(CCSprite *)miniEnemy position:(CGPoint)position {
    CGFloat distanceX = MINIMAP_WIDTH*position.x/960.0f;
    CGFloat distanceY = MINIMAP_HEIGHT*position.y/320.0f;
    [miniEnemy setPosition:CGPointMake(MINIMAP_START_X + distanceX,
                                       MINIMAP_START_Y + distanceY)];
}
- (void)removeMinimapEnemy:(CCSprite *)miniEnemy {
    [miniMapBoard removeChild:miniEnemy cleanup:YES];
}

- (void)changeWeapon:(NSInteger)weapon {
    currentWeapon = weapon;
    switch (weapon) {
        case 1:{
            [self setVisibleCannon:YES];
            [self setVisibleMissile:NO];
            [self setVisibleLaser:NO];
            break;
        }
        case 2:{
            [self setVisibleCannon:NO];
            [self setVisibleMissile:YES];
            [self setVisibleLaser:NO];
            break;
        }
        case 3:{
            [self setVisibleCannon:NO];
            [self setVisibleMissile:NO];
            [self setVisibleLaser:YES];
            break;
        }
    }
    [uiGearWeapon runAction:
     [CCRotateBy actionWithDuration:1.0f angle:90]];
    [uiGearWeaponSmall runAction:
     [CCRotateBy actionWithDuration:1.0f angle:-360]];
    [uiGearLeftSmall runAction:
     [CCRotateBy actionWithDuration:1.0f angle:-270]];
    [uiGearRightSmall runAction:
     [CCRotateBy actionWithDuration:1.0f angle:-270]];
}

- (void)setVisibleCannon:(BOOL)vsble {
    [uiWeaponCannon setVisible:vsble];
    [uiCannonText setVisible:vsble];
    [uiSkillCannon1 setVisible:vsble];
    [uiSkillCannon2 setVisible:vsble];
    [uiSkillCannon3 setVisible:vsble];
    [uiSkillCannon4 setVisible:vsble];
    if (vsble) {
        CGFloat coolTime = [[[gameLayer gameData] tower] coolTime];
        [coolCannon setPercentage:100.0f];
        [coolMissile runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];
        [coolLaser runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];
        
        //skill unlock
        [uiUnlock1 setVisible:![[[gameLayer gameData] skillCannon1] isUnlock]];
        [uiUnlock2 setVisible:![[[gameLayer gameData] skillCannon2] isUnlock]];
        [uiUnlock3 setVisible:![[[gameLayer gameData] skillCannon3] isUnlock]];
        [uiUnlock4 setVisible:![[[gameLayer gameData] skillCannon4] isUnlock]];
        [self unschedule:@selector(setAbleMisslieSkills)];
        [self unschedule:@selector(setAbleLaserSkills)];
        [self schedule:@selector(setAbleCannonSkills)];
    }
}
- (void)setVisibleMissile:(BOOL)vsble {
    [uiWeaponMissile setVisible:vsble];
    [uiMissileText setVisible:vsble];
    [uiSkillMissile1 setVisible:vsble];
    [uiSkillMissile2 setVisible:vsble];
    [uiSkillMissile3 setVisible:vsble];
    [uiSkillMissile4 setVisible:vsble];
    if (vsble) {
        CGFloat coolTime = [[[gameLayer gameData] tower] coolTime];
        [coolCannon runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];
        [coolMissile setPercentage:100.0f];
        [coolLaser runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];

        //skill unlock
        [uiUnlock1 setVisible:![[[gameLayer gameData] skillMissile1] isUnlock]];
        [uiUnlock2 setVisible:![[[gameLayer gameData] skillMissile2] isUnlock]];
        [uiUnlock3 setVisible:![[[gameLayer gameData] skillMissile3] isUnlock]];
        [uiUnlock4 setVisible:![[[gameLayer gameData] skillMissile4] isUnlock]];
        [self unschedule:@selector(setAbleCannonSkills)];
        [self unschedule:@selector(setAbleLaserSkills)];
        [self schedule:@selector(setAbleMisslieSkills)];
    }
}
- (void)setVisibleLaser:(BOOL)vsble {
    [uiWeaponLaser setVisible:vsble];
    [uiLaserText setVisible:vsble];
    [uiSkillLaser1 setVisible:vsble];
    [uiSkillLaser2 setVisible:vsble];
    [uiSkillLaser3 setVisible:vsble];
    [uiSkillLaser4 setVisible:vsble];
    if (vsble) {
        CGFloat coolTime = [[[gameLayer gameData] tower] coolTime];
        [coolCannon runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];
        [coolMissile runAction:
         [CCProgressFromTo actionWithDuration:coolTime
                                         from:100 to:0]];
        [coolLaser setPercentage:100.0f];

        //skill unlock
        [uiUnlock1 setVisible:![[[gameLayer gameData] skillLaser1] isUnlock]];
        [uiUnlock2 setVisible:![[[gameLayer gameData] skillLaser2] isUnlock]];
        [uiUnlock3 setVisible:![[[gameLayer gameData] skillLaser3] isUnlock]];
        [uiUnlock4 setVisible:![[[gameLayer gameData] skillLaser4] isUnlock]];
        [self unschedule:@selector(setAbleCannonSkills)];
        [self unschedule:@selector(setAbleMisslieSkills)];
        [self schedule:@selector(setAbleLaserSkills)];
    }
}

- (void)setAbleCannonSkills {
    if ([[[gameLayer gameData] skillCannon1] requiredMP] <= currentCannonMp) {
        [ableSkill1 setVisible:NO];
    } else {
        [ableSkill1 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillCannon2] requiredMP] <= currentCannonMp) {
        [ableSkill2 setVisible:NO];
    } else {
        [ableSkill2 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillCannon3] requiredMP] <= currentCannonMp) {
        [ableSkill3 setVisible:NO];
    } else {
        [ableSkill3 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillCannon4] requiredMP] <= currentCannonMp) {
        [ableSkill4 setVisible:NO];
    } else {
        [ableSkill4 setVisible:YES];
    }
}
- (void)setAbleMisslieSkills {
    if ([[[gameLayer gameData] skillMissile1] requiredMP] <= currentMissileMp) {
        [ableSkill1 setVisible:NO];
    } else {
        [ableSkill1 setVisible:YES];
    }

    if ([[[gameLayer gameData] skillMissile2] requiredMP] <= currentMissileMp) {
        [ableSkill2 setVisible:NO];
    } else {
        [ableSkill2 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillMissile3] requiredMP] <= currentMissileMp) {
        [ableSkill3 setVisible:NO];
    } else {
        [ableSkill3 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillMissile4] requiredMP] <= currentMissileMp) {
        [ableSkill4 setVisible:NO];
    } else {
        [ableSkill4 setVisible:YES];
    }
}
- (void)setAbleLaserSkills {
    if ([[[gameLayer gameData] skillLaser1] requiredMP] <= currentLaserMp) {
        [ableSkill1 setVisible:NO];
    } else {
        [ableSkill1 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillLaser1] requiredMP] <= currentLaserMp) {
        [ableSkill2 setVisible:NO];
    } else {
        [ableSkill2 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillLaser1] requiredMP] <= currentLaserMp) {
        [ableSkill3 setVisible:NO];
    } else {
        [ableSkill3 setVisible:YES];
    }
    
    if ([[[gameLayer gameData] skillLaser1] requiredMP] <= currentLaserMp) {
        [ableSkill4 setVisible:NO];
    } else {
        [ableSkill4 setVisible:YES];
    }
}

@end
