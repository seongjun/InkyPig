//
//  WaveData.h
//  WolfDefence
//
//  Created by Choi Seonghun on 12. 9. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefine.h"

@class EnemyData;

@interface WaveData : NSObject {
    NSMutableArray *wavesArray;
}

@property (nonatomic, retain) NSMutableArray *wavesArray;

- (id)initWithStage:(NSInteger)stage difficulty:(NSInteger)difficulty;

@end
