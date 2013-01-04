//
//  OptionLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@class GameData;

@interface OptionLayerSprite : CCSprite <LayerSprite> {
    GameData *gameData;
    
    CCSprite *backButton;
    CCSprite *soundOnButton;
    CCSprite *soundOffButton;
    CCSprite *effectOnButton;
    CCSprite *effectOffButton;
    CCSprite *vibOnButton;
    CCSprite *vibOffButton;
}

@property (nonatomic, readonly) CCSprite *backButton, *soundOnButton, *soundOffButton, *effectOnButton, *effectOffButton, *vibOnButton, *vibOffButton;

- (void)changeSound;
- (void)changeEffect;
- (void)changeVib;

- (void)setSound;
- (void)setEffect;
- (void)setVib;

@end
