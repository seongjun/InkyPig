//
//  TowerPump.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 10. 11..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "TowerPump.h"


@implementation TowerPump

- (id)initSelf {
    if ((self = [super initWithSpriteFrameName:@"tawer_pump_0001.png"])) {
        NSMutableArray *frames = [[NSMutableArray alloc] init];
        for (int i=1; i<=10; i++) {
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"tawer_pump_%04d.png", i]];
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
     [CCRepeatForever actionWithAction:animate]];
}

@end
