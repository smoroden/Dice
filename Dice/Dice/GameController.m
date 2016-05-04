//
//  GameController.m
//  Dice
//
//  Created by Zach Smoroden on 2016-05-04.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "GameController.h"

@implementation GameController


-(instancetype)init {
    self = [super init];
    if (self){
        self.dice = [NSMutableArray arrayWithObjects:[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], nil];
        
        self.heldDice = [NSMutableSet set];
    }
    
    return self;
}

-(void)holdDie:(int)dieNumber {
    [self.heldDice containsObject:self.dice[dieNumber]] ? [self.heldDice removeObject:self.dice[dieNumber]] : [self.heldDice addObject:self.dice[dieNumber]];
        
    
}
-(void)listDice {
    
    for (int i = 0; i < self.dice.count; i ++) {
        NSString *output;
        Dice *die = self.dice[i];
        output = [self.heldDice containsObject:self.dice[i]] ? output = [NSString stringWithFormat:@"Die %d: [%@]", i, die.currentValue] : [NSString stringWithFormat:@"Die %d: %@", i, die.currentValue];
        
        NSLog(@"%@", output);
    }
    
}
-(void)rollDice {
    for (Dice * die in self.dice) {
        if (![self.heldDice containsObject:die]) {
            [die roll];
        }
    }
}

-(void)resetDice {
    [self.heldDice removeAllObjects];
}

-(BOOL)allDiceHeld {
    return self.heldDice.count == 5 ? YES : NO;
}


@end
