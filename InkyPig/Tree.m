//
//  Tree.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 6..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "Tree.h"

@implementation Tree

@synthesize currentLevel, maxLevel;

- (id)init {
    if ((self = [super init])) {
        currentLevel = 0;
        maxLevel = 0;
    }
    
    return self;
}

#define keyCurrentLevel         @"CurrentLevel"
#define keyMaxLevel             @"MaxLevel"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:[self currentLevel] forKey:keyCurrentLevel];
    [aCoder encodeInteger:[self maxLevel] forKey:keyMaxLevel];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setCurrentLevel:[aDecoder decodeIntegerForKey:keyCurrentLevel]];
        [self setMaxLevel:[aDecoder decodeIntegerForKey:keyMaxLevel]];
    }
    return self;
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    Tree *copy = [[[self class] allocWithZone:zone] init];
    [copy setCurrentLevel:[self currentLevel]];
    [copy setMaxLevel:[self maxLevel]];
    
    return copy;
}

@end
