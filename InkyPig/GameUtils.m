//
//  GameUtils.m
//  Revenge1
//
//  Created by Seonghun Choi on 12. 2. 1..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#import "GameUtils.h"
#import "CharacterSprite.h"
#import "BulletSprite.h"
#import "CrashZoneNode.h"

@implementation GameUtils

// Document 디렉터리 안에 있는 파일의 경로를 돌려줍니다.
+ (NSString *)GameDataFilePath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}

+ (BOOL)isTouchInside:(CCSprite *)sprite withPosition:(CGPoint)position {
    CGFloat halfWidth = sprite.contentSize.width / 2.0;
    CGFloat halfHeight = sprite.contentSize.height / 2.0;
    if (position.x > (sprite.position.x + halfWidth) ||
        position.x < (sprite.position.x - halfWidth) ||
        position.y < (sprite.position.y - halfHeight) ||
        position.y > (sprite.position.y + halfHeight)) {
        return NO;
    }
    return YES;
}

+ (BOOL)isTouchInside:(CCSprite *)sprite withExpand:(NSInteger)expand withPosition:(CGPoint)position {
    CGFloat halfWidth = sprite.contentSize.width / 2.0 + expand;
    CGFloat halfHeight = sprite.contentSize.height / 2.0 + expand;
    if (position.x > (sprite.position.x + halfWidth) ||
        position.x < (sprite.position.x - halfWidth) ||
        position.y < (sprite.position.y - halfHeight) ||
        position.y > (sprite.position.y + halfHeight)) {
        return NO;
    }
    return YES;
}

+ (BOOL)isCrashSprite:(CCSprite *)one sprite:(CCSprite *)two {
    CGPoint oneAnchor = [one anchorPoint];
    CGPoint twoAnchor = [two anchorPoint];
    
    float oneLeft = one.contentSize.width * oneAnchor.x;
    float oneRight = one.contentSize.width - oneLeft;
    float oneBottom = one.contentSize.height * oneAnchor.y;
    float oneUpper = one.contentSize.height - oneBottom;
    
    float twoLeft = two.contentSize.width * twoAnchor.x;
    float twoRight = two.contentSize.width - twoLeft;
    float twoBottom = two.contentSize.height * twoAnchor.y;
    float twoUpper = two.contentSize.height - twoBottom;
    
    BOOL horizon = NO;
    BOOL vertical = NO;
    
    //horizon
    if (one.position.x < two.position.x) {
        if (one.position.x + oneRight > two.position.x - twoLeft) {
            horizon = YES;
        }
    } else if (one.position.x > two.position.x) {
        if (one.position.x - oneLeft < two.position.x + twoRight) {
            horizon = YES;
        }
    } else {
        horizon = YES;
    }
    
    //vertical
    if (one.position.y < two.position.y) {
        if (one.position.y + oneUpper > two.position.y - twoBottom) {
            vertical = YES;
        }
    } else if (one.position.y > two.position.y) {
        if (one.position.y - oneBottom < two.position.y + twoUpper) {
            vertical = YES;
        }
    } else {
        vertical = YES;
    }
    
    BOOL isCrash = NO;
    
    if (horizon && vertical) {
        isCrash = YES;
    }
    
    return isCrash;
}

+ (BOOL)isCrashCharacter:(CharacterSprite *)one character:(CharacterSprite *)two {

    BOOL isCrash = NO;

    for (int i=0; i<[[[one crashZones] children] count]; i++) {
        CrashZoneNode *oneZone = (CrashZoneNode *)[[[one crashZones] children] objectAtIndex:i];
        CGPoint oneAnchor = [oneZone anchorPoint];

        float oneLeft = oneZone.contentSize.width * oneAnchor.x;
        float oneRight = oneZone.contentSize.width - oneLeft;
        float oneBottom = oneZone.contentSize.height * oneAnchor.y;
        float oneUpper = oneZone.contentSize.height - oneBottom;
        
        CGPoint oneZoneWorldPosition = [self convertToWorldPosition:oneZone];
        
        for (int j=0; j<[[[two crashZones] children] count]; j++) {
            CrashZoneNode *twoZone = (CrashZoneNode *)[[[two crashZones] children] objectAtIndex:j];
            CGPoint twoAnchor = [twoZone anchorPoint];
            
            float twoLeft = twoZone.contentSize.width * twoAnchor.x;
            float twoRight = twoZone.contentSize.width - twoLeft;
            float twoBottom = twoZone.contentSize.height * twoAnchor.y;
            float twoUpper = twoZone.contentSize.height - twoBottom;
            
            CGPoint twoZoneWorldPosition = [self convertToWorldPosition:twoZone];
            
            BOOL horizon = NO;
            BOOL vertical = NO;
            
            //horizon
            if (oneZoneWorldPosition.x < twoZoneWorldPosition.x) {
                if (oneZoneWorldPosition.x + oneRight > twoZoneWorldPosition.x - twoLeft) {
                    horizon = YES;
                }
            } else if (oneZoneWorldPosition.x > twoZoneWorldPosition.x) {
                if (oneZoneWorldPosition.x - oneLeft < twoZoneWorldPosition.x + twoRight) {
                    horizon = YES;
                }
            } else {
                horizon = YES;
            }
            
            //vertical
            if (oneZoneWorldPosition.y < twoZoneWorldPosition.y) {
                if (oneZoneWorldPosition.y + oneUpper > twoZoneWorldPosition.y - twoBottom) {
                    vertical = YES;
                }
            } else if (oneZoneWorldPosition.y > twoZoneWorldPosition.y) {
                if (oneZoneWorldPosition.y - oneBottom < twoZoneWorldPosition.y + twoUpper) {
                    vertical = YES;
                }
            } else {
                vertical = YES;
            }
                        
            if (horizon && vertical) {
                isCrash = YES;
                return isCrash;
            }
        }
    }
    return isCrash;
}

