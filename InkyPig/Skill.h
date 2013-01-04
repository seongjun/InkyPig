//
//  Skill.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 5..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Skill : NSObject <NSCoding, NSCopying> {
    NSInteger skillType;
    BOOL isUnlock;
    CGFloat airMin, airMax, landMin, landMax;
    CGFloat moveSpeed, bulletSpeed, delayTime;
    NSInteger lengthCount, sprayCount;
    CGFloat splashRange, splashDamage;
    CGFloat requiredMP, coolTime;
    NSInteger piercingCount;
    
    CGFloat maxHP, runningTime;
}

@property (nonatomic, readwrite) NSInteger skillType;
@property (nonatomic, readwrite) BOOL isUnlock;
@property (nonatomic, readwrite) CGFloat airMin, airMax, landMin, landMax;
@property (nonatomic, readwrite) CGFloat moveSpeed, bulletSpeed, delayTime;
@property (nonatomic, readwrite) NSInteger lengthCount, sprayCount;
@property (nonatomic, readwrite) CGFloat splashRange, splashDamage;
@property (nonatomic, readwrite) CGFloat requiredMP, coolTime;
@property (nonatomic, readwrite) NSInteger piercingCount;
@property (nonatomic, readwrite) CGFloat maxHP, runningTime;

- (void)setAttackWithMin:(CGFloat)min Max:(CGFloat)max;
- (void)setAirWithMin:(CGFloat)min Max:(CGFloat)max;
- (void)setLandWithMin:(CGFloat)min Max:(CGFloat)max;

@end
