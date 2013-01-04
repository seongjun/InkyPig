//
//  GameHUDLayer.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 7..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GamePauseMenuLayerSprite;
@class GameLayer;

@interface GameHUDLayer : CCLayer {
    GameLayer *gameLayer;

    GamePauseMenuLayerSprite * gamePauseMenuLayerSprite;

    CCSprite *pauseButton;
    CCProgressTimer *hpBar;
    CCProgressTimer *mpBar;
    CCSprite *gear;
    CCSprite *uiButtonPause;
    CCSprite *currentHpFont, *maxHpFont, *currentMpFont, *maxMpFont;
    CCSprite *uiGearWeapon, *uiGearWeaponSmall, *uiGearLeftSmall, *uiGearRightSmall;
    CCSprite *uiWeaponCannon, *uiWeaponLaser, *uiWeaponMissile;
    CCSprite *uiCannonText, *uiLaserText, *uiMissileText;
    CCSprite *miniMapBoard, *miniView;
    CCSprite *uiButtonCannon, *uiButtonLaser, *uiButtonMissile;
    CCProgressTimer *coolCannon, *coolLaser, *coolMissile;
    CCSprite *uiSkillCannon1, *uiSkillCannon2, *uiSkillCannon3, *uiSkillCannon4;
    CCSprite *uiSkillLaser1, *uiSkillLaser2, *uiSkillLaser3, *uiSkillLaser4;
    CCSprite *uiSkillMissile1, *uiSkillMissile2, *uiSkillMissile3, *uiSkillMissile4;
    CCProgressTimer *coolSkill1, *coolSkill2, *coolSkill3, *coolSkill4;
    CCSprite *ableSkill1, *ableSkill2, *ableSkill3, *ableSkill4;
    CCSprite *uiUnlock1, *uiUnlock2, *uiUnlock3, *uiUnlock4;
    
    CGFloat currentHp, currentCannonMp, currentMissileMp, currentLaserMp;
    
    NSInteger currentWeapon;
}

@property (nonatomic, readonly) GamePauseMenuLayerSprite * gamePauseMenuLayerSprite;
@property (nonatomic, readonly) CCSprite *uiButtonPause;
@property (nonatomic, readonly) CCSprite *uiButtonCannon, *uiButtonLaser, *uiButtonMissile;
@property (nonatomic, readonly) CCProgressTimer *coolCannon, *coolLaser, *coolMissile;
@property (nonatomic, readonly) CCSprite *uiSkillCannon1, *uiSkillCannon2, *uiSkillCannon3, *uiSkillCannon4;
@property (nonatomic, readonly) CCSprite *uiSkillLaser1, *uiSkillLaser2, *uiSkillLaser3, *uiSkillLaser4;
@property (nonatomic, readonly) CCSprite *uiSkillMissile1, *uiSkillMissile2, *uiSkillMissile3, *uiSkillMissile4;
@property (nonatomic, readonly) CGFloat currentHp;
@property (nonatomic, readonly) NSInteger currentWeapon;

- (id)initWithGameLayer:(GameLayer *)layer;

- (void)createSkillBox;
- (void)createStateBar;
- (void)createPauseMenu;

- (void)setMinimapPosition:(CGFloat)locationX;
- (void)addMinimapEnemy:(CCSprite *)miniEnemy position:(CGPoint)position;
- (void)moveMinimapEnemy:(CCSprite *)miniEnemy position:(CGPoint)position;
- (void)removeMinimapEnemy:(CCSprite *)miniEnemy;

- (void)changeWeapon:(NSInteger)weapon;
- (void)setVisibleCannon:(BOOL)vsble;
- (void)setVisibleMissile:(BOOL)vsble;
- (void)setVisibleLaser:(BOOL)vsble;
- (void)setAbleCannonSkills;
- (void)setAbleMisslieSkills;
- (void)setAbleLaserSkills;

@end
