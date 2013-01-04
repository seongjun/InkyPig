//
//  ScoreNumberFontSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 21..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "ScoreNumberFontSprite.h"


@implementation ScoreNumberFontSprite

- (id)init {
    if ((self = [super init])) {
        [self setContentSize:CGSizeMake(8.0f, 12.0f)];
        for (NSInteger idx = 0; idx < 10; idx++) {
            CCSprite *sprite = [[CCSprite alloc] initWithSpriteFrameName:[NSString stringWithFormat:@"game_UI_score_%d.png", idx]];
            [sprite setPosition:CGPointMake(self.contentSize.width*0.5f, self.contentSize.height*0.5f)];
            [self addChild:sprite z:idx tag:idx];
            [sprite release];
        }
    }
    return self;
}

- (id)initWithNumber:(NSInteger)numValue {
    if ((self = [self init])) {
        [self setNumber:numValue];
    }
    return self;
}

- (void)setNumber:(NSInteger)numValue {
    CCArray *children = [self children];
    for (CCNode *node in children) {
        [node setVisible:false];
    }
    CCNode *num = [self getChildByTag:numValue];
    [num setVisible:YES];
}

- (void)setOpacity:(GLubyte)opacity {
    if ([[self children] count] > 0) {
        for (CCSprite *sprite in [self children]) {
            [sprite setOpacity:opacity];
        }
    }
}

@end
