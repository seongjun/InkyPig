//
//  DifficultySelectLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@interface DifficultySelectLayerSprite : CCSprite <LayerSprite>{
    CCSprite *backButton;
    CCSprite *normalButton;
    CCSprite *hardButton;
    CCSprite *infinityButton;
}

@property (nonatomic, readonly) CCSprite *backButton, *normalButton, *hardButton, *infinityButton;

@end
