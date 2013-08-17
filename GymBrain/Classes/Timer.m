//
//  Timer.m
//  GymBrain
//
//  Created by Patrick Cooney on 8/15/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "Timer.h"

@implementation Timer

- (id) init {
    self = [super init];
    if (self != nil) {
        start = nil;
        end = nil;
    }
    return self;
}

- (void) startTimer {
    start = [NSDate date];
}

- (void) stopTimer {
    end = [NSDate date];
}

// This is probably a bad way to reset the timer but for now it's the only way I can think of.
- (id) reset {
    return [self init];
}

// creating separate methods is the easiest way to avoid negative numbers
- (double) timeElapsedInSecondsEvenTaps {
    return [end timeIntervalSinceDate:start];
}

- (double) timeElapsedInSecondsOddTaps {
    return [start timeIntervalSinceDate:end];
}

@end
