//
//  GameUtils.h
//  Revenge1
//
//  Created by Seonghun Choi on 12. 2. 1..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CharacterSprite;
@class BulletSprite;

@interface GameUtils : NSObject
// 게임 데이터를 저장하는 파일의 경로를 돌려줍니다.
+ (NSString *)GameDataFilePath:(NSString *)fileName;

+ (BOOL)isTouchInside:(CCSprite *)sprite withPosition:(CGPoint)position;
+ (BOOL)isTouchInside:(CCSprite *)sprite withExpand:(NSInteger)expand withPosition:(CGPoint)position;

+ (BOOL)isCrashSprite:(CCSprite *)one sprite:(CCSprite *)two;

+ (BOOL)isCrashCharacter:(CharacterSprite *)one character:(CharacterSprite *)two;
+ (BOOL)isCrashBullet:(BulletSprite *)bullet character:(CharacterSprite *)chr;
+ (BOOL)isRangeCharater:(CharacterSprite *)character target:(CharacterSprite *)target;

+ (CGPoint)convertToWorldPosition:(CCNode*)sprite;

+ (CCSprite *)maskedSpriteWithSprite:(CCSprite *)textureSprite maskSprite:(CCSprite *)maskSprite;

@end
