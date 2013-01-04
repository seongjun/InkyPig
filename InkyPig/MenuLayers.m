//
//  MenuLayers.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 23..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MenuLayers.h"
#import "GameLayer.h"
#import "GameDefine.h"
#import "GameUtils.h"
#import "GameData.h"

#pragma mark import sprite
#import "StageNumberSprite.h"
#import "TitleLayerSprite.h"
#import "MainMenuLayerSprite.h"
#import "DifficultySelectLayerSprite.h"
#import "StageSelectLayerSprite.h"
#import "OptionLayerSprite.h"
#import "HelpLayerSprite.h"
#import "UpgradeLayerSprite.h"
#import "UpgradeTowerLayerSprite.h"
#import "UpgradeSkillLayerSprite.h"
#import "UpgradeCharacterLayerSprite.h"
#import "CashShopLayerSprite.h"

@implementation MenuLayers

@synthesize gameData;
@synthesize screenSize;
@synthesize screenCenter;

+ (CCScene *)scene{
    CCScene *scene = [CCScene node];
    
    MenuLayers *layer = [MenuLayers node];
    
    [scene addChild:layer];
    
    return scene;
}

#pragma mark overide
- (id)init {
    if ((self = [super init])) {
        [self setIsTouchEnabled:YES];
        
        [self loadGameData];
        
        [self setScreenSize:[[CCDirector sharedDirector] winSize]];
        [self setScreenCenter:CGPointMake(screenSize.width*0.5f, screenSize.height*0.5f)];
        [self loadSharedSpriteFrameCache];
        [self createLayerSprite];
    }
    
    return self;
}

