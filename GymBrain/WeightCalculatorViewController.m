//
//  ViewController.m
//  test
//
//  Created by Patrick Cooney on 7/23/13.
//  Copyright (c) 2013 Patrick Cooney. All rights reserved.
//

#import "WeightCalculatorViewController.h"

@interface WeightCalculatorViewController ()

@end

@implementation WeightCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _calculate = [[Weight alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateCurrentWeightLabel {
    self.weightLabel.text = [NSString stringWithFormat:@"%.0f", _calculate.currentWeight];
}

- (void) resetWeightLog {
    
    //set all labels to blank strings
    _labelSetOne.text = @"";
    _labelSetTwo.text = @"";
    _labelSetThree.text = @"";
    _labelSetFour.text = @"";
    _labelSetFive.text = @"";
    _labelSetSix.text = @"";
    _labelSetSeven.text = @"";
    _labelSetEight.text = @"";
}

- (void) updateWeightLogLabel:(UILabel *)label{
    label.text = [NSString stringWithFormat:@"%.0f", _calculate.currentWeight];
}

- (void) displayWeightLog {
    NSUInteger arrayCount = _calculate.weightLog.count;
    switch (arrayCount) {
        case 0:
            //do nothing
            break;
        case 1:
            [self updateWeightLogLabel:_labelSetOne];
            break;
        case 2:
            [self updateWeightLogLabel:_labelSetTwo];
            break;
        case 3:
            [self updateWeightLogLabel:_labelSetThree];
            break;
        case 4:
            [self updateWeightLogLabel:_labelSetFour];
            break;
        case 5:
            [self updateWeightLogLabel:_labelSetFive];
            break;
        case 6:
           [self updateWeightLogLabel:_labelSetSix];
            break;
        case 7:
            [self updateWeightLogLabel:_labelSetSeven];
            break;
        case 8:
            [self updateWeightLogLabel:_labelSetEight];
            break;
        default:
            break;
    }
    
    /*if the count is greater than 8 shift everything up one set each time the log button is hit
    and drop the oldest set off the screen */
    
    if(arrayCount > 8){
        _labelSetOne.text = _labelSetTwo.text;
        _labelSetTwo.text = _labelSetThree.text;
        _labelSetThree.text = _labelSetFour.text;
        _labelSetFour.text = _labelSetFive.text;
        _labelSetFive.text = _labelSetSix.text;
        _labelSetSix.text = _labelSetSeven.text;
        _labelSetSeven.text = _labelSetEight.text;
        _labelSetEight.text = [NSString stringWithFormat:@"%.0f", _calculate.currentWeight];
    }
}

- (IBAction)logWeight:(id)sender {
    [_calculate addSetToLog:_calculate.currentWeight];
    [self displayWeightLog];
}

- (IBAction)reset:(id)sender {
    [_calculate reset];
    [self updateCurrentWeightLabel];
    [self resetWeightLog];

}

- (IBAction)addTwoAndAHalfPounds:(id)sender {
    [_calculate addWeight:2.5];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFivePounds:(id)sender {
    [_calculate addWeight:5.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addTenPounds:(id)sender {
    [_calculate addWeight:10.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addTwentyFivePounds:(id)sender {
    [_calculate addWeight:25.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addThirtyFivePounds:(id)sender {
    [_calculate addWeight:35.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFourtyFivePounds:(id)sender {
    [_calculate addWeight:45.0];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFifteenPoundBar:(id)sender {
    [_calculate addBar:15];
    [self updateCurrentWeightLabel];
}

- (IBAction)addFourtyFivePoundBar:(id)sender {
    [_calculate addBar:45];
    [self updateCurrentWeightLabel];
}

@end
