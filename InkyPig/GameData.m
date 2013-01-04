//
//  GameData.m
//  Bubble_Pong
//
//  Created by Seonghun Choi on 12. 4. 5..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "GameData.h"
#import "GameUtils.h"
#import "Weapon.h"
#import "Tower.h"
#import "Skill.h"
#import "Tree.h"

#define SAVE_VERSION @"1.0.1"

@implementation GameData

@synthesize version;
@synthesize isSound, isEffect, isVibration;
@synthesize goldCount;
@synthesize selectedStage, selectedDifficult;
@synthesize vulcan, missile, laser;
@synthesize tower;
@synthesize skillCannon1, skillCannon2, skillCannon3, skillCannon4;
@synthesize skillMissile1, skillMissile2, skillMissile3, skillMissile4;
@synthesize skillLaser1, skillLaser2, skillLaser3, skillLaser4;
@synthesize treeCannon, treeMissile, treeLaser;

#define GAME_DATA_KEY @"GameData"

//* class method start //
+ (BOOL)hasSaveGameData {
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[GameUtils GameDataFilePath:GAME_DATA_FILENAME]];
    if (data == nil) {
        return NO;
    }
    [data release];
    
    return YES;
}

+ (GameData *)loadGameData {
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[GameUtils GameDataFilePath:GAME_DATA_FILENAME]];
    if (data == nil) {
        return nil;
    }
    
    // NSData에 들어 있는 데이터를 디코드하여 GameData오브젝트에 넣습니다.
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    GameData *tmpGameData = [unarchiver decodeObjectForKey:GAME_DATA_KEY];
    [unarchiver finishDecoding];
    [unarchiver release];
    [data release];
    
    return tmpGameData;
}
// class method end //*/