- (void)dealloc {
    [gameData release];
    [super dealloc];
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if ([titleSprite visible]) {
        [self actionTitleToMainMenu];
    }
    
    if ([mainMenuSprite visible]) {
        if ([GameUtils isTouchInside:[mainMenuSprite playButton] withPosition:location]) {
            [self actionMainMenuToStageSelect];
        }
        if ([GameUtils isTouchInside:[mainMenuSprite optionButton] withPosition:location]) {
            [self actionMainMenuToOptoin];
        }
        if ([GameUtils isTouchInside:[mainMenuSprite infoButton] withPosition:location]) {
            [self actionMainMenuToHelp];
        }
        return;
    }
    
    if ([difficultySelectSprite visible]) {
        if ([GameUtils isTouchInside:[difficultySelectSprite backButton] withPosition:location]) {
            [self actionDifficultySelectToStageSelect];
        }
        if ([GameUtils isTouchInside:[difficultySelectSprite normalButton] withPosition:location]) {
            [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
        }
        if ([GameUtils isTouchInside:[difficultySelectSprite hardButton] withPosition:location]) {
            [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
        }
        if ([GameUtils isTouchInside:[difficultySelectSprite infinityButton] withPosition:location]) {
            [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];
        }
        return;
    }
    
    if ([stageSelectSprite visible]) {
        if ([GameUtils isTouchInside:[stageSelectSprite backButton] withPosition:location]) {
            [self actionStageSelectToMainMenu];
        }
        
        if ([GameUtils isTouchInside:[stageSelectSprite upgradeButton] withPosition:location]) {
            [self actionStageSelectToUpgrade];
        }
        
        for (StageNumberSprite *stage in [[stageSelectSprite stageBoard] children]) {
            if ([GameUtils isTouchInside:stage withPosition:location]) {
                NSLog(@"stage %d", stage.myNumber);
                [gameData setSelectedStage:stage.myNumber];
                [gameData saveGameData];
                [self actionStageSelectToDifficultySelect];
            }
        }
        return;
    }
    
    if ([optionSprite visible]) {
        if ([GameUtils isTouchInside:[optionSprite backButton] withPosition:location]) {
            [self actionOptionToMainMenu];
        }
        
        if ([GameUtils isTouchInside:[optionSprite soundOnButton] withPosition:location]) {
            [optionSprite changeSound];
        }
        
        if ([GameUtils isTouchInside:[optionSprite effectOnButton] withPosition:location]) {
            [optionSprite changeEffect];
        }
        
        if ([GameUtils isTouchInside:[optionSprite vibOnButton] withPosition:location]) {
            [optionSprite changeVib];
        }
        return;
    }
    
    if ([helpSprite visible]) {
        if ([GameUtils isTouchInside:[helpSprite backButton] withPosition:location]) {
            [self actionHelpToMainMenu];
        }
        
        if ([GameUtils isTouchInside:[helpSprite nextButton] withPosition:location]) {
            [helpSprite nextPage];
        }
        
        if ([GameUtils isTouchInside:[helpSprite preButton] withPosition:location]) {
            [helpSprite prePage];
        }
        return;
    }
    
    if ([upgradeSprite visible]) {
        if (![[upgradeSprite cashShopLayerSprite] visible]) {
            if ([GameUtils isTouchInside:[upgradeSprite backButton] withPosition:location]) {
                [self actionUpgradeToStageSelect];
            }
            
            if ([GameUtils isTouchInside:[upgradeSprite upgradeTowerButton] withPosition:location]) {
                [upgradeSprite setLayerAllInvisible];
                [[upgradeSprite upgradeTowerLayerSprite] show];
            }
            
            if ([GameUtils isTouchInside:[upgradeSprite upgradeSkillButton] withPosition:location]) {
                [upgradeSprite setLayerAllInvisible];
                [[upgradeSprite upgradeSkillLayerSprite] show];
            }
            
            if ([GameUtils isTouchInside:[upgradeSprite upgradeCharacterButton] withPosition:location]) {
                [upgradeSprite setLayerAllInvisible];
                [[upgradeSprite upgradeCharacterLayerSprite] show];
            }
            
            if ([GameUtils isTouchInside:[upgradeSprite cashShopButton] withPosition:location]) {
                [[upgradeSprite cashShopLayerSprite] show];
            }
            /*
            if ([[upgradeSprite upgradeTowerLayerSprite] visible]) {
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon1] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:0];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon2] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:1];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon3] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:2];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon4] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:3];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon5] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:4];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon6] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:5];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon7] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:6];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeTowerLayerSprite] icon8] withPosition:location]) {
                    [self setUpgradeTowerWithAbilityIndex:7];
                }
                
                return;
            }
            
            if ([[upgradeSprite upgradeSkillLayerSprite] visible]) {
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon1] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:0];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon2] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:1];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon3] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:2];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon4] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:3];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon5] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:4];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon6] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:5];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeSkillLayerSprite] icon7] withPosition:location]) {
                    [self setUpgradeSkillWithSkillIndex:6];
                }
                
                return;
            }
            
            if ([[upgradeSprite upgradeCharacterLayerSprite] visible]) {
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeCharacterLayerSprite] icon1] withPosition:location]) {
                    [self setUpgradeCharacterWithCharacterIndex:0];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeCharacterLayerSprite] icon2] withPosition:location]) {
                    [self setUpgradeCharacterWithCharacterIndex:1];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeCharacterLayerSprite] icon3] withPosition:location]) {
                    [self setUpgradeCharacterWithCharacterIndex:2];
                }
                if ([GameUtils isTouchInside:[[upgradeSprite upgradeCharacterLayerSprite] icon4] withPosition:location]) {
                    [self setUpgradeCharacterWithCharacterIndex:3];
                }
                
                return;
            }
             */
        }
        
        if ([[upgradeSprite cashShopLayerSprite] visible]) {
            if ([GameUtils isTouchInside:[[upgradeSprite cashShopLayerSprite] closeButton] withPosition:location]) {
                [[upgradeSprite cashShopLayerSprite] hide];
            }
            if ([GameUtils isTouchInside:[[upgradeSprite cashShopLayerSprite] oneButton] withPosition:location]) {
                NSLog(@"IPA");
            }
            if ([GameUtils isTouchInside:[[upgradeSprite cashShopLayerSprite] threeButton] withPosition:location]) {
                NSLog(@"IPA");
            }
            if ([GameUtils isTouchInside:[[upgradeSprite cashShopLayerSprite] fiveButton] withPosition:location]) {
                NSLog(@"IPA");
            }
            if ([GameUtils isTouchInside:[[upgradeSprite cashShopLayerSprite] tenButton] withPosition:location]) {
                NSLog(@"IPA");
            }

            return;
        }
        
        return;
    }
}

#pragma mark preInit
- (void)loadSharedSpriteFrameCache {
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Menu.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"UI_Common.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"UI_Menu.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"StageNumber.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"GameUI.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"Hero.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"EnemyAir.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"EnemyLand.plist"];
}

- (void)createLayerSprite {
    titleSprite = [[TitleLayerSprite alloc] init];
    [self addChild:titleSprite];
    [titleSprite release];
    
    mainMenuSprite = [[MainMenuLayerSprite alloc] init];
    [self addChild:mainMenuSprite];
    [mainMenuSprite release];
    
    difficultySelectSprite = [[DifficultySelectLayerSprite alloc] init];
    [self addChild:difficultySelectSprite];
    [difficultySelectSprite release];
    
    stageSelectSprite = [[StageSelectLayerSprite alloc] init];
    [self addChild:stageSelectSprite];
    [stageSelectSprite release];
    
    optionSprite = [[OptionLayerSprite alloc] init];
    [self addChild:optionSprite];
    [optionSprite release];
    
    helpSprite = [[HelpLayerSprite alloc] init];
    [self addChild:helpSprite];
    [helpSprite release];
    
    upgradeSprite = [[UpgradeLayerSprite alloc] init];
    [self addChild:upgradeSprite];
    [upgradeSprite release];

    for (CCSprite *layerSprite in [self children]) {
        [layerSprite setVisible:NO];
    }
    
    [stageSelectSprite show];
}
#pragma mark Member Function
/*
- (void)setUpgradeTowerWithAbilityIndex:(NSInteger)idx {
    //GameData
    NSInteger currentLevel = [[[gameData abilityLevel] objectAtIndex:idx] integerValue];
    currentLevel++;
    [[gameData abilityLevel] replaceObjectAtIndex:idx
                                       withObject:[NSNumber numberWithInteger:currentLevel]];
    
    //Visible
    switch (idx) {
        case 0:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel1:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice1:currentLevel*100];
            break;
        }
        case 1:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel2:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice2:currentLevel*100];
            break;
        }
        case 2:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel3:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice3:currentLevel*100];
            break;
        }
        case 3:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel4:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice4:currentLevel*100];
            break;
        }
        case 4:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel5:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice5:currentLevel*100];
            break;
        }
        case 5:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel6:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice6:currentLevel*100];
            break;
        }
        case 6:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel7:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice7:currentLevel*100];
            break;
        }
        case 7:{
            [[upgradeSprite upgradeTowerLayerSprite] setLevel8:currentLevel];
            [[upgradeSprite upgradeTowerLayerSprite] setPrice8:currentLevel*100];
            break;
        }
    }
    
    [gameData saveGameData];
}

- (void)setUpgradeSkillWithSkillIndex:(NSInteger)idx {
    //GameData
    NSInteger currentLevel = [[[gameData skillLevel] objectAtIndex:idx] integerValue];
    currentLevel++;
    [[gameData skillLevel] replaceObjectAtIndex:idx
                                       withObject:[NSNumber numberWithInteger:currentLevel]];
    
    //Visible
    switch (idx) {
        case 0:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel1:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice1:currentLevel*100];
            break;
        }
        case 1:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel2:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice2:currentLevel*100];
            break;
        }
        case 2:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel3:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice3:currentLevel*100];
            break;
        }
        case 3:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel4:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice4:currentLevel*100];
            break;
        }
        case 4:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel5:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice5:currentLevel*100];
            break;
        }
        case 5:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel6:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice6:currentLevel*100];
            break;
        }
        case 6:{
            [[upgradeSprite upgradeSkillLayerSprite] setLevel7:currentLevel];
            [[upgradeSprite upgradeSkillLayerSprite] setPrice7:currentLevel*100];
            break;
        }
    }
    [gameData saveGameData];
}

- (void)setUpgradeCharacterWithCharacterIndex:(NSInteger)idx {
    //GameData
    BOOL currentIsCharacter = [[[gameData isCharacter] objectAtIndex:idx] boolValue];
    if (!currentIsCharacter) {
        currentIsCharacter = YES;
        [[gameData isCharacter] replaceObjectAtIndex:idx
                                         withObject:[NSNumber numberWithBool:currentIsCharacter]];
    }
    
    //Visible
    switch (idx) {
        case 0:{
            [[upgradeSprite upgradeCharacterLayerSprite] setPrice1];
            break;
        }
        case 1:{
            [[upgradeSprite upgradeCharacterLayerSprite] setPrice2];
            break;
        }
        case 2:{
            [[upgradeSprite upgradeCharacterLayerSprite] setPrice3];
            break;
        }
        case 3:{
            [[upgradeSprite upgradeCharacterLayerSprite] setPrice4];
            break;
        }
    }
    [gameData saveGameData];
}
*/

#pragma mark layerAction
- (void)actionTitleToMainMenu {
    [titleSprite hide];
    [mainMenuSprite show];
}

- (void)actionMainMenuToStageSelect {
    [mainMenuSprite hide];
    [stageSelectSprite show];
}

- (void)actionMainMenuToOptoin {
    [mainMenuSprite hide];
    [optionSprite show];
}

- (void)actionMainMenuToHelp {
    [mainMenuSprite hide];
    [helpSprite show];
}

- (void)actionDifficultySelectToStageSelect {
    [difficultySelectSprite hide];
    [stageSelectSprite show];
}

- (void)actionStageSelectToMainMenu {
    [stageSelectSprite hide];
    [mainMenuSprite show];
}

- (void)actionStageSelectToDifficultySelect {
    [stageSelectSprite hide];
    [difficultySelectSprite show];
}

- (void)actionStageSelectToUpgrade {
    [stageSelectSprite hide];
    [upgradeSprite show];
}

- (void)actionOptionToMainMenu {
    [optionSprite hide];
    [mainMenuSprite show];
}

- (void)actionHelpToMainMenu {
    [helpSprite hide];
    [mainMenuSprite show];
}

- (void)actionUpgradeToStageSelect {
    [upgradeSprite hide];
    [stageSelectSprite show];
}

#pragma mark GameData
- (void)loadGameData {
    //*
    if ([GameData hasSaveGameData]) {
        GameData *data = [GameData loadGameData];
        GameData *dataTemp = [[GameData alloc] init];
        if ([[data version] isEqualToString:[dataTemp version]]) {
            [self setGameData:data];
        } else {
            NSString *version = [dataTemp version];
            dataTemp = data;
            [dataTemp setVersion:version];
            [self setGameData:dataTemp];
            [gameData saveGameData];
        }
        [dataTemp release];
    } else {
        gameData = [[GameData alloc] init];
        [gameData saveGameData];
    }
}

@end
