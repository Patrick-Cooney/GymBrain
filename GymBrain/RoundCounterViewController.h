//
//  ViewController.h
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"

@interface RoundCounterViewController : UIViewController

@property Round *thisRound;
@property (strong, nonatomic) IBOutlet UILabel *roundCount;

- (void)updateRoundCounter;
- (void)screenWasTapped;
- (void)resetCount;

@end