//* overide method start //
- (id)init {
    if ((self = [super init])) {
        version = SAVE_VERSION;
        
        isSound = YES;
        isVibration = YES;
        
        goldCount = 0;
                
        selectedStage = 0;
        selectedDifficult = 0;
        
        vulcan = [[Weapon alloc] init];
        [vulcan setAttackWithMin:3 Max:4];
        [vulcan setBulletSpeed:6.0f];
        [vulcan setDelayTime:0.25f];
        [vulcan setSprayCount:1];
        [vulcan setLengthCount:1];
        [vulcan setRequiredMP:2];
        //[vulcan release];
        
        missile = [[Weapon alloc] init];
        [missile setAirWithMin:2 Max:3];
        [missile setLandWithMin:4.5f Max:6];
        [missile setBulletSpeed:6.0f];
        [missile setDelayTime:0.5f];
        [missile setSprayCount:4];
        [missile setLengthCount:1];
        [missile setSplashRange:2.0f];
        [missile setSplashDamage:0.115f];
        [missile setRequiredMP:2];
        //[missile release];
        
        laser = [[Weapon alloc] init];
        [laser setAirWithMin:1 Max:3];
        [laser setLandWithMin:0.5f Max:2];
        [laser setBulletSpeed:6.0f];
        [laser setDelayTime:1.0f];
        [laser setSprayCount:1];
        [laser setLengthCount:1];
        [laser setRequiredMP:2];
        //[laser release];
        
        tower = [[Tower alloc] initWithLevel:1 defence:0.1f];
        [tower setMaxHP:100];
        [tower setMaxMP:100];
        //[tower release];
        
        skillCannon1 = [[Skill alloc] init];
        //[skillCannon1 release];
        skillCannon2 = [[Skill alloc] init];
        //[skillCannon2 release];
        skillCannon3 = [[Skill alloc] init];
        //[skillCannon3 release];
        skillCannon4 = [[Skill alloc] init];
        //[skillCannon4 release];
        [skillCannon1 setIsUnlock:YES];
        
        skillMissile1 = [[Skill alloc] init];
        //[skillMissile1 release];
        skillMissile2 = [[Skill alloc] init];
        //[skillMissile2 release];
        skillMissile3 = [[Skill alloc] init];
        //[skillMissile3 release];
        skillMissile4 = [[Skill alloc] init];
        //[skillMissile4 release];
        [skillMissile1 setIsUnlock:YES];
        
        skillLaser1 = [[Skill alloc] init];
        //[skillLaser1 release];
        skillLaser2 = [[Skill alloc] init];
        //[skillLaser2 release];
        skillLaser3 = [[Skill alloc] init];
        //[skillLaser3 release];
        skillLaser4 = [[Skill alloc] init];
        //[skillLaser4 release];
        [skillLaser1 setIsUnlock:YES];
        
        treeCannon = [[NSMutableArray alloc] init];
        for (int i=1; i<=16; i++) {
            Tree *tree = [[Tree alloc] init];
            [treeCannon addObject:tree];
            [tree release];
        }
        for (int i=0; i<=2; i++) {
            Tree *cannon = [treeCannon objectAtIndex:i];
            [cannon setCurrentLevel:1];
            if (i==2) {
                [cannon setMaxLevel:4];
            } else {
                [cannon setMaxLevel:20];
            }
        }
        for (int i=3; i<=14; i++) {
            Tree *cannon = [treeCannon objectAtIndex:i];
            [cannon setMaxLevel:5];
        }
        Tree *cannon = [treeCannon objectAtIndex:15];
        [cannon setMaxLevel:1];
        //[treeCannon release];
        
        
        treeMissile = [[NSMutableArray alloc] init];
        for (int i=1; i<=16; i++) {
            Tree *tree = [[Tree alloc] init];
            [treeMissile addObject:tree];
            [tree release];
        }
        for (int i=0; i<=2; i++) {
            Tree *missile1 = [treeMissile objectAtIndex:i];
            [missile1 setCurrentLevel:1];
            if (i==2) {
                [missile1 setMaxLevel:4];
            } else {
                [missile1 setMaxLevel:20];
            }
        }
        for (int i=3; i<=14; i++) {
            Tree *missile1 = [treeMissile objectAtIndex:i];
            [missile1 setMaxLevel:5];
        }
        Tree *missile1 = [treeMissile objectAtIndex:15];
        [missile1 setMaxLevel:1];
        //[treeMissile release];
        
        treeLaser = [[NSMutableArray alloc] init];
        for (int i=1; i<=16; i++) {
            Tree *tree = [[Tree alloc] init];
            [treeLaser addObject:tree];
            [tree release];
        }
        for (int i=0; i<=12; i++) {
            Tree *laser1 = [treeLaser objectAtIndex:i];
            [laser1 setCurrentLevel:1];
            if (i==2) {
                [laser1 setMaxLevel:4];
            } else {
                [laser1 setMaxLevel:20];
            }
        }
        for (int i=3; i<=14; i++) {
            Tree *laser1 = [treeLaser objectAtIndex:i];
            [laser1 setMaxLevel:5];
        }
        Tree *laser1 = [treeLaser objectAtIndex:15];
        [laser1 setMaxLevel:1];
        //[treeLaser release];
    }
    return self;
}

- (void)dealloc {
    [version release];
    
    [vulcan release];
    [missile release];
    [laser release];
    [tower release];
    
    [skillCannon1 release];
    [skillCannon2 release];
    [skillCannon3 release];
    [skillCannon4 release];
    [skillMissile1 release];
    [skillMissile2 release];
    [skillMissile3 release];
    [skillMissile4 release];
    [skillLaser1 release];
    [skillLaser2 release];
    [skillLaser3 release];
    [skillLaser4 release];
    
    [treeCannon release];
    [treeMissile release];
    [treeLaser release];
    
    [super dealloc];
}
// overide method end //*/

