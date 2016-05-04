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
        
        NSLog(@"------Welcome to ThreeLow!------");
        NSLog(@"The goal of the game is to get the lowest score possible.");
        NSLog(@"You must hold at least one (1) die before you may roll.");
        
        while (1) {
            input = [ic inputForPrompt:@"Availible commands:\n hold [die number] - holds the die at the current value or releases a currently held die\n roll - rolls all of the un-held dice\n reset - clears all held dice\n new-game - resets the top score\n"];
        }
    }
    return 0;
}
