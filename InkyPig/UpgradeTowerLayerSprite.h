//
//  UpgradeTowerLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@class GameData;

@interface UpgradeTowerLayerSprite : CCSprite <LayerSprite> {
    GameData *gameData;
    
    CCSprite *icon1, *icon2, *icon3, *icon4, *icon5, *icon6, *icon7, *icon8;
    CCLabelTTF *level1, *level2, *level3, *level4, *level5, *level6, *level7, *level8;
    CCLabelTTF *price1, *price2, *price3, *price4, *price5, *price6, *price7, *price8;
}

@property (nonatomic, readonly) CCSprite *icon1, *icon2, *icon3, *icon4, *icon5, *icon6, *icon7, *icon8;

- (void)setLevel1:(NSInteger)level;
- (void)setLevel2:(NSInteger)level;
- (void)setLevel3:(NSInteger)level;
- (void)setLevel4:(NSInteger)level;
- (void)setLevel5:(NSInteger)level;
- (void)setLevel6:(NSInteger)level;
- (void)setLevel7:(NSInteger)level;
- (void)setLevel8:(NSInteger)level;

- (void)setPrice1:(NSInteger)price;
- (void)setPrice2:(NSInteger)price;
- (void)setPrice3:(NSInteger)price;
- (void)setPrice4:(NSInteger)price;
- (void)setPrice5:(NSInteger)price;
- (void)setPrice6:(NSInteger)price;
- (void)setPrice7:(NSInteger)price;
- (void)setPrice8:(NSInteger)price;

@end
