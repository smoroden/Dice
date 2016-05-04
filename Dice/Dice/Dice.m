//
//  Dice.m
//  Dice
//
//  Created by Zach Smoroden on 2016-05-04.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(instancetype)init {
    self = [super init];
    if (self) {
        self.currentValue = arc4random_uniform(6) + 1;
    }
    
    return self;
}

-(void)roll {
    self.currentValue = arc4random_uniform(6) + 1;
}

@end
