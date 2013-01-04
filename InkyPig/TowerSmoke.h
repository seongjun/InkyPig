//
//  TowerSmoke.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 10. 10..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TowerSmoke : CCSprite {
    CCAnimate *animate;
}

- (id)initSelf;

- (void)removeSelf;

@end
