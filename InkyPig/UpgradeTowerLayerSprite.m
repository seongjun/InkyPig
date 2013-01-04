//
//  UpgradeTowerLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MenuLayers.h"
#import "UpgradeTowerLayerSprite.h"
#import "GameData.h"


@implementation UpgradeTowerLayerSprite

@synthesize icon1, icon2, icon3, icon4, icon5, icon6, icon7, icon8;

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
    icon1 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_01.png"];
    [icon1 setPosition:CGPointMake(10
                                   + icon1.contentSize.width*0.5f,
                                   self.contentSize.height
                                   - 100
                                   - icon1.contentSize.height*0.5f)];
    [self addChild:icon1];
    [icon1 release];
    
    icon2 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_02.png"];
    [icon2 setPosition:CGPointMake(self.position.x
                                   + icon2.contentSize.width*0.5f,
                                   icon1.position.y)];
    [self addChild:icon2];
    [icon2 release];
    
    icon3 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_03.png"];
    [icon3 setPosition:CGPointMake(icon1.position.x,
                                   icon1.position.y
                                   - icon1.contentSize.height*0.5f
                                   - 5
                                   - icon3.contentSize.height*0.5f)];
    [self addChild:icon3];
    [icon3 release];
    
    icon4 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_04.png"];
    [icon4 setPosition:CGPointMake(icon2.position.x,
                                   icon3.position.y)];
    [self addChild:icon4];
    [icon4 release];
    
    icon5 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_05.png"];
    [icon5 setPosition:CGPointMake(icon1.position.x,
                                   icon3.position.y
                                   - icon3.contentSize.height*0.5f
                                   - 5
                                   - icon5.contentSize.height*0.5f)];
    [self addChild:icon5];
    [icon5 release];
    
    icon6 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_06.png"];
    [icon6 setPosition:CGPointMake(icon2.position.x,
                                   icon5.position.y)];
    [self addChild:icon6];
    [icon6 release];
    
    icon7 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_07.png"];
    [icon7 setPosition:CGPointMake(icon5.position.x,
                                   icon5.position.y
                                   - icon5.contentSize.height*0.5f
                                   - 5
                                   - icon7.contentSize.height*0.5f)];
    [self addChild:icon7];
    [icon7 release];
    
    icon8 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_abil_08.png"];
    [icon8 setPosition:CGPointMake(icon2.position.x,
                                   icon7.position.y)];
    [self addChild:icon8];
    [icon8 release];
    
    level1 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level1 setPosition:CGPointMake(icon1.position.x
                                    + icon1.contentSize.width*0.5f
                                    + 5
                                    + level1.contentSize.width*0.5f,
                                    icon1.position.y
                                    + level1.contentSize.height*0.5f
                                    + 1)];
    [self addChild:level1];
    [level1 release];
    
    level2 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level2 setPosition:CGPointMake(icon2.position.x
                                    + icon2.contentSize.width*0.5f
                                    + 5
                                    + level2.contentSize.width*0.5f,
                                    level1.position.y)];
    [self addChild:level2];
    [level2 release];
    
    level3 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level3 setPosition:CGPointMake(icon3.position.x
                                    + icon3.contentSize.width*0.5f
                                    + 5
                                    + level3.contentSize.width*0.5f,
                                    icon3.position.y
                                    + level3.contentSize.height*0.5f
                                    + 1)];
    [self addChild:level3];
    [level3 release];

    level4 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level4 setPosition:CGPointMake(icon4.position.x
                                    + icon4.contentSize.width*0.5f
                                    + 5
                                    + level4.contentSize.width*0.5f,
                                    level3.position.y)];
    [self addChild:level4];
    [level4 release];

    level5 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level5 setPosition:CGPointMake(icon5.position.x
                                    + icon5.contentSize.width*0.5f
                                    + 5
                                    + level5.contentSize.width*0.5f,
                                    icon5.position.y
                                    + level5.contentSize.height*0.5f
                                    + 1)];
    [self addChild:level5];
    [level5 release];
    
    level6 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level6 setPosition:CGPointMake(icon6.position.x
                                    + icon6.contentSize.width*0.5f
                                    + 5
                                    + level6.contentSize.width*0.5f,
                                    level5.position.y)];
    [self addChild:level6];
    [level6 release];

    level7 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level7 setPosition:CGPointMake(icon7.position.x
                                    + icon7.contentSize.width*0.5f
                                    + 5
                                    + level7.contentSize.width*0.5f,
                                    icon7.position.y
                                    + level7.contentSize.height*0.5f
                                    + 1)];
    [self addChild:level7];
    [level7 release];

    level8 = [[CCLabelTTF alloc] initWithString:@"Lv. 01"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [level8 setPosition:CGPointMake(icon8.position.x
                                    + icon8.contentSize.width*0.5f
                                    + 5
                                    + level8.contentSize.width*0.5f,
                                    level7.position.y)];
    [self addChild:level8];
    [level8 release];


    // price
    price1 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price1 setPosition:CGPointMake(icon1.position.x
                                    + icon1.contentSize.width*0.5f
                                    + 5
                                    + price1.contentSize.width*0.5f,
                                    icon1.position.y
                                    - price1.contentSize.height*0.5f
                                    - 1)];
    [self addChild:price1];
    [price1 release];
    
    price2 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price2 setPosition:CGPointMake(icon2.position.x
                                    + icon2.contentSize.width*0.5f
                                    + 5
                                    + price2.contentSize.width*0.5f,
                                    price1.position.y)];
    [self addChild:price2];
    [price2 release];

    price3 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price3 setPosition:CGPointMake(icon3.position.x
                                    + icon3.contentSize.width*0.5f
                                    + 5
                                    + price3.contentSize.width*0.5f,
                                    icon3.position.y
                                    - price3.contentSize.height*0.5f
                                    - 1)];
    [self addChild:price3];
    [price3 release];
    
    price4 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price4 setPosition:CGPointMake(icon4.position.x
                                    + icon4.contentSize.width*0.5f
                                    + 5
                                    + price4.contentSize.width*0.5f,
                                    price3.position.y)];
    [self addChild:price4];
    [price4 release];

    price5 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price5 setPosition:CGPointMake(icon5.position.x
                                    + icon5.contentSize.width*0.5f
                                    + 5
                                    + price5.contentSize.width*0.5f,
                                    icon5.position.y
                                    - price5.contentSize.height*0.5f
                                    - 1)];
    [self addChild:price5];
    [price5 release];
    
    price6 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price6 setPosition:CGPointMake(icon6.position.x
                                    + icon6.contentSize.width*0.5f
                                    + 5
                                    + price6.contentSize.width*0.5f,
                                    price5.position.y)];
    [self addChild:price6];
    [price6 release];

    price7 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price7 setPosition:CGPointMake(icon7.position.x
                                    + icon7.contentSize.width*0.5f
                                    + 5
                                    + price7.contentSize.width*0.5f,
                                    icon7.position.y
                                    - price7.contentSize.height*0.5f
                                    - 1)];
    [self addChild:price7];
    [price7 release];
    
    price8 = [[CCLabelTTF alloc] initWithString:@"100G"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [price8 setPosition:CGPointMake(icon8.position.x
                                    + icon8.contentSize.width*0.5f
                                    + 5
                                    + price8.contentSize.width*0.5f,
                                    price7.position.y)];
    [self addChild:price8];
    [price8 release];
}

