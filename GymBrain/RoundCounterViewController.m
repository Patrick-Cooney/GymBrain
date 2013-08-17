//
//  ViewController.m
//  RoundCounter
//
//  Created by Patrick Cooney on 8/9/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "RoundCounterViewController.h"
#import "math.h"

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
    
    
    // reset the count using a swipe gesture instead of a button
    UISwipeGestureRecognizer *roundResetRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(resetCount)];
    
    /* require two finger swipe to reset so we don't accidently reset with a hurried tap where the finger may slide
     across the screen */
    roundResetRecognizer.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:roundResetRecognizer];
    
    //don't let the phone auto-lock, that would screw up our ability to log quickly and accurately!
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    taps = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)screenWasTapped { // this is the method called by the tap recognizer
    if(!_thisRound){
        _thisRound = [[Round alloc] init];
    }
    
    if (!_intervalTimer){
        _intervalTimer = [[Timer alloc] init];
    }
    
    /* determine whether we're starting or stoping based on how many times the screen has been tapped. Mod 2 means 
     we always get a 0 or a 1 to work with. Easy peasy. */
        if (taps % 2 == 0){
            [_intervalTimer stopTimer];
            //first tap was leading to NaN error. skip outputting NaN
            if (!isnan(_intervalTimer.timeElapsedInSecondsEvenTaps)){
            self.intervalLabel.text = [NSString stringWithFormat:@"%.02f",_intervalTimer.timeElapsedInSecondsEvenTaps];
            }
            taps++;
        } else {
            [_intervalTimer startTimer];
            if (!isnan(_intervalTimer.timeElapsedInSecondsOddTaps)){
                self.intervalLabel.text = [NSString stringWithFormat:@"%.02f",_intervalTimer.timeElapsedInSecondsOddTaps];
            }
            taps++;
        }
    // the timer should start on the first tap but that shouldn't register as a round tap. this delays the logging for one set
    if (taps > 1){
    [_thisRound incrementRound];
    [self updateRoundCounter];
    }
}

- (void)updateRoundCounter{
    self.roundCount.text = [NSString stringWithFormat:@"%i", _thisRound.currentRound];
    self.roundCount.textAlignment = NSTextAlignmentCenter;
}

- (void)resetCount {
    [_thisRound reset];
    self.intervalLabel.text = [NSString stringWithFormat:@""];
    
    // stop the timer, reset it, reset the taps so we can start over
    [_intervalTimer stopTimer];
    [_intervalTimer reset];
    taps = 0;
    
    [self updateRoundCounter];
}

@end
