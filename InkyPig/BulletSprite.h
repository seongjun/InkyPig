//
//  BulletSprite.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 13..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameDefine.h"

@interface BulletSprite : CCSprite {
    CCNode *crashZones;
    BOOL isWillRemove;
}

@property (nonatomic, retain) CCNode *crashZones;
@property (nonatomic, readwrite) BOOL isWillRemove;

@end
