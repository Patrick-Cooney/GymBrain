//
//  WeightCalculator.m
//  CrossCount
//
//  Created by Patrick Cooney on 7/22/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "Weight.h"

@implementation Weight


- (void)addWeight:(float)weight {
    self.currentWeight += (weight * 2);
}

- (void)addBar:(int)barWeight{
    self.currentWeight = _currentWeight + barWeight;
}

- (void)reset{
    self.currentWeight = 0;
    [self.weightLog removeAllObjects];
}

- (void) addSetToLog:(float)loggableWeight{
    
    NSNumber *objWeight = [NSNumber numberWithFloat:loggableWeight];
    if(!self.weightLog){
        self.weightLog = [[NSMutableArray alloc] init];
    }
    
    [self.weightLog addObject:objWeight];
    
}

@end
