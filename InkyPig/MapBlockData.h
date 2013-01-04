//
//  MapBlockData.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 13..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefine.h"

@interface MapBlockData : NSObject {
    GradientType gradient;
    int positionY;
}

@property (nonatomic, readonly) GradientType gradient;
@property (nonatomic, readonly) int positionY;

- (id)initWithGradient:(GradientType)gra positionY:(int)poY;

@end
