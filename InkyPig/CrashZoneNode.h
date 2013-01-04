//
//  CrashZoneNode.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 8. 31..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CrashZoneNode : CCNode {
    BOOL isRect;
    CGFloat radius;
}

@property (nonatomic, readwrite) BOOL isRect;
@property (nonatomic, readwrite) CGFloat radius;

- (id)initAsRectWithSize:(CGSize)size;
- (id)initAsCircleWithRadius:(CGFloat)rad;

@end
