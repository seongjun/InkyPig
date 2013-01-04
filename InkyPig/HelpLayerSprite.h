//
//  HelpLayerSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 27..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LayerSprite.h"

@class StageNumberSprite;

@interface HelpLayerSprite : CCSprite <LayerSprite> {
    CCSprite *backButton;
    CCSprite *preButton;
    CCSprite *nextButton;
    StageNumberSprite *pageNumber;
    StageNumberSprite *pageCount;
    CCSprite *helpBoard;
    
    NSInteger currentPage;
}

@property (nonatomic, readonly) CCSprite *backButton, *preButton, *nextButton;

- (void)nextPage;
- (void)prePage;

@end
