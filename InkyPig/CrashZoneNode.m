//
//  CrashZoneNode.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 8. 31..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "CrashZoneNode.h"
#import "GameDefine.h"

@implementation CrashZoneNode

@synthesize isRect;
@synthesize radius;

- (id)initAsRectWithSize:(CGSize)size {
    if ((self = [super init])) {
        [self setContentSize:size];
        [self setAnchorPoint:CGPointMake(0.5f, 0.5f)];
        isRect = YES;
        radius = 0;
    }
    
    return self;
}

- (id)initAsCircleWithRadius:(CGFloat)rad {
    if ((self = [super init])) {
        [self setContentSize:CGSizeMake(rad*2, rad*2)];
        [self setAnchorPoint:CGPointMake(0.5f, 0.5f)];
        isRect = NO;
        radius = rad;
    }
    
    return self;
}

- (void)draw {
    if (Game_Test) {
        glColor4f(1.0f, 0.0f, 0.0f, 1.0f);
        glLineWidth(1.0f);
        if (isRect) {
            CGPoint leftTop, rightTop, leftBottom, rightBottom;
            leftTop = CGPointMake(0, self.contentSize.height);
            rightTop = CGPointMake(self.contentSize.width, self.contentSize.height);
            leftBottom = CGPointMake(0, 0);
            rightBottom = CGPointMake(self.contentSize.width, 0);
            
            ccDrawLine(leftTop, rightTop);
            ccDrawLine(leftTop, leftBottom);
            ccDrawLine(rightTop, rightBottom);
            ccDrawLine(leftBottom, rightBottom);
        } else {
            CGPoint center = CGPointMake(self.contentSize.width*0.5f,
                                         self.contentSize.height*0.5f);
            
            ccDrawCircle(center, radius, CC_DEGREES_TO_RADIANS(360), 12, NO);
        }
    }
}

@end
