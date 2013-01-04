//
//  Weapon.h
//  WolfDefence
//
//  Created by Choi Seonghun on 8/29/12.
//  Copyright (c) 2012 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weapon : NSObject <NSCoding, NSCopying> {
    CGFloat airMin, airMax, landMin, landMax;
    CGFloat bulletSpeed, delayTime;
    NSInteger lengthCount, sprayCount;
    CGFloat splashRange, splashDamage;
    CGFloat requiredMP;
    NSInteger piercingCount;
}

@property (nonatomic, readwrite) CGFloat airMin, airMax, landMin, landMax;
@property (nonatomic, readwrite) CGFloat bulletSpeed, delayTime;
@property (nonatomic, readwrite) NSInteger lengthCount, sprayCount;
@property (nonatomic, readwrite) CGFloat splashRange, splashDamage;
@property (nonatomic, readwrite) CGFloat requiredMP;
@property (nonatomic, readwrite) NSInteger piercingCount;

- (void)setAttackWithMin:(CGFloat)min Max:(CGFloat)max;
- (void)setAirWithMin:(CGFloat)min Max:(CGFloat)max;
- (void)setLandWithMin:(CGFloat)min Max:(CGFloat)max;

@end
