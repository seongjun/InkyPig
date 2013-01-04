//
//  TitleLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "TitleLayerSprite.h"

@implementation TitleLayerSprite

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];
    }
    return self;
}

- (void)create {
    CCSprite *title = [[CCSprite alloc] initWithSpriteFrameName:@"menu_title.png"];
    [title setPosition:self.position];
    [self addChild:title];
    [title release];
    
    CCSprite *touch = [[CCSprite alloc] initWithSpriteFrameName:@"menu_touch.png"];
    [touch setPosition:CGPointMake(title.position.x, 
                                   title.position.y
                                   - title.contentSize.height*0.5f
                                   - touch.contentSize.height*0.5f
                                   - 20)];
    [self addChild:touch];
    [touch release];
}

- (void)show {
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];    
}

@end
