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
    
    _currentRound += 1;
    
}

- (void)reset{
    _currentRound = 0;
}

@end
