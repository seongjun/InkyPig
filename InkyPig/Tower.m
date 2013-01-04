//
//  Tower.m
//  WolfDefence
//
//  Created by Choi Seonghun on 8/30/12.
//  Copyright (c) 2012 Zemico. All rights reserved.
//

#import "Tower.h"

@implementation Tower

@synthesize level;
@synthesize coolTime, defence;
@synthesize maxHP, maxMP, regenerationMP;
@synthesize isSkill3, isSkill4;

- (id)initWithLevel:(NSInteger)lv defence:(CGFloat)df {
    if ((self = [super init])) {
        [self setLevel:lv];
        [self setCoolTime:3.0f];
        [self setDefence:df];
        [self setMaxHP:0];
        [self setMaxMP:0];
        [self setRegenerationMP:0];
        [self setIsSkill3:NO];
        [self setIsSkill4:NO];
    }
    
    return self;
}

#define keyLevel                @"Level"
#define keyCoolTime             @"CoolTime"
#define keyDefence              @"Defence"
#define keyMaxHP                @"MaxHP"
#define keyMaxMP                @"MaxMP"
#define keyRegenerationMP       @"RegenerationMP"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:[self level] forKey:keyLevel];
    [aCoder encodeFloat:[self coolTime] forKey:keyCoolTime];
    [aCoder encodeFloat:[self defence] forKey:keyDefence];
    [aCoder encodeFloat:[self maxHP] forKey:keyMaxHP];
    [aCoder encodeFloat:[self maxMP] forKey:keyMaxMP];
    [aCoder encodeFloat:[self regenerationMP] forKey:keyRegenerationMP];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setLevel:[aDecoder decodeIntegerForKey:keyLevel]];
        [self setCoolTime:[aDecoder decodeFloatForKey:keyCoolTime]];
        [self setDefence:[aDecoder decodeFloatForKey:keyDefence]];
        [self setMaxHP:[aDecoder decodeFloatForKey:keyMaxHP]];
        [self setMaxMP:[aDecoder decodeFloatForKey:keyMaxMP]];
        [self setRegenerationMP:[aDecoder decodeFloatForKey:keyRegenerationMP]];
    }
    return self;
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    Tower *copy = [[[self class] allocWithZone:zone] init];
    [copy setLevel:[self level]];
    [copy setCoolTime:[self coolTime]];
    [copy setDefence:[self defence]];
    [copy setMaxHP:[self maxHP]];
    [copy setMaxMP:[self maxMP]];
    [copy setRegenerationMP:[self regenerationMP]];
    
    return copy;
}


@end
