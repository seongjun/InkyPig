//
//  CashShopLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "CashShopLayerSprite.h"


@implementation CashShopLayerSprite

@synthesize closeButton, oneButton, threeButton, fiveButton, tenButton;

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
    cashShopBoard = [[CCSprite alloc] initWithSpriteFrameName:@"menu_upgrade_cashBoard.png"];
    [cashShopBoard setPosition:self.position];
    [self addChild:cashShopBoard];
    [cashShopBoard release];
    
    closeButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_common_quit.png"];
    [closeButton setPosition:CGPointMake(cashShopBoard.position.x
                                         + cashShopBoard.contentSize.width*0.5f
                                         - closeButton.contentSize.width*0.5f,
                                         cashShopBoard.position.y
                                         + cashShopBoard.contentSize.height*0.5f
                                         - closeButton.contentSize.height*0.5f)];
    [self addChild:closeButton];
    [closeButton release];
    
    oneButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_cash_one.png"];
    [oneButton setPosition:CGPointMake(cashShopBoard.position.x
                                       - cashShopBoard.contentSize.width*0.25f,
                                       cashShopBoard.position.y
                                       + cashShopBoard.contentSize.height*0.25f)];
    [self addChild:oneButton];
    [oneButton release];
    
    threeButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_cash_three.png"];
    [threeButton setPosition:CGPointMake(cashShopBoard.position.x
                                         + cashShopBoard.contentSize.width*0.25f,
                                         oneButton.position.y)];
    [self addChild:threeButton];
    [threeButton release];
    
    fiveButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_cash_five.png"];
    [fiveButton setPosition:CGPointMake(oneButton.position.x,
                                        cashShopBoard.position.y
                                        - cashShopBoard.contentSize.height*0.25f)];
    [self addChild:fiveButton];
    [fiveButton release];
    
    tenButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_cash_ten.png"];
    [tenButton setPosition:CGPointMake(threeButton.position.x,
                                       fiveButton.position.y)];
    [self addChild:tenButton];
    [tenButton release];
}

- (void)show {
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

@end
