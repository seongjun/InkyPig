//
//  UpgradeCharacterLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@class GameData;

@interface UpgradeCharacterLayerSprite : CCSprite <LayerSprite> {
    GameData *gameData;
    
    CCSprite *icon1, *icon2, *icon3, *icon4;
    CCLabelTTF *name1, *name2, *name3, *name4;
    CCLabelTTF *price1, *price2, *price3, *price4;
}

@property (nonatomic, readonly) CCSprite *icon1, *icon2, *icon3, *icon4;

- (void)setPrice1;
- (void)setPrice2;
- (void)setPrice3;
- (void)setPrice4;

@end
