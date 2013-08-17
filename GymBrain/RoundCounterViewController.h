//
//  ViewController.h
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"
#import "Timer.h"

@interface RoundCounterViewController : UIViewController {
    int taps;
}

@property Round *thisRound;
@property Timer *intervalTimer;
@property (strong, nonatomic) IBOutlet UILabel *roundCount;
@property (strong, nonatomic) IBOutlet UILabel *intervalLabel;

- (void)updateRoundCounter;
- (void)screenWasTapped;
- (void)resetCount;

@end
