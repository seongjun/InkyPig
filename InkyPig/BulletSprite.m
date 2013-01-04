//
//  BulletSprite.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 13..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "BulletSprite.h"


@implementation BulletSprite

@synthesize crashZones;
@synthesize isWillRemove;

- (id)init {
    if ((self = [super init])) {
        //[self setCrashZones:[[CCNode alloc] init]];
        crashZones = [[CCNode alloc] init];
        [crashZones setAnchorPoint:ccp(0.5f, 0.5f)];
        [self setIsWillRemove:NO];
    }
    
    return self;
}

- (void)dealloc {
    [crashZones release];
    
    [super dealloc];
}

@end
