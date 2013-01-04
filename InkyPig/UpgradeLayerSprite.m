//
//  UpgradeLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "UpgradeLayerSprite.h"
#import "StageNumberFontSprite.h"
#import "UpgradeTowerLayerSprite.h"
#import "UpgradeSkillLayerSprite.h"
#import "UpgradeCharacterLayerSprite.h"
#import "CashShopLayerSprite.h"

@implementation UpgradeLayerSprite

@synthesize backButton, upgradeTowerButton, upgradeSkillButton, upgradeCharacterButton, cashShopButton;
@synthesize upgradeTowerLayerSprite, upgradeSkillLayerSprite, upgradeCharacterLayerSprite, cashShopLayerSprite;

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];
    }
    return self;
}

- (void)create {
    backButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_common_back.png"];
    [backButton setPosition:CGPointMake(10 + backButton.contentSize.width*0.5f,
                                        self.contentSize.height - 10 - backButton.contentSize.height*0.5f)];
    [self addChild:backButton];
    [backButton release];

    upgradeTowerButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_upgrade.png"];
    [upgradeTowerButton setPosition:CGPointMake(10
                                                + upgradeTowerButton.contentSize.width*0.5f,
                                                backButton.position.y
                                                - backButton.contentSize.height*0.5f
                                                - upgradeTowerButton.contentSize.height*0.5f)];
    [self addChild:upgradeTowerButton];
    [upgradeTowerButton release];
    upgradeSkillButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_skill.png"];
    [upgradeSkillButton setPosition:CGPointMake(upgradeTowerButton.position.x
                                                + upgradeTowerButton.contentSize.width*0.5f
                                                + 5
                                                + upgradeSkillButton.contentSize.width*0.5f,
                                                upgradeTowerButton.position.y)];
    [self addChild:upgradeSkillButton];
    [upgradeSkillButton release];
    upgradeCharacterButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_character.png"];
    [upgradeCharacterButton setPosition:CGPointMake(upgradeSkillButton.position.x
                                                    + upgradeSkillButton.contentSize.width*0.5f
                                                    + 5
                                                    + upgradeCharacterButton.contentSize.width*0.5f,
                                                    upgradeTowerButton.position.y)];
    [self addChild:upgradeCharacterButton];
    [upgradeCharacterButton release];
    
    cashShopButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_cash.png"];
    [cashShopButton setPosition:CGPointMake(self.contentSize.width
                                            - 10
                                            - cashShopButton.contentSize.width*0.5f,
                                            self.contentSize.height
                                            - cashShopButton.contentSize.height*0.5f)];
    [self addChild:cashShopButton];
    [cashShopButton release];
    
    goldBar = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_goldBar.png"];
    [goldBar setPosition:CGPointMake(cashShopButton.position.x
                                     - cashShopButton.contentSize.width*0.5f
                                     - 5
                                     - goldBar.contentSize.width*0.5f,
                                     cashShopButton.position.y)];
    [self addChild:goldBar];
    [goldBar release];
    
    for (int i=0; i<4; i++) {
        StageNumberFontSprite *number = [[StageNumberFontSprite alloc] initWithNumber:0];
        [number setPosition:CGPointMake(number.contentSize.width*0.5f
                                        + (number.contentSize.width*i),
                                        goldBar.contentSize.height*0.5f)];
        [goldBar addChild:number z:0 tag:i];
        [number release];
    }
    
    upgradeTowerLayerSprite = [[UpgradeTowerLayerSprite alloc] init];
    [self addChild:upgradeTowerLayerSprite];
    [upgradeTowerLayerSprite release];

    upgradeSkillLayerSprite = [[UpgradeSkillLayerSprite alloc] init];
    [self addChild:upgradeSkillLayerSprite];
    [upgradeSkillLayerSprite release];
    
    upgradeCharacterLayerSprite = [[UpgradeCharacterLayerSprite alloc] init];
    [self addChild:upgradeCharacterLayerSprite];
    [upgradeCharacterLayerSprite release];
    
    cashShopLayerSprite = [[CashShopLayerSprite alloc] init];
    [self addChild:cashShopLayerSprite];
    [cashShopLayerSprite release];
}

- (void)show {
    [upgradeTowerLayerSprite show];
    [upgradeSkillLayerSprite hide];
    [upgradeCharacterLayerSprite hide];
    [cashShopLayerSprite hide];
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

- (void)setGoldBarNumber:(NSInteger)number {
    NSInteger currentNumber = number;
    if (currentNumber > 9999) {
        currentNumber = 9999;
    }
    NSString *numberString = [NSString stringWithFormat:@"%04d",currentNumber];
    for (int i=0; i<4; i++) {
        NSString *charNum = [NSString stringWithFormat:@"%c", [numberString characterAtIndex:i]];
        NSInteger charInt = [charNum integerValue];
        StageNumberFontSprite *numberSprite = (StageNumberFontSprite *)[goldBar getChildByTag:i];
        [numberSprite setNumber:charInt];
    }
}

- (void)setLayerAllInvisible {
    [upgradeTowerLayerSprite hide];
    [upgradeSkillLayerSprite hide];
    [upgradeCharacterLayerSprite hide];
}

@end
