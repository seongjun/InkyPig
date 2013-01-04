//
//  GameDefine.h
//  WolfDefence
//
//  Created by Seonghun Choi on 12. 7. 23..
//  Copyright (c) 2012년 Zemico. All rights reserved.
//

#ifndef WolfDefence_GameDefine_h
#define WolfDefence_GameDefine_h

#define Game_Test NO

typedef enum {
    tagMenu_Title,
    tagMenu_MainMenu,
    tagMenu_DifficultySelect,
    tagMenu_StageSelect
}tagMenu;

typedef enum {
    tagMainMenu_Play,
    tagMainMenu_Option,
    tagMainMenu_Info
}tagMainMenu;

typedef enum {
    tagDifficultySelect_Back,
    tagDifficultySelect_Normal,
    tagDifficultySelect_Hard,
    tagDifficultySelect_Infinity
}tagDifficultySelect;

typedef enum {
    tagStageSelect_Back,
    tagStageSelect_StageBoard,
    tagStageSelect_Upgrade
}tagStageSelect;

typedef enum {
    tagGameHero_Tower,
    tagGameHero_Bullet,
    tagGameHero_Wall
}tagGameHero;

typedef enum {
    GradientType_leftFive = -5,
    GradientType_leftTwo = -2,
    GradientType_zero = 0,
    GradientType_rightTwo = 2,
    GradientType_rightFive = 5,
    GradientType_empty = 9
}GradientType;

typedef enum {
    StateEnemy_Move,
    StateEnemy_Attack,
    StateEnemy_die,
    StateEnemy_hit,
    StateEnemy_hold
}StateEnemy;

typedef enum {
    TypeEnemy_Air,
    TypeEnemy_Land,
    TypeEnemy_Boss_Air,
    TypeEnemy_Boss_Land
}TypeEnemy;

#define GAME_FLOOR 70.0f
#define GAME_HEIGHT 15.0f
#define GAME_METER 40.0f


#endif
