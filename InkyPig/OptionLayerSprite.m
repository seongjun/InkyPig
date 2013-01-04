//
//  OptionLayerSprite.m
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 26..
//  Copyright 2012년 Zemico. All rights reserved.
//

#import "MenuLayers.h"
#import "OptionLayerSprite.h"
#import "GameData.h"


@implementation OptionLayerSprite

@synthesize backButton, soundOnButton, soundOffButton, effectOnButton, effectOffButton, vibOnButton, vibOffButton;

- (id)init {
    if ((self = [super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        [self setContentSize:size];
        [self setPosition:CGPointMake(size.width*0.5f, size.height*0.5f)];
        
        [self create];

    }
    return self;
}

- (void)dealloc {
    [gameData release];
    [super dealloc];
}

- (void)create {
    backButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_common_back.png"];
    [backButton setPosition:CGPointMake(10 + backButton.contentSize.width*0.5f,
                                        self.contentSize.height - 10 - backButton.contentSize.height*0.5f)];
    [self addChild:backButton];
    [backButton release];

    soundOnButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_sound_on.png"];
    [soundOnButton setPosition:CGPointMake(self.position.x,
                                           self.contentSize.height
                                           - 50
                                           - soundOnButton.contentSize.height*0.5f)];
    [self addChild:soundOnButton];
    [soundOnButton release];
    
    soundOffButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_sound_off.png"];
    [soundOffButton setPosition:soundOnButton.position];
    [soundOffButton setVisible:NO];
    [self addChild:soundOffButton];
    [soundOffButton release];
    
    effectOnButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_effect_on.png"];
    [effectOnButton setPosition:CGPointMake(soundOnButton.position.x,
                                            soundOnButton.position.y
                                            - soundOnButton.contentSize.height*0.5f
                                            - 20
                                            - effectOnButton.contentSize.height*0.5f)];
    [self addChild:effectOnButton];
    [effectOnButton release];
    
    effectOffButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_effect_off.png"];
    [effectOffButton setPosition:effectOnButton.position];
    [effectOffButton setVisible:NO];
    [self addChild:effectOffButton];
    [effectOffButton release];
    
    vibOnButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_vib_on.png"];
    [vibOnButton setPosition:CGPointMake(soundOnButton.position.x,
                                         effectOnButton.position.y
                                         - effectOnButton.contentSize.height*0.5f
                                         - 20
                                         - vibOnButton.contentSize.height*0.5f)];
    [self addChild:vibOnButton];
    [vibOnButton release];
    
    vibOffButton = [[CCSprite alloc] initWithSpriteFrameName:@"menu_option_vib_off.png"];
    [vibOffButton setPosition:vibOnButton.position];
    [vibOffButton setVisible:NO];
    [self addChild:vibOffButton];
    [vibOffButton release];
}

- (void)show {
    
    // GameData
    CCScene *scene = [[CCDirector sharedDirector] runningScene];
    if (scene.children.count > 0) {
        CCLayer *layer = (CCLayer *)[[scene children] objectAtIndex:0];
        if ([layer isMemberOfClass:[MenuLayers class]] == YES) {
            MenuLayers *menuLayer = (MenuLayers *)layer;
            gameData = [menuLayer gameData];
            [gameData retain];
        }
    }

    [self setSound];
    [self setEffect];
    [self setVib];
    
    [self setVisible:YES];
}

- (void)hide {
    [self setVisible:NO];
}

- (void)changeSound {
    if ([gameData isSound]) {
        [gameData setIsSound:NO];
    } else {
        [gameData setIsSound:YES];
    }
    [gameData saveGameData];
    [self setSound];
}
- (void)changeEffect {
    if ([gameData isEffect]) {
        [gameData setIsEffect:NO];
    } else {
        [gameData setIsEffect:YES];
    }
    [gameData saveGameData];
    [self setEffect];
}
- (void)changeVib {
    if ([gameData isVibration]) {
        [gameData setIsVibration:NO];
    } else {
        [gameData setIsVibration:YES];
    }
    [gameData saveGameData];
    [self setVib];
}

- (void)setSound {
    if ([gameData isSound]) {
        [soundOnButton setVisible:YES];
        [soundOffButton setVisible:NO];
    }else{
        [soundOnButton setVisible:NO];
        [soundOffButton setVisible:YES];
    }
}
- (void)setEffect {
    if ([gameData isEffect]) {
        [effectOnButton setVisible:YES];
        [effectOffButton setVisible:NO];
    }else{
        [effectOnButton setVisible:NO];
        [effectOffButton setVisible:YES];
    }
}
- (void)setVib {
    if ([gameData isVibration]) {
        [vibOnButton setVisible:YES];
        [vibOffButton setVisible:NO];
    }else{
        [vibOnButton setVisible:NO];
        [vibOffButton setVisible:YES];
    }
}

@end
