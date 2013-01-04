//
//  Weapon.m
//  WolfDefence
//
//  Created by Choi Seonghun on 8/29/12.
//  Copyright (c) 2012 Zemico. All rights reserved.
//

#import "Weapon.h"

@implementation Weapon

@synthesize airMin, airMax, landMin, landMax;
@synthesize bulletSpeed, delayTime;
@synthesize lengthCount, sprayCount;
@synthesize splashRange, splashDamage;
@synthesize requiredMP;
@synthesize piercingCount;

#pragma mark Overriding
- (id)init {
    if ((self = [super init])) {
        [self setAirMin:0];
        [self setAirMax:0];
        [self setLandMin:0];
        [self setLandMax:0];
        [self setBulletSpeed:0.0f];
        [self setDelayTime:0.0f];
        [self setLengthCount:0];
        [self setSprayCount:0];
        [self setSplashRange:0.0f];
        [self setSplashDamage:0.0f];
        [self setRequiredMP:0];
        [self setPiercingCount:0];
    }
    
    return self;
}

#define keyAirMin               @"AirMin"
#define keyAirMax               @"AirMax"
#define keyLandMin              @"LandMin"
#define keyLandMax              @"LandMax"
#define keyBulletSpped          @"BulletSpeed"
#define keyDelayTime            @"DelayTime"
#define keyLengthCount          @"LengthCount"
#define keySprayCount           @"SprayCount"
#define keySplashRange          @"SplashRange"
#define keySplashDamage         @"SplashDamage"
#define keyRequireMP            @"RequireMP"
#define keyPiercingCount        @"PiercingCount"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:[self airMin] forKey:keyAirMin];
    [aCoder encodeFloat:[self airMax] forKey:keyAirMax];
    [aCoder encodeFloat:[self landMin] forKey:keyLandMin];
    [aCoder encodeFloat:[self landMax] forKey:keyLandMax];
    [aCoder encodeFloat:[self bulletSpeed] forKey:keyBulletSpped];
    [aCoder encodeFloat:[self delayTime] forKey:keyDelayTime];
    [aCoder encodeInteger:[self lengthCount] forKey:keyLengthCount];
    [aCoder encodeInteger:[self sprayCount] forKey:keySprayCount];
    [aCoder encodeFloat:[self splashRange] forKey:keySplashRange];
    [aCoder encodeFloat:[self splashDamage] forKey:keySplashDamage];
    [aCoder encodeFloat:[self requiredMP] forKey:keyRequireMP];
    [aCoder encodeInteger:[self piercingCount] forKey:keyPiercingCount];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setAirMin:[aDecoder decodeFloatForKey:keyAirMin]];
        [self setAirMax:[aDecoder decodeFloatForKey:keyAirMax]];
        [self setLandMin:[aDecoder decodeFloatForKey:keyLandMin]];
        [self setLandMax:[aDecoder decodeFloatForKey:keyLandMax]];
        [self setBulletSpeed:[aDecoder decodeFloatForKey:keyBulletSpped]];
        [self setDelayTime:[aDecoder decodeFloatForKey:keyDelayTime]];
        [self setLengthCount:[aDecoder decodeIntegerForKey:keyLengthCount]];
        [self setSprayCount:[aDecoder decodeIntegerForKey:keySprayCount]];
        [self setSplashRange:[aDecoder decodeFloatForKey:keySplashRange]];
        [self setSplashDamage:[aDecoder decodeFloatForKey:keySplashDamage]];
        [self setRequiredMP:[aDecoder decodeFloatForKey:keyRequireMP]];
        [self setPiercingCount:[aDecoder decodeIntegerForKey:keyPiercingCount]];
    }
    return self;
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    Weapon *copy = [[[self class] allocWithZone:zone] init];
    [copy setAirMin:[self airMin]];
    [copy setAirMax:[self airMax]];
    [copy setLandMin:[self landMin]];
    [copy setLandMax:[self landMax]];
    [copy setBulletSpeed:[self bulletSpeed]];
    [copy setDelayTime:[self delayTime]];
    [copy setLengthCount:[self lengthCount]];
    [copy setSprayCount:[self sprayCount]];
    [copy setSplashRange:[self splashRange]];
    [copy setSplashDamage:[self splashDamage]];
    [copy setRequiredMP:[self requiredMP]];
    [copy setPiercingCount:[self piercingCount]];
    
    return copy;
}

- (void)setAttackWithMin:(CGFloat)min Max:(CGFloat)max {
    [self setAirMin:min];
    [self setAirMax:max];
    [self setLandMin:min];
    [self setLandMax:max];
}

- (void)setAirWithMin:(CGFloat)min Max:(CGFloat)max {
    [self setAirMin:min];
    [self setAirMax:max];
}

- (void)setLandWithMin:(CGFloat)min Max:(CGFloat)max {
    [self setLandMin:min];
    [self setLandMax:max];
}

@end
