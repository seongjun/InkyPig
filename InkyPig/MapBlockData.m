//
//  MapBlockData.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 13..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "MapBlockData.h"

@implementation MapBlockData

@synthesize gradient, positionY;

- (id)initWithGradient:(GradientType)gra positionY:(int)poY {
    if ((self = [super init])) {
        gradient = gra;
        positionY = poY;
    }
    
    return self;
}

@end
