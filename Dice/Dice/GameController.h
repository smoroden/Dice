//
//  GameController.h
//  Dice
//
//  Created by Zach Smoroden on 2016-05-04.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"


@interface GameController : NSObject



@property (nonatomic) NSInteger topScore;


-(instancetype)init;

-(BOOL)holdDie:(NSInteger)dieNumber;
-(void)listDice;
-(void)resetDice;
-(void)rollDice;
-(BOOL)allDiceHeld;
-(NSInteger)calculateScore;
-(void)endGame;
-(void)newGame;
@end
