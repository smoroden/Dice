//
//  GameController.m
//  Dice
//
//  Created by Zach Smoroden on 2016-05-04.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "GameController.h"

@interface GameController()

@property (nonatomic) NSMutableSet *heldDice;
@property (nonatomic) NSMutableArray *dice;

@end

@implementation GameController


-(instancetype)init {
    self = [super init];
    if (self){
        self.dice = [NSMutableArray arrayWithObjects:[[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], [[Dice alloc] init], nil];
        
        self.heldDice = [NSMutableSet set];
        self.topScore = 30;
    }
    
    return self;
}

-(BOOL)holdDie:(NSInteger)dieNumber {
    if (dieNumber < 0 || dieNumber > self.dice.count - 1) {
        NSLog(@"Invalid die number to hold.");
        return NO;
    } else {
        [self.heldDice containsObject:self.dice[dieNumber]] ? [self.heldDice removeObject:self.dice[dieNumber]] : [self.heldDice addObject:self.dice[dieNumber]];
        return YES;
    }
    
    
}
-(void)listDice {
    
    for (int i = 0; i < self.dice.count; i ++) {
        NSString *output;
        Dice *die = self.dice[i];
        output = [self.heldDice containsObject:self.dice[i]] ? output = [NSString stringWithFormat:@"Die %d: [%ld]", i, (long)die.currentValue] : [NSString stringWithFormat:@"Die %d: %ld", i, (long)die.currentValue];
        
        NSLog(@"%@", output);
    }
    
    NSLog(@"Your current score is: %ld", (long)[self calculateScore]);
    NSLog(@"The current top score is: %ld", (long)self.topScore);
    
}
-(void)rollDice {
    NSLog(@"Rolling.........");
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

-(NSInteger)calculateScore {
    NSInteger score = 0;
    for (Dice * die in self.dice) {
        score += die.currentValue;
    }
    
    return score;
}

-(void)endGame {
    if ([self calculateScore] <= self.topScore) {
        NSLog(@"Congratulations! You set the high score with %ld!", (long)[self calculateScore]);
        self.topScore = [self calculateScore];
    } else {
        NSLog(@"Round finished. Your score was: %ld. The top score is %ld. Better luck next time.", (long)[self calculateScore], (long)self.topScore);
    }
    [self resetDice];
    [self rollDice];
}

-(void)newGame {
    [self endGame];
    NSLog(@"Resetting the high score........");
    self.topScore = 30;
}


@end
