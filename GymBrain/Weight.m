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
    _currentWeight += (weight * 2);
}

- (void)addBar:(int)barWeight{
    _currentWeight = _currentWeight + barWeight;
}

- (void)reset{
    _currentWeight = 0;
    [_weightLog removeAllObjects];
}

- (void) addSetToLog:(float)loggableWeight{
    
    NSNumber *objWeight = [NSNumber numberWithFloat:loggableWeight];
    if(!_weightLog){
        _weightLog = [[NSMutableArray alloc] init];
    }
    
    [_weightLog addObject:objWeight];
    
}

@end
