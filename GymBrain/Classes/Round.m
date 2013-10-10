//
//  Round.m
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "Round.h"

@implementation Round


- (void)incrementRound{
    
    self.currentRound += 1;
    
}

- (void)reset{
    self.currentRound = 0;
}

@end
