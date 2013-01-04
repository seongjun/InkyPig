//
//  Tree.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 6..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject <NSCoding, NSCopying> {
    NSInteger currentLevel, maxLevel;
}

@property (nonatomic, readwrite) NSInteger currentLevel, maxLevel;

@end
