//
//  MapData.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 8. 10..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "MapData.h"
#import "MapBlockData.h"

@implementation MapData

@synthesize mapBlocksArray;

- (id)initWithStage:(NSInteger)stage {
    if ((self = [super init])) {
        switch (stage) {
            case 1:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 2:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 3:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:6]
                                  ,nil];
                break;
            }
            case 4:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,nil];
                break;
            }
            case 5:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 6:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:8]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 7:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 8:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 9:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 10:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 11:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:9]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:9]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:9]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:3]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:1]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,nil];
                break;
            }
            case 12:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,nil];
                break;
            }
            case 13:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 14:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:9]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:11]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:13]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:13]
                                  ,nil];
                break;
            }
            case 15:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 16:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,nil];
                break;
            }
            case 17:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:8]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,nil];
                break;
            }
            case 18:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:8]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:8]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,nil];
                break;
            }
            case 19:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:3]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:3]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:1]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:3]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:3]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:1]
                                  ,nil];
                break;
            }
            case 20:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 21:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:12]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:14]
                                  ,nil];
                break;
            }
            case 22:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:4]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:6]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:8]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,nil];
                break;
            }
            case 23:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,nil];
                break;
            }
            case 24:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightTwo
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:7]
                                  ,nil];
                break;
            }
            case 25:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 26:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:2]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:7]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftTwo
                                                                positionY:9]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:11]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:11]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:11]
                                  ,nil];
                break;
            }
            case 27:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_empty
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 28:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 29:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_leftFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:10]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_rightFive
                                                                positionY:5]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
            case 30:{
                mapBlocksArray = [[NSMutableArray alloc] initWithObjects:
                                  [[MapBlockData alloc] initWithGradient:GradientType_zero
                                                               positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,[[MapBlockData alloc] initWithGradient:GradientType_zero
                                                                positionY:0]
                                  ,nil];
                break;
            }
        }
    }
    return self;
}

@end
