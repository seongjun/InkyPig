//
//  MissileSmoke.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 10. 11..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MissileSmoke.h"


@implementation MissileSmoke

- (id)initSelf {
    if ((self = [super initWithSpriteFrameName:@"M_b_smoke_01.png"])) {
        NSMutableArray *frames = [[NSMutableArray alloc] init];
        for (int i=1; i<=10; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"M_b_smoke_%02d.png", i]];
            [frames addObject:frame];
        }
        
        CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:0.05f];
        [frames release];
        
        animate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
        [animation release];
    }
    
    return self;
}

- (void)dealloc {
    [animate release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];

    [self runAction:
     [CCSequence actions:
      animate,
      [CCCallFunc actionWithTarget:self
                          selector:@selector(removeSelf)], nil]];
}

- (void)removeSelf {
    CCSprite *parents = (CCSprite *)[self parent];
    [self stopAllActions];
    [parents removeChild:self cleanup:YES];
}

@end
