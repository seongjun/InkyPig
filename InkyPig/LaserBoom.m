//
//  LaserBoom.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 10. 11..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "LaserBoom.h"


@implementation LaserBoom

- (id)initSelf {
    if ((self = [super initWithSpriteFrameName:@"T_L_01.png"])) {
        NSMutableArray *frames = [[NSMutableArray alloc] init];
        for (int i=1; i<=2; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"T_L_%02d.png", i]];
            [frames addObject:frame];
        }
        
        CCAnimation *animation = [[CCAnimation alloc] initWithFrames:frames delay:0.05f];
        [frames release];
        
        animate = [[CCAnimate alloc] initWithAnimation:animation restoreOriginalFrame:NO];
        [animation release];
    }
    [self setVisible:NO];
    
    return self;
}

- (void)dealloc {
    [animate release];
    
    [super dealloc];
}

- (void)onEnter {
    [super onEnter];
    
    [self runAction:
     [CCRepeatForever actionWithAction:animate]];
}

- (void)onExit {
    [super onExit];
    
    [self stopAllActions];
}

- (void)boomStart {
    [self setVisible:YES];
}

- (void)boomStop {
    [self setVisible:NO];
}

@end