+ (BOOL)isCrashBullet:(BulletSprite *)bullet character:(CharacterSprite *)chr {
    BOOL isCrash = NO;
    
    for (int i=0; i<[[[bullet crashZones] children] count]; i++) {
        CrashZoneNode *bulletZone = (CrashZoneNode *)[[[bullet crashZones] children] objectAtIndex:i];
        CGPoint bulletZoneWorldPosition = [self convertToWorldPosition:bulletZone];
        
        for (int j=0; j<[[[chr crashZones] children] count]; j++) {
            CrashZoneNode *chrZone = (CrashZoneNode *)[[[chr crashZones] children] objectAtIndex:j];
            CGPoint chrAnchor = [chrZone anchorPoint];
            
            float chrLeft = chrZone.contentSize.width * chrAnchor.x;
            float chrRight = chrZone.contentSize.width - chrLeft;
            float chrBottom = chrZone.contentSize.height * chrAnchor.y;
            float chrUpper = chrZone.contentSize.height - chrBottom;
            
            CGPoint chrZoneWorldPosition = [self convertToWorldPosition:chrZone];
            
            if (bulletZoneWorldPosition.x >= chrZoneWorldPosition.x - chrLeft &&
                bulletZoneWorldPosition.x <= chrZoneWorldPosition.x + chrRight) {
                if (bulletZoneWorldPosition.y < chrZoneWorldPosition.y) {
                    if (bulletZoneWorldPosition.y + bulletZone.radius > chrZoneWorldPosition.y - chrBottom) {
                        isCrash = YES;
                    }
                } else if (bulletZoneWorldPosition.y > chrZoneWorldPosition.y) {
                    if (bulletZoneWorldPosition.y - bulletZone.radius < chrZoneWorldPosition.y + chrUpper) {
                        isCrash = YES;
                    }
                }
            } else if (bulletZoneWorldPosition.y <= chrZoneWorldPosition.y + chrUpper &&
                       bulletZoneWorldPosition.y >= chrZoneWorldPosition.y - chrBottom) {
                if (bulletZoneWorldPosition.x < chrZoneWorldPosition.x) {
                    if (bulletZoneWorldPosition.x + bulletZone.radius > chrZoneWorldPosition.x - chrLeft) {
                        isCrash = YES;
                    }
                } else if (bulletZoneWorldPosition.x > chrZoneWorldPosition.x) {
                    if (bulletZoneWorldPosition.x - bulletZone.radius < chrZoneWorldPosition.x + chrRight) {
                        isCrash = YES;
                    }
                }
            } else {
                if (bulletZoneWorldPosition.x < chrZoneWorldPosition.x &&
                    bulletZoneWorldPosition.y < chrZoneWorldPosition.y) {
                    CGFloat distanceX = (chrZoneWorldPosition.x - chrLeft) - bulletZoneWorldPosition.x;
                    CGFloat distanceY = (chrZoneWorldPosition.y - chrBottom) - bulletZoneWorldPosition.y;
                    CGFloat distance = sqrtf(distanceX*distanceX + distanceY*distanceY);
                    if (bulletZone.radius > distance) {
                        isCrash = YES;
                    }
                } else if (bulletZoneWorldPosition.x < chrZoneWorldPosition.x &&
                           bulletZoneWorldPosition.y > chrZoneWorldPosition.y) {
                    CGFloat distanceX = (chrZoneWorldPosition.x - chrLeft) - bulletZoneWorldPosition.x;
                    CGFloat distanceY = bulletZoneWorldPosition.y - (chrZoneWorldPosition.y + chrUpper);
                    CGFloat distance = sqrtf(distanceX*distanceX + distanceY*distanceY);
                    if (bulletZone.radius > distance) {
                        isCrash = YES;
                    }
                } else if (bulletZoneWorldPosition.x > chrZoneWorldPosition.x &&
                           bulletZoneWorldPosition.y > chrZoneWorldPosition.y) {
                    CGFloat distanceX = bulletZoneWorldPosition.x - (chrZoneWorldPosition.x + chrUpper);
                    CGFloat distanceY = bulletZoneWorldPosition.y - (chrZoneWorldPosition.y + chrUpper);
                    CGFloat distance = sqrtf(distanceX*distanceX + distanceY*distanceY);
                    if (bulletZone.radius > distance) {
                        isCrash = YES;
                    }
                } else if (bulletZoneWorldPosition.x > chrZoneWorldPosition.x &&
                           bulletZoneWorldPosition.y < chrZoneWorldPosition.y) {
                    CGFloat distanceX = bulletZoneWorldPosition.x - (chrZoneWorldPosition.x + chrUpper);
                    CGFloat distanceY = (chrZoneWorldPosition.y - chrBottom) - bulletZoneWorldPosition.y;
                    CGFloat distance = sqrtf(distanceX*distanceX + distanceY*distanceY);
                    if (bulletZone.radius > distance) {
                        isCrash = YES;
                    }
                }
            }
        }
    }
    
    return isCrash;
}

