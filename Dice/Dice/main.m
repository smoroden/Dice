//
//  main.m
//  Dice
//
//  Created by Zach Smoroden on 2016-05-04.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // ⚀ ⚁ ⚂ ⚃ ⚄ ⚅

        GameController *gc = [[GameController alloc] init];
        [gc listDice];
//        [gc holdDie:1];
//        [gc listDice];
//        [gc rollDice];
//        [gc listDice];
        
        InputCollector *ic = [[InputCollector alloc] init];
        NSString *input;
        NSString *command;
        NSString *data;
        NSInteger numRolls = 0;
        
        BOOL hasHeld = NO;
        
        NSLog(@"\n------Welcome to ThreeLow!------");
        NSLog(@"The goal of the game is to get the lowest score possible.");
        NSLog(@"You must hold at least one (1) die before you may roll.");
        NSLog(@"You are only allowed up to five (5) rolls.");
        
        while (1) {
            if ([gc allDiceHeld] || numRolls == 5) {
                [gc endGame];
                numRolls = 0;
                
                input = [ic inputForPrompt:@"Would you like to play again? (y/n)"];
                if ([[input lowercaseString] isEqualToString:@"n"]) {
                    NSLog(@"Thanks for playing!");
                    break;
                }
            }
            
            input = [ic inputForPrompt:@"Availible commands:\n hold [die number] - holds the die at the current value or releases a currently held die\n roll - rolls all of the un-held dice\n reset - clears all held dice\n new-game - resets the top score\n quit - quits the game"];
            NSLog(@"Number of rolls: %ld", numRolls);
            
            // We only ever care about the first and second words. This splits them up.
            NSArray *components = [input componentsSeparatedByString:@" "];
            command = components[0];
            if (components.count > 1) {
                data = [input componentsSeparatedByString:@" "][1];
            }
            
            // Now we call the proper methods based on what command we are given
            if ([command isEqualToString:@"quit"]) {
                NSLog(@"Thanks for playing!");
                break;
            } else if ([command isEqualToString:@"hold"]) {
                if (data == nil) {
                    NSLog(@"You must give a number with the hold command.");
                } else {
                    hasHeld = [gc holdDie:[data integerValue]];
                }
            } else if ([command isEqualToString:@"roll"]) {
                if (hasHeld) {
                    numRolls++;
                    [gc rollDice];
                    hasHeld = NO;
                } else {
                    NSLog(@"You need to hold at least one die before you can roll.");
                }
            } else if ([command isEqualToString:@"reset"]) {
                [gc resetDice];
                hasHeld = NO;
            } else if ([command isEqualToString:@"new-game"]) {
                [gc newGame];
                numRolls = 0;
            } else if ([command isEqualToString:@"rollll"]) {
                [gc cheat];
                [gc endGame];
            } else {
                NSLog(@"Invalid command.");
            }
            
            [gc listDice];
        }
    }
    return 0;
}
