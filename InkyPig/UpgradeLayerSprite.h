//
//  UpgradeLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@class UpgradeTowerLayerSprite;
@class UpgradeSkillLayerSprite;
@class UpgradeCharacterLayerSprite;
@class CashShopLayerSprite;

@interface UpgradeLayerSprite : CCSprite <LayerSprite> {
    CCSprite *backButton;
    CCSprite *upgradeTowerButton;
    CCSprite *upgradeSkillButton;
    CCSprite *upgradeCharacterButton;
    CCSprite *cashShopButton;
    CCSprite *goldBar;
    
    UpgradeTowerLayerSprite *upgradeTowerLayerSprite;
    UpgradeSkillLayerSprite *upgradeSkillLayerSprite;
    UpgradeCharacterLayerSprite *upgradeCharacterLayerSprite;
    CashShopLayerSprite *cashShopLayerSprite;
}

@property (nonatomic, readonly) CCSprite *backButton, *upgradeTowerButton, *upgradeSkillButton, *upgradeCharacterButton, *cashShopButton;
@property (nonatomic, readonly) UpgradeTowerLayerSprite *upgradeTowerLayerSprite;
@property (nonatomic, readonly) UpgradeSkillLayerSprite *upgradeSkillLayerSprite;
@property (nonatomic, readonly) UpgradeCharacterLayerSprite *upgradeCharacterLayerSprite;
@property (nonatomic, readonly) CashShopLayerSprite *cashShopLayerSprite;

- (void)setGoldBarNumber:(NSInteger)number;
- (void)setLayerAllInvisible;

@end
