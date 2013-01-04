//
//  StageSelectLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@interface StageSelectLayerSprite : CCSprite <LayerSprite> {
    CCSprite *backButton;
    CCSprite *stageBoard;
    CCSprite *upgradeButton;
}

@property (nonatomic, readonly) CCSprite *backButton, *stageBoard, *upgradeButton;

@end