- (void)show {
    CCScene *scene = [[CCDirector sharedDirector] runningScene];
    if (scene.children.count > 0) {
        CCLayer *layer = (CCLayer *)[[scene children] objectAtIndex:0];
        if ([layer isMemberOfClass:[MenuLayers class]] == YES) {
            MenuLayers *menuLayer = (MenuLayers *)layer;
            gameData = [menuLayer gameData];
            [gameData retain];
        }
    }
    /*
    for (int i=0; i<gameData.abilityLevel.count; i++) {
        NSInteger currentLevel = [[[gameData abilityLevel] objectAtIndex:i] integerValue];
        CCLabelTTF *labelLevel = (CCLabelTTF*)[self valueForKey:[NSString stringWithFormat:@"level%d", i+1]];
        [labelLevel setString:[NSString stringWithFormat:@"Lv. %02d", currentLevel]];
        CCLabelTTF *labelPrice = (CCLabelTTF*)[self valueForKey:[NSString stringWithFormat:@"price%d", i+1]];
        [labelPrice setString:[NSString stringWithFormat:@"%dG", currentLevel*100]];
    }
     */

    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

- (void)setLevel1:(NSInteger)level {
    [level1 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel2:(NSInteger)level {
    [level2 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel3:(NSInteger)level {
    [level3 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel4:(NSInteger)level {
    [level4 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel5:(NSInteger)level {
    [level5 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel6:(NSInteger)level {
    [level6 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel7:(NSInteger)level {
    [level7 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}
- (void)setLevel8:(NSInteger)level {
    [level8 setString:[NSString stringWithFormat:@"Lv. %02d", level]];
}

- (void)setPrice1:(NSInteger)price {
    [price1 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice2:(NSInteger)price {
    [price2 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice3:(NSInteger)price {
    [price3 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice4:(NSInteger)price {
    [price4 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice5:(NSInteger)price {
    [price5 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice6:(NSInteger)price {
    [price6 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice7:(NSInteger)price {
    [price7 setString:[NSString stringWithFormat:@"%dG", price]];
}
- (void)setPrice8:(NSInteger)price {
    [price8 setString:[NSString stringWithFormat:@"%dG", price]];
}

@end
