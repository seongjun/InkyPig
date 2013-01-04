//
//  MenuLayers.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 23..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class TitleLayerSprite;
@class MainMenuLayerSprite;
@class DifficultySelectLayerSprite;
@class StageSelectLayerSprite;
@class OptionLayerSprite;
@class HelpLayerSprite;
@class UpgradeLayerSprite;
@class GameData;

@interface MenuLayers : CCLayer {
    GameData *gameData;
    
    CGSize screenSize;
    CGPoint screenCenter;
    TitleLayerSprite *titleSprite;
    MainMenuLayerSprite *mainMenuSprite;
    DifficultySelectLayerSprite *difficultySelectSprite;
    StageSelectLayerSprite *stageSelectSprite;
    OptionLayerSprite *optionSprite;
    HelpLayerSprite *helpSprite;
    UpgradeLayerSprite *upgradeSprite;
}

@property (nonatomic, retain) GameData *gameData;
@property (nonatomic, readwrite) CGSize screenSize;
@property (nonatomic, readwrite) CGPoint screenCenter;

+ (CCScene *)scene;

#pragma mark preInit
- (void)loadSharedSpriteFrameCache;
- (void)createLayerSprite;

#pragma mark Member Function
//- (void)setUpgradeTowerWithAbilityIndex:(NSInteger)idx;
//- (void)setUpgradeSkillWithSkillIndex:(NSInteger)idx;
//- (void)setUpgradeCharacterWithCharacterIndex:(NSInteger)idx;

#pragma mark layerAction
- (void)actionTitleToMainMenu;
- (void)actionMainMenuToStageSelect;
- (void)actionMainMenuToOptoin;
- (void)actionMainMenuToHelp;
- (void)actionDifficultySelectToStageSelect;
- (void)actionStageSelectToMainMenu;
- (void)actionStageSelectToDifficultySelect;
- (void)actionStageSelectToUpgrade;
- (void)actionOptionToMainMenu;
- (void)actionHelpToMainMenu;
- (void)actionUpgradeToStageSelect;

#pragma mark GameData
- (void)loadGameData;

@end
