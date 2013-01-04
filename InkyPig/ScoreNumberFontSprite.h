//
//  ScoreNumberFontSprite.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 21..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ScoreNumberFontSprite : CCSprite {
    
}
- (id)initWithNumber:(NSInteger)numValue;
- (void)setNumber:(NSInteger)numValue;

@end
