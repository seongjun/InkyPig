//
//  CashShopLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@interface CashShopLayerSprite : CCSprite <LayerSprite> {
    CCSprite *cashShopBoard;
    CCSprite *closeButton;
    CCSprite *oneButton;
    CCSprite *threeButton;
    CCSprite *fiveButton;
    CCSprite *tenButton;
}

@property (nonatomic, readonly) CCSprite *closeButton, *oneButton, *threeButton, *fiveButton, *tenButton;

@end
