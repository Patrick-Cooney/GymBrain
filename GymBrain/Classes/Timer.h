//
//  Timer.h
//  GymBrain
//
//  Created by Patrick Cooney on 8/15/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject {
    NSDate *start;
    NSDate *end;
}

- (void) startTimer;
- (void) stopTimer;
- (id) reset;
- (double) timeElapsedInSecondsOddTaps;
- (double) timeElapsedInSecondsEvenTaps;

@end
