//
//  ViewController.m
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "RoundCounterViewController.h"

@interface RoundCounterViewController ()

@end

@implementation RoundCounterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // allow user to tap anywhere in the view to increment the count
    UITapGestureRecognizer *roundTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(screenWasTapped)];
    roundTapRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:roundTapRecognizer];
    
    
    //reset the count using a swipe gesture instead of a button
    UISwipeGestureRecognizer *roundResetRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(resetCount)];
    
    /*require two finger swipe to reset so we don't accidently reset with a hurried tap where the finger may slide
     across the screen*/
    roundResetRecognizer.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:roundResetRecognizer];
    
    //don't let the phone auto-lock, that would screw up our ability to log quickly and accurately!
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)screenWasTapped { //this is the method caled by the tap recognizer
    if(!_thisRound){
        _thisRound = [[Round alloc] init];
    }
    
    [_thisRound incrementRound];
    [self updateRoundCounter];
}

- (void)updateRoundCounter{
    self.roundCount.text = [NSString stringWithFormat:@"%i", _thisRound.currentRound];
    self.roundCount.textAlignment = NSTextAlignmentCenter;
}

- (void)resetCount {
    [_thisRound reset];
    [self updateRoundCounter];
}

@end
