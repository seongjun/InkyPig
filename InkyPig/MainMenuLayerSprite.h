//
//  MainMenuLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@interface MainMenuLayerSprite : CCSprite <LayerSprite> {
    CCSprite *playButton;
    CCSprite *infoButton;
    CCSprite *optionButton;
}

@property (nonatomic, readonly) CCSprite *playButton, *infoButton, *optionButton;

@end