//* member method start //
- (void)saveGameData {
    // NSMutableData에 key-value 형태로 아카이브한 후 파일에 저장합니다.
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:GAME_DATA_KEY];
    [archiver finishEncoding];
    NSString *temp = [GameUtils GameDataFilePath:GAME_DATA_FILENAME];
    NSLog(@"%@", temp);
    [data writeToFile:temp atomically:YES];
    [archiver release];
    [data release];
}
// member method end //*/

//* NSCoding, NSCopying Start //
#define keyVersion              @"Version"
#define keyIsSound              @"IsSound"
#define keyIsEffect             @"IsEffect"
#define keyIsVibration          @"IsVibration"
#define keyGoldCount            @"GoldCount"
#define keySelectedStage        @"SelectedStage"
#define keySelectedDifficult    @"SelectedDifficult"
#define keyVulcan               @"Vulcan"
#define keyMissile              @"Missile"
#define keyLaser                @"Laser"
#define keyTower                @"Tower"
#define keySkillCannon1         @"SkillCannon1"
#define keySkillCannon2         @"SkillCannon2"
#define keySkillCannon3         @"SkillCannon3"
#define keySkillCannon4         @"SkillCannon4"
#define keySkillMissile1        @"SkillMissile1"
#define keySkillMissile2        @"SkillMissile2"
#define keySkillMissile3        @"SkillMissile3"
#define keySkillMissile4        @"SkillMissile4"
#define keySkillLaser1          @"SkillLaser1"
#define keySkillLaser2          @"SkillLaser2"
#define keySkillLaser3          @"SkillLaser3"
#define keySkillLaser4          @"SkillLaser4"
#define keyTreeCannon           @"TreeCannon"
#define keyTreeMissile          @"TreeMissile"
#define keyTreeLaser            @"TreeLaser"

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[self version] forKey:keyVersion];
    [aCoder encodeBool:[self isSound] forKey:keyIsSound];
    [aCoder encodeBool:[self isEffect] forKey:keyIsEffect];
    [aCoder encodeBool:[self isVibration] forKey:keyIsVibration];
    [aCoder encodeInteger:[self goldCount] forKey:keyGoldCount];
    [aCoder encodeInteger:[self selectedStage] forKey:keySelectedStage];
    [aCoder encodeInteger:[self selectedDifficult] forKey:keySelectedDifficult];
    [aCoder encodeObject:[self vulcan] forKey:keyVulcan];
    [aCoder encodeObject:[self missile] forKey:keyMissile];
    [aCoder encodeObject:[self laser] forKey:keyLaser];
    [aCoder encodeObject:[self tower] forKey:keyTower];
    [aCoder encodeObject:[self skillCannon1] forKey:keySkillCannon1];
    [aCoder encodeObject:[self skillCannon2] forKey:keySkillCannon2];
    [aCoder encodeObject:[self skillCannon3] forKey:keySkillCannon3];
    [aCoder encodeObject:[self skillCannon4] forKey:keySkillCannon4];
    [aCoder encodeObject:[self skillMissile1] forKey:keySkillMissile1];
    [aCoder encodeObject:[self skillMissile2] forKey:keySkillMissile2];
    [aCoder encodeObject:[self skillMissile3] forKey:keySkillMissile3];
    [aCoder encodeObject:[self skillMissile4] forKey:keySkillMissile4];
    [aCoder encodeObject:[self skillLaser1] forKey:keySkillLaser1];
    [aCoder encodeObject:[self skillLaser2] forKey:keySkillLaser2];
    [aCoder encodeObject:[self skillLaser3] forKey:keySkillLaser3];
    [aCoder encodeObject:[self skillLaser4] forKey:keySkillLaser4];
    [aCoder encodeObject:[self treeCannon] forKey:keyTreeCannon];
    [aCoder encodeObject:[self treeMissile] forKey:keyTreeMissile];
    [aCoder encodeObject:[self treeLaser] forKey:keyTreeLaser];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init])) {
        [self setVersion:[aDecoder decodeObjectForKey:keyVersion]];
        [self setIsSound:[aDecoder decodeBoolForKey:keyIsSound]];
        [self setIsEffect:[aDecoder decodeBoolForKey:keyIsEffect]];
        [self setIsVibration:[aDecoder decodeBoolForKey:keyIsVibration]];
        [self setGoldCount:[aDecoder decodeIntegerForKey:keyGoldCount]];
        [self setSelectedStage:[aDecoder decodeIntegerForKey:keySelectedStage]];
        [self setSelectedDifficult:[aDecoder decodeIntegerForKey:keySelectedDifficult]];
        [self setVulcan:[aDecoder decodeObjectForKey:keyVulcan]];
        [self setMissile:[aDecoder decodeObjectForKey:keyMissile]];
        [self setLaser:[aDecoder decodeObjectForKey:keyLaser]];
        [self setTower:[aDecoder decodeObjectForKey:keyTower]];
        [self setSkillCannon1:[aDecoder decodeObjectForKey:keySkillCannon1]];
        [self setSkillCannon2:[aDecoder decodeObjectForKey:keySkillCannon2]];
        [self setSkillCannon3:[aDecoder decodeObjectForKey:keySkillCannon3]];
        [self setSkillCannon4:[aDecoder decodeObjectForKey:keySkillCannon4]];
        [self setSkillMissile1:[aDecoder decodeObjectForKey:keySkillMissile1]];
        [self setSkillMissile2:[aDecoder decodeObjectForKey:keySkillMissile2]];
        [self setSkillMissile3:[aDecoder decodeObjectForKey:keySkillMissile3]];
        [self setSkillMissile4:[aDecoder decodeObjectForKey:keySkillMissile4]];
        [self setSkillLaser1:[aDecoder decodeObjectForKey:keySkillLaser1]];
        [self setSkillLaser2:[aDecoder decodeObjectForKey:keySkillLaser2]];
        [self setSkillLaser3:[aDecoder decodeObjectForKey:keySkillLaser3]];
        [self setSkillLaser4:[aDecoder decodeObjectForKey:keySkillLaser4]];
        [self setTreeCannon:[aDecoder decodeObjectForKey:keyTreeCannon]];
        [self setTreeMissile:[aDecoder decodeObjectForKey:keyTreeMissile]];
        [self setTreeLaser:[aDecoder decodeObjectForKey:keyTreeLaser]];
    }
    return self;
}

