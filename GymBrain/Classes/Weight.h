//
//  WeightCalculator.h
//  CrossCount
//
//  Created by Patrick Cooney on 7/22/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weight : NSObject

@property float currentWeight;
@property (nonatomic, strong) NSMutableArray *weightLog;

- (void)addWeight:(float)weight;
- (void)addBar:(int)barWeight;
- (void)addSetToLog:(float)loggableWeight;
- (void)reset;
@end