+ (BOOL)isRangeCharater:(CharacterSprite *)character target:(CharacterSprite *)target {
    BOOL isRange = NO;
    
    CrashZoneNode *endCharacterZone;
    if ([[[character crashZones] children] count] == 1) {
        endCharacterZone = [[[character crashZones] children] objectAtIndex:0];
    } else if ([[[character crashZones] children] count] > 1) {
        CrashZoneNode *end = [[[character crashZones] children] objectAtIndex:0];
        for (int i=1; i<[[[character crashZones] children] count]; i++) {
            CrashZoneNode *temp = [[[character crashZones] children] objectAtIndex:i];
            if (end.position.x - end.contentSize.width*0.5f  > temp.position.x - temp.contentSize.width*0.5f) {
                end = temp;
            }
        }
        endCharacterZone = end;
    }
    
    CrashZoneNode *endTargetZone;
    if ([[[target crashZones] children] count] == 1) {
        endTargetZone = [[[target crashZones] children] objectAtIndex:0];
    } else if ([[[target crashZones] children] count] > 1) {
        CrashZoneNode *end = [[[target crashZones] children] objectAtIndex:0];
        for (int i=1; i<[[[character crashZones] children] count]; i++) {
            CrashZoneNode *temp = [[[target crashZones] children] objectAtIndex:i];
            if (end.position.x + end.contentSize.width*0.5f < temp.position.x + temp.contentSize.width*0.5f) {
                end = temp;
            }
        }
        endTargetZone = end;
    }
    CGFloat endTargetPosition = [self convertToWorldPosition:endTargetZone].x + endTargetZone.contentSize.width*0.5f;
    CGFloat endCharacterPosition = [self convertToWorldPosition:endCharacterZone].x - endCharacterZone.contentSize.width*0.5f;
    if (endTargetPosition > endCharacterPosition - character.range) {
        isRange = YES;
    }
    
    return isRange;
}

+ (CGPoint)convertToWorldPosition:(CCNode *)sprite {
    CCNode *parents = (CCNode*)[sprite parent];
    double rotation = CC_DEGREES_TO_RADIANS(-parents.rotation);
    CGPoint parentsAnchorPosition = CGPointMake(parents.contentSize.width
                                                * parents.anchorPoint.x,
                                                parents.contentSize.height
                                                * parents.anchorPoint.y);
    CGPoint worldPosition = CGPointMake(parents.position.x
                                        + (sprite.position.x - parentsAnchorPosition.x),
                                        parents.position.y
                                        + (sprite.position.y - parentsAnchorPosition.y));
    
    return ccpRotateByAngle(worldPosition, parents.position, rotation);
}

+ (CCSprite *)maskedSpriteWithSprite:(CCSprite *)textureSprite maskSprite:(CCSprite *)maskSprite {
    
    // 1
    CCRenderTexture * rt = [CCRenderTexture renderTextureWithWidth:maskSprite.contentSizeInPixels.width height:maskSprite.contentSizeInPixels.height];
    
    // 2
    maskSprite.position = ccp(maskSprite.contentSize.width/2, maskSprite.contentSize.height/2);
    textureSprite.position = ccp(textureSprite.contentSize.width/2, textureSprite.contentSize.height/2);
    
    // 3
    [maskSprite setBlendFunc:(ccBlendFunc){GL_ONE, GL_ZERO}];
    [textureSprite setBlendFunc:(ccBlendFunc){GL_DST_ALPHA, GL_ZERO}];
    
    // 4
    [rt begin];
    [maskSprite visit];
    [textureSprite visit];
    [rt end];
    
    // 5
    CCSprite *retval = [CCSprite spriteWithTexture:rt.sprite.texture];
    retval.flipY = YES;
    return retval;
    
}

@end