#pragma mark NSCopying
- (id)copyWithZone:(NSZone *)zone {
    GameData *copy = [[[self class] allocWithZone:zone] init];
    [copy setVersion:[self version]];
    [copy setIsSound:[self isSound]];
    [copy setIsEffect:[self isEffect]];
    [copy setIsVibration:[self isVibration]];
    [copy setGoldCount:[self goldCount]];
    [copy setSelectedStage:[self selectedStage]];
    [copy setSelectedDifficult:[self selectedDifficult]];
    [copy setVulcan:[self vulcan]];
    [copy setMissile:[self missile]];
    [copy setLaser:[self laser]];
    [copy setTower:[self tower]];
    [copy setSkillCannon1:[self skillCannon1]];
    [copy setSkillCannon2:[self skillCannon2]];
    [copy setSkillCannon3:[self skillCannon3]];
    [copy setSkillCannon4:[self skillCannon4]];
    [copy setSkillMissile1:[self skillMissile1]];
    [copy setSkillMissile2:[self skillMissile2]];
    [copy setSkillMissile3:[self skillMissile3]];
    [copy setSkillMissile4:[self skillMissile4]];
    [copy setSkillLaser1:[self skillLaser1]];
    [copy setSkillLaser2:[self skillLaser2]];
    [copy setSkillLaser3:[self skillLaser3]];
    [copy setSkillLaser4:[self skillLaser4]];
    [copy setTreeCannon:[self treeCannon]];
    [copy setTreeMissile:[self treeMissile]];
    [copy setTreeLaser:[self treeLaser]];
    
    return copy;
}
// NSCoding, NSCopying End //*/

@end
