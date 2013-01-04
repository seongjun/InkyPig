//
//  Tower.h
//  WolfDefence
//
//  Created by Choi Seonghun on 8/30/12.
//  Copyright (c) 2012 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tower : NSObject <NSCoding, NSCopying> {
    NSInteger level;
    CGFloat coolTime, defence;
    CGFloat maxMP, maxHP, regenerationMP;
    BOOL isSkill3, isSkill4;
}

@property (nonatomic, readwrite)NSInteger level;
@property (nonatomic, readwrite)CGFloat coolTime, defence;
@property (nonatomic, readwrite)CGFloat maxMP, maxHP, regenerationMP;
@property (nonatomic, readwrite)BOOL isSkill3, isSkill4;

- (id)initWithLevel:(NSInteger)lv defence:(CGFloat)df;

@end
