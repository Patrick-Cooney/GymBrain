//
//  Round.h
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

@property int currentRound;

- (void)incrementRound;
- (void)reset;

@end
