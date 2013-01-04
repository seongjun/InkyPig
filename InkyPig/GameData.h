//
//  GameData.h
//  Bubble_Pong
//
//  Created by Seonghun Choi on 12. 4. 5..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GAME_DATA_FILENAME @"GameDataFile"

@class Weapon;
@class Tower;
@class Skill;

@interface GameData : NSObject <NSCoding, NSCopying> {
    NSString *version;
    BOOL isSound;
    BOOL isEffect;
    BOOL isVibration;
    
    NSInteger goldCount;
    
    NSInteger selectedStage;
    NSInteger selectedDifficult;
    
    Weapon *vulcan, *missile, *laser;
    Tower *tower;
    Skill *skillCannon1, *skillCannon2, *skillCannon3, *skillCannon4;
    Skill *skillMissile1, *skillMissile2, *skillMissile3, *skillMissile4;
    Skill *skillLaser1, *skillLaser2, *skillLaser3, *skillLaser4;
    
    NSMutableArray *treeCannon, *treeMissile, *treeLaser;
}

@property (nonatomic, retain) NSString *version;
@property (nonatomic, readwrite) BOOL isSound, isEffect, isVibration;
@property (nonatomic, readwrite) NSInteger goldCount;
@property (nonatomic, readwrite) NSInteger selectedStage, selectedDifficult;
@property (nonatomic, retain) Weapon *vulcan, *missile, *laser;
@property (nonatomic, retain) Tower *tower;
@property (nonatomic, retain) Skill *skillCannon1, *skillCannon2, *skillCannon3, *skillCannon4;
@property (nonatomic, retain) Skill *skillMissile1, *skillMissile2, *skillMissile3, *skillMissile4;
@property (nonatomic, retain) Skill *skillLaser1, *skillLaser2, *skillLaser3, *skillLaser4;
@property (nonatomic, retain) NSMutableArray *treeCannon, *treeMissile, *treeLaser;
//* class method start //
+ (BOOL)hasSaveGameData;

+ (GameData *)loadGameData;
// class method end //*/

//* member method start //
- (void)saveGameData;
// member method end //*/

@end
