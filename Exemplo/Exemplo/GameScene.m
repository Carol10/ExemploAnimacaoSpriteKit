//
//  GameScene.m
//  Exemplo
//
//  Created by Ana Caroline Saraiva Bezerra on 21/05/15.
//  Copyright (c) 2015 Ana Caroline Saraiva Bezerra. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

//é preciso criar um pasta chamada "nome.atlas"
//essa pasta deve conter todas as sprites da sua animação.

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    SKTextureAtlas *batAtlas = [SKTextureAtlas atlasNamed:@"ZubatSprites"];
    
    NSMutableArray *frames = [NSMutableArray new];
    textureArray = [NSMutableArray new];
    
    frames = (NSMutableArray*) [batAtlas textureNames];
    
    //ordenar imagens
    frames = (NSMutableArray*) [frames sortedArrayUsingSelector:@selector(localizedStandardCompare:)];
    
    for (filename in frames) {
        SKTexture *texture = [batAtlas textureNamed:filename];
        [textureArray addObject:texture];
    }
    
    SKTexture *initImage = [textureArray objectAtIndex:0];
    
    bat = [SKSpriteNode spriteNodeWithTexture:initImage];
    bat.position = CGPointMake(500, 500);
    [bat setScale:1.5];
    
    [self addChild:bat];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    //para a imagens se animar com um click
    [bat runAction:[SKAction animateWithTextures:textureArray timePerFrame:0.025f]];

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
