//
//  MapData.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapData : NSObject {
    NSMutableArray *mapBlocksArray;
}

@property (nonatomic, retain) NSMutableArray *mapBlocksArray;

- (id)initWithStage:(NSInteger)stage;

@end
