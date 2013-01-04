//
//  UpgradeCharacterLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MenuLayers.h"
#import "UpgradeCharacterLayerSprite.h"
#import "GameData.h"


@implementation UpgradeCharacterLayerSprite

@synthesize icon1, icon2, icon3, icon4;

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];
    }
    return self;
}

- (void)dealloc {
    [gameData release];
    [super dealloc];
}

- (void)create {
    icon1 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_char_02.png"];
    [icon1 setPosition:CGPointMake(10
                                   + icon1.contentSize.width*0.5f,
                                   self.contentSize.height
                                   - 100
                                   - icon1.contentSize.height*0.5f)];
    [self addChild:icon1];
    [icon1 release];
    
    icon2 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_char_03.png"];
    [icon2 setPosition:CGPointMake(self.position.x
                                   + icon2.contentSize.width*0.5f,
                                   icon1.position.y)];
    [self addChild:icon2];
    [icon2 release];
    
    icon3 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_char_04.png"];
    [icon3 setPosition:CGPointMake(icon1.position.x,
                                   icon1.position.y
                                   - icon1.contentSize.height*0.5f
                                   - 5
                                   - icon3.contentSize.height*0.5f)];
    [self addChild:icon3];
    [icon3 release];
    
    icon4 = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_char_05.png"];
    [icon4 setPosition:CGPointMake(icon2.position.x,
                                   icon3.position.y)];
    [self addChild:icon4];
    [icon4 release];
        
    name1 = [[CCLabelTTF alloc] initWithString:@"Weapon1"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [name1 setPosition:CGPointMake(icon1.position.x
                                    + icon1.contentSize.width*0.5f
                                    + 5
                                    + name1.contentSize.width*0.5f,
                                    icon1.position.y
                                    + name1.contentSize.height*0.5f
                                    + 1)];
    [self addChild:name1];
    [name1 release];
    
    name2 = [[CCLabelTTF alloc] initWithString:@"Weapon2"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [name2 setPosition:CGPointMake(icon2.position.x
                                    + icon2.contentSize.width*0.5f
                                    + 5
                                    + name2.contentSize.width*0.5f,
                                    name1.position.y)];
    [self addChild:name2];
    [name2 release];
    
    name3 = [[CCLabelTTF alloc] initWithString:@"Weapon3"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [name3 setPosition:CGPointMake(icon3.position.x
                                    + icon3.contentSize.width*0.5f
                                    + 5
                                    + name3.contentSize.width*0.5f,
                                    icon3.position.y
                                    + name3.contentSize.height*0.5f
                                    + 1)];
    [self addChild:name3];
    [name3 release];
    
    name4 = [[CCLabelTTF alloc] initWithString:@"Weapon4"
                                     dimensions:CGSizeMake(50, 20)
                                      alignment:UITextAlignmentLeft
                                       fontName:@"Arial"
                                       fontSize:12];
    [name4 setPosition:CGPointMake(icon4.position.x
                                    + icon4.contentSize.width*0.5f
                                    + 5
                                    + name4.contentSize.width*0.5f,
                                    name3.position.y)];
    [self addChild:name4];
    [name4 release];
        
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
    for (int i=0; i<gameData.isCharacter.count; i++) {
        BOOL currentCharacter = [[[gameData isCharacter] objectAtIndex:i] boolValue];
        if (currentCharacter) {
            CCLabelTTF *labelPrice = (CCLabelTTF*)[self valueForKey:[NSString stringWithFormat:@"price%d", i+1]];
            [labelPrice setString:@"Sold Out"];
        }
    }
     */

    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

- (void)setPrice1 {
    [price1 setString:@"Sold Out"];
}
- (void)setPrice2 {
    [price2 setString:@"Sold Out"];
}
- (void)setPrice3 {
    [price3 setString:@"Sold Out"];
}
- (void)setPrice4 {
    [price4 setString:@"Sold Out"];
}

@end
