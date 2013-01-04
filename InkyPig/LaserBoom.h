//
//  LaserBoom.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 10. 11..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LaserBoom : CCSprite {
    CCAnimate *animate;
}

- (id)initSelf;

- (void)boomStart;
- (void)boomStop;

@end
