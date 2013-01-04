//
//  Skill.m
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 5..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "Skill.h"

@implementation Skill

@synthesize skillType;
@synthesize isUnlock;
@synthesize airMin, airMax, landMin, landMax;
@synthesize moveSpeed, bulletSpeed, delayTime;
@synthesize lengthCount, sprayCount;
@synthesize splashRange, splashDamage;
@synthesize requiredMP, coolTime;
@synthesize piercingCount;
@synthesize maxHP, runningTime;

#pragma mark Overriding
- (id)init {
    if ((self = [super init])) {
        [self setSkillType:0];
        [self setIsUnlock:NO];
        [self setAirMin:0];
        [self setAirMax:0];
        [self setLandMin:0];
        [self setLandMax:0];
        [self setMoveSpeed:0];
        [self setBulletSpeed:0];
        [self setDelayTime:0];
        [self setLengthCount:0];
        [self setSprayCount:0];
        [self setSplashRange:0];
        [self setSplashDamage:0];
        [self setRequiredMP:0];
        [self setCoolTime:0];
        [self setPiercingCount:0];
        
        [self setMaxHP:0];
        [self setRunningTime:0];
    }
    
    return self;
}

#define keySkillType            @"SkillType"
#define keyIsUnlock             @"IsUnlock"
#define keyAirMin               @"AirMin"
#define keyAirMax               @"AirMax"
#define keyLandMin              @"LandMin"
#define keyLandMax              @"LandMax"
#define keyMoveSpped            @"MoveSpeed"
#define keyBulletSpeed          @"BulletSpeed"
#define keyDelayTime            @"DelayTime"
#define keyLengthCount          @"LengthCount"
#define keySprayCount           @"SprayCount"
#define keySplashRange          @"SplashRange"
#define keySplashDamage         @"SplashDamage"
#define keyRequireMP            @"RequireMP"
#define keyCoolTime             @"CoolTime"
#define keyPiercingCount        @"PiercingCount"
#define keyMaxHP                @"MaxHP"
#define keyRunningTime          @"RunningTime"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:[self skillType] forKey:keySkillType];
    [aCoder encodeBool:[self isUnlock] forKey:keyIsUnlock];
    [aCoder encodeFloat:[self airMin] forKey:keyAirMin];
    [aCoder encodeFloat:[self airMax] forKey:keyAirMax];
    [aCoder encodeFloat:[self landMin] forKey:keyLandMin];
    [aCoder encodeFloat:[self landMax] forKey:keyLandMax];
    [aCoder encodeFloat:[self moveSpeed] forKey:keyMoveSpped];
    [aCoder encodeFloat:[self bulletSpeed] forKey:keyBulletSpeed];
    [aCoder encodeFloat:[self delayTime] forKey:keyDelayTime];
    [aCoder encodeInteger:[self lengthCount] forKey:keyLengthCount];
    [aCoder encodeInteger:[self sprayCount] forKey:keySprayCount];
    [aCoder encodeFloat:[self splashRange] forKey:keySplashRange];
    [aCoder encodeFloat:[self splashDamage] forKey:keySplashDamage];
    [aCoder encodeFloat:[self requiredMP] forKey:keyRequireMP];
    [aCoder encodeFloat:[self coolTime] forKey:keyCoolTime];
    [aCoder encodeInteger:[self piercingCount] forKey:keyPiercingCount];
    
    [aCoder encodeFloat:[self maxHP] forKey:keyMaxHP];
    [aCoder encodeFloat:[self runningTime] forKey:keyRunningTime];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setSkillType:[aDecoder decodeIntegerForKey:keySkillType]];
        [self setIsUnlock:[aDecoder decodeBoolForKey:keyIsUnlock]];
        [self setAirMin:[aDecoder decodeFloatForKey:keyAirMin]];
        [self setAirMax:[aDecoder decodeFloatForKey:keyAirMax]];
        [self setLandMin:[aDecoder decodeFloatForKey:keyLandMin]];
        [self setLandMax:[aDecoder decodeFloatForKey:keyLandMax]];
        [self setMoveSpeed:[aDecoder decodeFloatForKey:keyMoveSpped]];
        [self setBulletSpeed:[aDecoder decodeFloatForKey:keyBulletSpeed]];
        [self setDelayTime:[aDecoder decodeFloatForKey:keyDelayTime]];
        [self setLengthCount:[aDecoder decodeIntegerForKey:keyLengthCount]];
        [self setSprayCount:[aDecoder decodeIntegerForKey:keySprayCount]];
        [self setSplashRange:[aDecoder decodeFloatForKey:keySplashRange]];
        [self setSplashDamage:[aDecoder decodeFloatForKey:keySplashDamage]];
        [self setRequiredMP:[aDecoder decodeFloatForKey:keyRequireMP]];
        [self setCoolTime:[aDecoder decodeFloatForKey:keyCoolTime]];
        [self setPiercingCount:[aDecoder decodeIntegerForKey:keyPiercingCount]];
        
        [self setMaxHP:[aDecoder decodeFloatForKey:keyMaxHP]];
        [self setRunningTime:[aDecoder decodeFloatForKey:keyRunningTime]];
    }
    return self;
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    Skill *copy = [[[self class] allocWithZone:zone] init];
    [copy setSkillType:[self skillType]];
    [copy setIsUnlock:[self isUnlock]];
    [copy setAirMin:[self airMin]];
    [copy setAirMax:[self airMax]];
    [copy setLandMin:[self landMin]];
    [copy setLandMax:[self landMax]];
    [copy setMoveSpeed:[self moveSpeed]];
    [copy setBulletSpeed:[self bulletSpeed]];
    [copy setDelayTime:[self delayTime]];
    [copy setLengthCount:[self lengthCount]];
    [copy setSprayCount:[self sprayCount]];
    [copy setSplashRange:[self splashRange]];
    [copy setSplashDamage:[self splashDamage]];
    [copy setRequiredMP:[self requiredMP]];
    [copy setCoolTime:[self coolTime]];
    [copy setPiercingCount:[self piercingCount]];
    
    [copy setMaxHP:[self maxHP]];
    [copy setRunningTime:[self runningTime]];
    
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
